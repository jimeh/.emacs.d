;;; siren-persp-mode.el --- jimeh's Emacs Siren: persp-mode configuration.

;;; Commentary:

;; Basic configuration for persp-mode.

;;; Code:

(use-package persp-mode
  :demand
  :hook
  (after-init . persp-mode)

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
        ("C-z l" . persp-load-state-from-file)
        ("C-z L" . persp-load-from-file-by-names)
        ("C-z ;" . siren-persp-mode-show-current-perspective-name)
        ("C-z C-;" . siren-persp-mode-show-current-perspective-name))

  :custom
  (persp-auto-save-num-of-backups 10)
  (persp-autokill-buffer-on-remove 'kill-weak)
  (persp-interactive-completion-system 'ido)
  (persp-keymap-prefix "")
  (persp-nil-name "nil")

  :init
  (defun siren-persp-mode-ibuffer (arg)
      (interactive "P")
    (with-persp-buffer-list () (ibuffer arg)))

  (defun siren-persp-mode-show-current-perspective-name (&rest _)
    "Show current perspectives, highlighting the active one."
    (interactive)
    (let ((perspectives (persp-names-current-frame-fast-ordered))
          (active-persp-name (safe-persp-name (get-current-persp)))
          (output ""))
      (dolist (current-name perspectives)
        (message "%s" current-name)
        (setq output
              (concat output (if (string= active-persp-name current-name)
                                 (propertize current-name
                                             'face 'persp-face-lighter-default)
                               current-name)
                      " ")))
      (message "perspectives: %s" output)))

  :config
  (add-hook 'persp-activated-functions
            #'siren-persp-mode-show-current-perspective-name))

(provide 'siren-persp-mode)
;;; siren-persp-mode.el ends here
