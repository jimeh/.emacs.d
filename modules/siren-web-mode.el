;;; siren-web-mode.el --- jimeh's Emacs Siren: web-mode configuration.

;;; Commentary:

;; Basic configuration for web-mode.

;;; Code:

(require 'siren-programming)

(siren-require-packages '(web-mode))
(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.html.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'"     . web-mode))

(eval-after-load 'web-mode
  '(progn
     (defun siren-web-mode-mode-defaults ()
       "Default tweaks for `web-mode'."
       (setq web-mode-code-indent-offset 2)
       (setq web-mode-css-indent-offset 2)
       (setq web-mode-markup-indent-offset 2)
       (setq web-mode-sql-indent-offset 2)
       (setq tab-width 2)

       (siren-prog-mode-defaults)
       (company-mode +1)
       (subword-mode +1)
       (hs-minor-mode 1)
       (highlight-indentation-set-offset 2)
       (highlight-indentation-current-column-mode)

       (let ((map web-mode-map))
         (define-key map (kbd "C-j") 'newline-and-indent)
         (define-key map (kbd "C-c C-h") 'siren-toggle-hiding)))

     (setq siren-web-mode-mode-hook 'siren-web-mode-mode-defaults)

     (add-hook 'web-mode-hook (lambda ()
                               (run-hooks 'siren-web-mode-mode-hook)))))

(provide 'siren-web-mode)
;;; siren-web-mode.el ends here
