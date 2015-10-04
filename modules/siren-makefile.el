;;
;; makefile
;;

(require 'siren-programming)

(defun siren-makefile-mode-defaults ()
  (siren-prog-mode-defaults)
  (subword-mode)
  (setq tab-width 4)
  (setq highlight-indentation-offset 4)
  (highlight-indentation-mode)
  (highlight-indentation-current-column-mode))

(setq siren-makefile-mode-hook 'siren-makefile-mode-defaults)

(add-hook 'makefile-mode-hook (lambda ()
                                (run-hooks 'siren-makefile-mode-hook)))


(provide 'siren-makefile)
