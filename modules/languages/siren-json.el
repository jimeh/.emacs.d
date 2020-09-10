;;; siren-json.el --- jimeh's Emacs Siren: json-mode configuration.

;;; Commentary:

;; Basic configuration for json-mode.

;;; Code:

(require 'siren-flycheck)
(require 'siren-folding)
(require 'siren-js)

(use-package json-mode
  :mode "\\.json\\'"

  :bind (:map json-mode-map
              ("C-j" . newline-and-indent)
              ("C-c C-h" . siren-folding-toggle))

  :hook
  (json-mode . siren-json-mode-setup)

  :init
  (defun siren-json-mode-setup ()
    "Default tweaks for `json-mode'."

    (let ((width 2))
      (setq js-indent-level width
            json-reformat:indent-width width
            tab-width width))

    (setq flycheck-checker 'json-jsonlint)))

(provide 'siren-json)
;;; siren-js.el ends here
