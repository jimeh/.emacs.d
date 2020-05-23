;;; siren-reformatter.el --- jimeh's Emacs Siren: reformatter-mode configuration.

;;; Commentary:

;; Basic configuration for reformatter-mode.

;;; Code:

(use-package reformatter
  :defer t

  :config
  (with-eval-after-load 'reformatter
    ;; Provide a better replace buffer contents implementation based on how
    ;; go-mode replaces buffer content after formatting code with gofmt.
    (defun reformatter-replace-buffer-contents-from-file (file)
      "Replace the accessible portion of the current buffer with
the contents of FILE."
      (let* ((coding-system-for-read 'utf-8)
             (coding-system-for-write 'utf-8)
             (patchbuf (get-buffer-create "*Reformatter Patch*")))

        (unwind-protect
            (save-restriction
              (widen)
              (with-current-buffer patchbuf (erase-buffer))
              (call-process-region (point-min) (point-max)
                                   "diff" nil patchbuf nil "-n" "-" file)
              (if (> (buffer-size patchbuf) 0)
                  (reformatter--apply-rcs-patch patchbuf)))

          (kill-buffer patchbuf)))))

  (defun reformatter--apply-rcs-patch (patch-buffer)
    "Apply an RCS-formatted diff from PATCH-BUFFER to the current buffer."
    (let ((target-buffer (current-buffer))
          ;; Relative offset between buffer line numbers and line numbers
          ;; in patch.
          ;;
          ;; Line numbers in the patch are based on the source file, so
          ;; we have to keep an offset when making changes to the
          ;; buffer.
          ;;
          ;; Appending lines decrements the offset (possibly making it
          ;; negative), deleting lines increments it. This order
          ;; simplifies the forward-line invocations.
          (line-offset 0)
          (column (current-column)))
      (save-excursion
        (with-current-buffer patch-buffer
          (goto-char (point-min))
          (while (not (eobp))
            (unless (looking-at "^\\([ad]\\)\\([0-9]+\\) \\([0-9]+\\)")
              (error "Invalid rcs patch or internal error in reformatter--apply-rcs-patch"))
            (forward-line)
            (let ((action (match-string 1))
                  (from (string-to-number (match-string 2)))
                  (len  (string-to-number (match-string 3))))
              (cond
               ((equal action "a")
                (let ((start (point)))
                  (forward-line len)
                  (let ((text (buffer-substring start (point))))
                    (with-current-buffer target-buffer
                      (cl-decf line-offset len)
                      (goto-char (point-min))
                      (forward-line (- from len line-offset))
                      (insert text)))))
               ((equal action "d")
                (with-current-buffer target-buffer
                  (reformatter--goto-line (- from line-offset))
                  (cl-incf line-offset len)
                  (reformatter--delete-whole-line len)))
               (t
                (error "Invalid rcs patch or internal error in reformatter--apply-rcs-patch")))))))
      (move-to-column column)))

  (defun reformatter--goto-line (line)
    (goto-char (point-min))
    (forward-line (1- line)))

  (defun reformatter--delete-whole-line (&optional arg)
    "Delete the current line without putting it in the `kill-ring'.
Derived from function `kill-whole-line'.  ARG is defined as for that
function."
    (setq arg (or arg 1))
    (if (and (> arg 0)
             (eobp)
             (save-excursion (forward-visible-line 0) (eobp)))
        (signal 'end-of-buffer nil))
    (if (and (< arg 0)
             (bobp)
             (save-excursion (end-of-visible-line) (bobp)))
        (signal 'beginning-of-buffer nil))
    (cond ((zerop arg)
           (delete-region (progn (forward-visible-line 0) (point))
                          (progn (end-of-visible-line) (point))))
          ((< arg 0)
           (delete-region (progn (end-of-visible-line) (point))
                          (progn (forward-visible-line (1+ arg))
                                 (unless (bobp)
                                   (backward-char))
                                 (point))))
          (t
           (delete-region (progn (forward-visible-line 0) (point))
                          (progn (forward-visible-line arg) (point)))))))

(provide 'siren-reformatter)
;;; siren-reformatter.el ends here
