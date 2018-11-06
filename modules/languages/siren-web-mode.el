;;; siren-web-mode.el --- jimeh's Emacs Siren: web-mode configuration.

;;; Commentary:

;; Basic configuration for web-mode.

;;; Code:

(require 'siren-company)
(require 'siren-fci)
(require 'siren-folding)
(require 'siren-highlight-indentation)

(use-package web-mode
  :mode
  "\\.html\\'"
  "\\.html.erb\\'"

  :bind (:map web-mode-map
              ("C-j" . newline-and-indent)
              ("C-c C-h" . siren-toggle-hiding))

  :hook
  (web-mode . siren-web-mode-setup)

  :init
  (defun siren-web-mode-setup ()
    "Default tweaks for `web-mode'."
    (setq tab-width 2)

    (company-mode +1)
    (fci-mode -1)
    (hideshowvis-enable)
    (hs-minor-mode +1)
    (highlight-indentation-current-column-mode)
    (highlight-indentation-set-offset 2)
    (subword-mode +1))

  :config
  (setq web-mode-code-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-markup-indent-offset 2
        web-mode-sql-indent-offset 2))

(provide 'siren-web-mode)
;;; siren-web-mode.el ends here
