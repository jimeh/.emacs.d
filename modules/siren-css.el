;;
;; css
;;

(require 'siren-programming)

(eval-after-load 'css-mode
  '(progn
     (siren-require-packages '(rainbow-mode))

     (setq css-indent-offset 2)

     (defun siren-css-mode-defaults ()
       (siren-prog-mode-defaults)
       (rainbow-mode +1)
       (setq tab-width 2)
       (highlight-indentation-mode)
       (highlight-indentation-current-column-mode)
       (run-hooks 'siren-prog-mode-hook))

     (setq siren-css-mode-hook 'siren-css-mode-defaults)

     (add-hook 'css-mode-hook (lambda ()
                                (run-hooks 'siren-css-mode-hook)))))


(provide 'siren-css)
