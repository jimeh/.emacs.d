;;; siren-json.el --- jimeh's Emacs Siren: json-mode configuration.

;;; Commentary:

;; Basic configuration for json-mode.

;;; Code:

(require 'siren-eslintd-fix)
(require 'siren-folding)
(require 'siren-programming)

(use-package omnifmt
  :ensure nil ;; loaded from vendor
  )

(use-package json-mode
  :mode "\\.json\\'"
  :requires (flycheck highlight-indentation omnifmt hideshowvis)

  :bind (:map json-mode-map
              ("C-j" . newline-and-indent)
              ("C-c C-h" . siren-toggle-hiding))

  :init
  (defun siren-json-mode-setup ()
    "Default tweaks for `json-mode'."
    (siren-prog-mode-setup)

    (let ((width 2))
      (setq js-indent-level width)
      (setq json-reformat:indent-width width)
      (setq tab-width width)
      (highlight-indentation-set-offset width))

    (setq flycheck-checker 'json-jsonlint)

    (eslintd-fix-mode -1)
    (omnifmt-mode +1)
    (company-mode +1)
    (subword-mode +1)
    (hs-minor-mode 1)
    (highlight-indentation-current-column-mode)
    (hideshowvis-enable))

  :hook
  (json-mode . siren-json-mode-setup))

(provide 'siren-json)
;;; siren-js.el ends here
