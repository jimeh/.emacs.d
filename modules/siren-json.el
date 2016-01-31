;;; siren-json.el --- jimeh's Emacs Siren: json-mode configuration.

;;; Commentary:

;; Basic configuration for json-mode.

;;; Code:

(require 'siren-programming)

(siren-require-packages '(json-mode))

(defun siren-json-mode-defaults ()
  "Default tweaks for `json-mode'."
  (siren-prog-mode-defaults)

  (let ((indent-width 2))
    (setq js-indent-level indent-width)
    (setq json-reformat:indent-width indent-width)
    (setq tab-width indent-width)
    (highlight-indentation-set-offset indent-width))

  (company-mode +1)
  (subword-mode +1)
  (hs-minor-mode 1)
  (highlight-indentation-mode)
  (highlight-indentation-current-column-mode)

  (let ((map json-mode-map))
    (define-key map (kbd "C-j") 'newline-and-indent)
    (define-key map (kbd "C-c C-h") 'toggle-hiding)))

(setq siren-json-mode-hook 'siren-json-mode-defaults)

(add-hook 'json-mode-hook (lambda ()
                            (run-hooks 'siren-json-mode-hook)))

(provide 'siren-json)
;;; siren-js.el ends here
