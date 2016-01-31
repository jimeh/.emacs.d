;;; siren-haml.el --- jimeh's Emacs Siren: haml-mode configuration.

;;; Commentary:

;; Basic configuration for haml-mode.

;;; Code:

(siren-require-packages '(haml-mode))

(require 'siren-programming)

(add-to-list 'auto-mode-alist '("\\.hamlc\\'" . haml-mode))

(defun siren-haml-mode-defaults ()
  (siren-prog-mode-defaults)
  (setq tab-width 2)
  (setq highlight-indentation-offset 2)
  (highlight-indentation-mode)
  (highlight-indentation-current-column-mode))

(setq siren-haml-mode-hook 'siren-haml-mode-defaults)

(add-hook 'haml-mode-hook (lambda () (run-hooks 'siren-haml-mode-hook)))

(provide 'siren-haml)
;;; siren-haml.el ends here
