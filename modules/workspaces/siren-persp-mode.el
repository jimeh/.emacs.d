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
        ("C-z C-e" . siren-persp-mode-edit-names-cache))

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

  (defun siren-persp-before-switch-hook (name frame)
    "Store the persp we're switching away from as the most recently active."
    (when (framep frame)
      (let ((recent-list (frame-parameter frame 'persp-recent-persps))
            (current-persp (safe-persp-name (get-current-persp))))
        (set-frame-parameter frame 'persp-recent-persps
                             (append (list current-persp)
                                     (delete current-persp recent-list))))))

  (defun siren-persp-before-kill-hook (persp)
    "Remove the killed perspective's name from persp-recent-persps."
    (let* ((frame (selected-frame))
          (recent-list (frame-parameter frame 'persp-recent-persps))
          (persp-name (safe-persp-name persp))
          (current-persp (safe-persp-name (get-current-persp))))
      (set-frame-parameter frame 'persp-recent-persps
                           (delete persp-name recent-list))
      (if (equal persp-name current-persp)
          (siren-persp-mode-switch-to-most-recent))))

  (defun siren-persp-activated-hook (type)
    "Remove any persp names from recent list that no longer exist."
    (let* ((frame (selected-frame))
           (recent-list (frame-parameter frame 'persp-recent-persps))
           (perspectives (persp-names-current-frame-fast-ordered))
           (current-persp (safe-persp-name (get-current-persp))))
      (setq recent-list (delete current-persp recent-list))
      (dolist (persp-name recent-list)
        (if (not (member persp-name perspectives))
            (setq recent-list (delete persp-name recent-list))))
      (set-frame-parameter frame 'persp-recent-persps recent-list)))

  (defun siren-persp-mode-switch-to-most-recent ()
    "Switch to the most recently active persp."
    (interactive)
    (let* ((frame (selected-frame))
           (persp-name (car (frame-parameter frame 'persp-recent-persps))))
      (if (member persp-name (persp-names-current-frame-fast-ordered))
          (persp-frame-switch persp-name frame)
        (message "perspective %s is no longer available" persp-name))))

  (defun siren-persp-mode-show-current-perspective-name (&rest _)
    "Show current perspectives, highlighting the active one."
    (interactive)
    (let ((perspectives (persp-names-current-frame-fast-ordered))
          (current-persp-name (safe-persp-name (get-current-persp)))
          (output ""))
      (dolist (persp-name perspectives)
        (setq output
              (concat output (if (string= current-persp-name persp-name)
                                 (propertize persp-name
                                             'face 'persp-face-lighter-default)
                               persp-name)
                      " ")))
      (message "perspectives: %s" output)))

  :config
  (add-hook 'persp-common-buffer-filter-functions
            'siren-persp-mode-filter-magit-buffers)

  (add-hook 'persp-before-switch-functions 'siren-persp-before-switch-hook)
  (add-hook 'persp-before-kill-functions 'siren-persp-before-kill-hook)
  (add-hook 'persp-activated-functions 'siren-persp-activated-hook)

  (add-hook 'persp-activated-functions
            'siren-persp-mode-show-current-perspective-name))

(provide 'siren-persp-mode)
;;; siren-persp-mode.el ends here
