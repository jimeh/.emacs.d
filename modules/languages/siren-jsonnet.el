;;; siren-jsonnet.el --- jimeh's Emacs Siren: jsonnet-mode configuration.

;;; Commentary:

;; Basic configuration for jsonnet-mode.

;;; Code:

(use-package jsonnet-mode
  :general
  (:keymaps 'jsonnet-mode-map
            "C-c C-c" 'jsonnet-eval-buffer
            "C-c C-f" 'jsonnet-reformat-buffer
            "C-c C-j" 'jsonnet-jump)

  :hook
  (jsonnet-mode . siren-jsonnet-mode-setup)

  :custom
  (jsonnet-library-search-directories '("vendor"))

  :preface
  (defun siren-jsonnet-mode-setup ()
    "Default tweaks for `jsonnet-mode'."
    (jsonnet-format-buffer-on-save-mode t)
    (siren-folding))

  :config
  (with-eval-after-load 'flycheck
    (setq flycheck-jsonnet-executable "jsonnet -jpath vendor"))

  (define-minor-mode jsonnet-format-buffer-on-save-mode
    "Run jsonnet-format-buffer as a before-save-hook."
    :lighter " fmt"
    (if jsonnet-format-buffer-on-save-mode
        (add-hook 'before-save-hook 'jsonnet-reformat-buffer t t)
      (remove-hook 'before-save-hook 'jsonnet-reformat-buffer t))))

(provide 'siren-jsonnet)
;;; siren-js.el ends here
