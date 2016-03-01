;;; siren-js.el --- jimeh's Emacs Siren: js2-mode configuration.

;;; Commentary:

;; Basic configuration for js2-mode.

;;; Code:

(require 'siren-programming)

(siren-require-packages '(js2-mode json-mode))
(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'"    . js2-mode))
(add-to-list 'auto-mode-alist '("\\.pac\\'"   . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(eval-after-load 'js2-mode
  '(progn
     (defun siren-js2-mode-defaults ()
       "Default tweaks for `js2-mode'."
       (setq js2-basic-offset 2)
       (setq tab-width 2)
       (setq mode-name "JS2")
       (js2-imenu-extras-mode +1)

       (siren-prog-mode-defaults)
       (company-mode +1)
       (subword-mode +1)
       (hs-minor-mode 1)
       (highlight-indentation-mode)
       (highlight-indentation-current-column-mode)

       (let ((map js2-mode-map))
         (define-key map (kbd "C-j") 'newline-and-indent)
         (define-key map (kbd "C-c C-h") 'siren-toggle-hiding)))

     (setq siren-js2-mode-hook 'siren-js2-mode-defaults)

     (add-hook 'js2-mode-hook (lambda ()
                               (run-hooks 'siren-js2-mode-hook)))))

(provide 'siren-js)
;;; siren-js.el ends here
