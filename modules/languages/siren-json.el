;;; siren-json.el --- jimeh's Emacs Siren: json-mode configuration.

;;; Commentary:

;; Basic configuration for json-mode.

;;; Code:

(require 'siren-eslintd-fix)
(require 'siren-folding)

(use-package json-mode
  :mode "\\.json\\'"
  :requires (flycheck highlight-indentation omnifmt hideshowvis)

  :bind (:map json-mode-map
              ("C-j" . newline-and-indent)
              ("C-c C-h" . siren-toggle-hiding))

  :hook
  (json-mode . siren-json-mode-setup)

  :init
  (defun siren-json-mode-setup ()
    "Default tweaks for `json-mode'."

    (let ((width 2))
      (setq js-indent-level width)
      (setq json-reformat:indent-width width)
      (setq tab-width width)
      (highlight-indentation-set-offset width))

    (setq flycheck-checker 'json-jsonlint)))

(provide 'siren-json)
;;; siren-js.el ends here
