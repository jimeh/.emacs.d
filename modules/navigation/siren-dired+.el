;;; siren-dired+.el --- jimeh's Emacs Siren: dired+ configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for dired+.

;;; Code:

(use-package dired+
  :defer t
  :general
  (:keymaps 'dired-mode-map
            "C-l" 'diredp-up-directory-reuse-dir-buffer)

  :hook
  (dired-mode . siren-diredp-mode-setup)

  :preface
  (defun siren-diredp-mode-setup ()
    (toggle-diredp-find-file-reuse-dir 1))

  :config
  (unbind-key "M-b" dired-mode-map)
  (unbind-key "M-i" dired-mode-map)
  (unbind-key "M-l" dired-mode-map)

  (when (not (fboundp 'dired-pop-to-buffer))
    ;; Emacs 29.x has removed the legacy dired-pop-to-buffer function from dired
    ;; in commit 1f29ee2d21b57e81a28550a1b31bc8a39406d17b.
    ;;
    ;; Dired+ depends heavily on dired-pop-to-buffer, so here we re-define the
    ;; version that was removed from Emacs.
    (defun dired-pop-to-buffer (buf)
      "Pop up buffer BUF in a way suitable for Dired."
      (declare (obsolete pop-to-buffer "24.3"))
      (let ((split-window-preferred-function
             (lambda (window)
               (or (and (let ((split-height-threshold 0))
                          (window-splittable-p (selected-window)))
                        ;; Try to split the selected window vertically if
                        ;; that's possible.  (Bug#1806)
                        (split-window-below))
                   ;; Otherwise, try to split WINDOW sensibly.
                   (split-window-sensibly window))))
            pop-up-frames)
        (pop-to-buffer (get-buffer-create buf)))
      ;; See Bug#12281.
      (set-window-start nil (point-min))
      ;; Try to not delete window when we want to display less than
      ;; `window-min-height' lines.
      (fit-window-to-buffer (get-buffer-window buf) nil 1 nil nil t))))

(provide 'siren-dired+)
;;; siren-dired+.el ends here
