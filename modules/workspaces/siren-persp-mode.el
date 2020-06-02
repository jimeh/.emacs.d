;;; siren-persp-mode.el --- jimeh's Emacs Siren: persp-mode configuration.

;;; Commentary:

;; Basic configuration for persp-mode.

;;; Code:

(require 'siren-refine)

(use-package persp-mode
  :hook
  (emacs-startup . persp-mode)

  :bind
  ("s-}" . persp-next)
  ("s-{" . persp-prev)
  (:map persp-mode-map
        ("C-z n" . persp-next)
        ("C-z C-n" . persp-next)
        ("C-z p" . persp-prev)
        ("C-z C-p" . persp-prev)
        ("C-z s" . persp-frame-switch)
        ("C-z C-s" . persp-frame-switch)
        ("C-z S" . persp-window-switch)
        ("C-z r" . persp-rename)
        ("C-z C-r" . persp-rename)
        ("C-z c" . persp-copy)
        ("C-z C-c" . persp-copy)
        ("C-z C" . persp-kill)
        ("C-z z" . persp-save-and-kill)
        ("C-z a" . persp-add-buffer)
        ("C-z C-a" . persp-add-buffer)
        ("C-z b" . persp-switch-to-buffer)
        ("C-z C-b" . siren-persp-mode-ibuffer)
        ("C-z t" . persp-temporarily-display-buffer)
        ("C-z i" . persp-import-buffers)
        ("C-z I" . persp-import-win-conf)
        ("C-z k" . persp-remove-buffer)
        ("C-z C-k" . persp-remove-buffer)
        ("C-z K" . persp-kill-buffer)
        ("C-z w" . persp-save-state-to-file)
        ("C-z W" . persp-save-to-file-by-names)
        ("C-z C-l" . siren-persp-mode-switch-to-most-recent)
        ("C-z l" . persp-load-state-from-file)
        ("C-z L" . persp-load-from-file-by-names)
        ("C-z ;" . siren-persp-mode-show-current-perspective-name)
        ("C-z C-;" . siren-persp-mode-show-current-perspective-name)
        ("C-z e" . siren-persp-mode-edit-names-cache)
        ("C-z C-e" . siren-persp-mode-edit-names-cache)
        ("C-z 0" . siren-persp-switch-to-index-0)
        ("C-z 1" . siren-persp-switch-to-index-1)
        ("C-z 2" . siren-persp-switch-to-index-2)
        ("C-z 3" . siren-persp-switch-to-index-3)
        ("C-z 4" . siren-persp-switch-to-index-4)
        ("C-z 5" . siren-persp-switch-to-index-5)
        ("C-z 6" . siren-persp-switch-to-index-6)
        ("C-z 7" . siren-persp-switch-to-index-7)
        ("C-z 8" . siren-persp-switch-to-index-8)
        ("C-z 9" . siren-persp-switch-to-index-9))

  :custom
  (persp-auto-save-num-of-backups 10)
  (persp-autokill-buffer-on-remove 'kill-weak)
  (persp-keymap-prefix "")
  (persp-nil-name "nil")

  :init
  ;; Do not auto save/load in terminal. My main instance of Emacs runs in GUI,
  ;; terminal based instances are for smaller random things.
  (when (not window-system)
    (setq persp-auto-resume-time -1
          persp-auto-save-opt 0))

  (defun siren-persp-mode-filter-magit-buffers (buf)
    (string-prefix-p "magit" (buffer-name buf)))

  (defun siren-persp-mode-ibuffer (arg)
      (interactive "P")
    (with-persp-buffer-list () (ibuffer arg)))

  (defun siren-persp-mode-edit-names-cache ()
    "Use refine package to edit persp-names-cache variable."
    (interactive)
    (refine 'persp-names-cache))

  (defun siren-persp-before-kill-hook (persp)
    "Remove the killed perspective's name from persp-recent-persps."
    (let* ((frame (selected-frame))
           (recent-list (frame-parameter frame 'persp-recent-persps))
           (most-recent (nth 1 recent-list))
           (persp-name (safe-persp-name persp))
           (current-persp (safe-persp-name (get-current-persp))))

      (set-frame-parameter frame 'persp-recent-persps
                           (delete persp-name recent-list))
      (set-frame-parameter frame 'persp-recent-just-killed persp-name)

      (if (and most-recent (equal persp-name current-persp))
        (persp-frame-switch most-recent frame))))

  (defun siren-persp-activated-hook (type)
    "Remove any persp names from recent list that no longer exist."
    (let* ((frame (selected-frame))
           (recent-list (frame-parameter frame 'persp-recent-persps))
           (perspectives (persp-names-current-frame-fast-ordered))
           (current-persp (safe-persp-name (get-current-persp))))

      ;; And/move current persp name to beginning of recent list.
      (setq recent-list (append (list current-persp)
                                (delete current-persp recent-list)))

      ;; Perform safetly clean-up of recent list.
      (dolist (persp-name recent-list)
        (when (not (member persp-name perspectives))
          (message "WARNING: perspective %s in recent list does not exist.")
          (setq recent-list (delete persp-name recent-list))))

      (set-frame-parameter frame 'persp-recent-persps recent-list)))

  (defun siren-persp-mode-switch-to-most-recent ()
    "Switch to the most recently active persp."
    (interactive)
    (let* ((frame (selected-frame))
           (most-recent (nth 1 (frame-parameter frame 'persp-recent-persps))))

      (if most-recent
          (if (member most-recent (persp-names-current-frame-fast-ordered))
              (persp-frame-switch most-recent frame)
            (message "perspective %s is no longer available" most-recent)))))

  (defun siren-persp-mode-show-current-perspective-name (&rest _)
    "Show current perspectives, highlighting the active one."
    (interactive)
    (let* ((frame (selected-frame))
           (just-killed (frame-parameter frame 'persp-recent-just-killed))
           (perspectives (persp-names-current-frame-fast-ordered))
           (current-persp-name (safe-persp-name (get-current-persp)))
           (output "")
           (index 0))
      (dolist (persp-name perspectives)
        (when (not (equal persp-name just-killed))
          (setq output
                (concat output
                        (propertize (format "%d:" index) 'face
                                    'persp-face-lighter-nil-persp)
                        (if (string= current-persp-name persp-name)
                            (propertize persp-name
                                        'face 'persp-face-lighter-default)
                          persp-name)
                        " ")
                index (1+ index))))
      (set-frame-parameter frame 'persp-recent-just-killed nil)
      (message "perspectives: %s" output)))

  (defmacro siren-persp-switch-to-index-builder (index)
    `(defun ,(intern (format "siren-persp-switch-to-index-%d" index)) ()
       ,(format "Switch to perspective with index %d" index)
       (interactive)
       (let ((persp-name (nth ,index
                              (persp-names-current-frame-fast-ordered))))
         (if persp-name (persp-switch persp-name)))))

  (siren-persp-switch-to-index-builder 0)
  (siren-persp-switch-to-index-builder 1)
  (siren-persp-switch-to-index-builder 2)
  (siren-persp-switch-to-index-builder 3)
  (siren-persp-switch-to-index-builder 4)
  (siren-persp-switch-to-index-builder 5)
  (siren-persp-switch-to-index-builder 6)
  (siren-persp-switch-to-index-builder 7)
  (siren-persp-switch-to-index-builder 8)
  (siren-persp-switch-to-index-builder 9)

  :config
  (add-hook 'persp-common-buffer-filter-functions
            'siren-persp-mode-filter-magit-buffers)

  (add-hook 'persp-before-kill-functions 'siren-persp-before-kill-hook)
  (add-hook 'persp-activated-functions 'siren-persp-activated-hook)

  (add-hook 'persp-activated-functions
            'siren-persp-mode-show-current-perspective-name))

(provide 'siren-persp-mode)
;;; siren-persp-mode.el ends here
