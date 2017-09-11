;;; siren-json.el --- jimeh's Emacs Siren: json-mode configuration.

;;; Commentary:

;; Basic configuration for json-mode.

;;; Code:

(use-package json-mode
  :mode "\\.json\\'"
  :config
  (require 'siren-programming)
  (require 'omnifmt)

  (defun siren-json-mode-defaults ()
    "Default tweaks for `json-mode'."
    (siren-prog-mode-defaults)

    (let ((width 2))
      (setq js-indent-level width)
      (setq json-reformat:indent-width width)
      (setq tab-width width)
      (highlight-indentation-set-offset width))

    (setq flycheck-checker 'json-jsonlint)

    (eslintd-fix-mode -1)
    (omnifmt-mode)
    (company-mode +1)
    (subword-mode +1)
    (hs-minor-mode 1)
    (highlight-indentation-current-column-mode)
    (hideshowvis-enable)
    (let ((map json-mode-map))
      (define-key map (kbd "C-j") 'newline-and-indent)
      (define-key map (kbd "C-c C-h") 'siren-toggle-hiding)))

  (setq siren-json-mode-hook 'siren-json-mode-defaults)
  (add-hook 'json-mode-hook (lambda ()
                              (run-hooks 'siren-json-mode-hook))))

(provide 'siren-json)
;;; siren-js.el ends here
