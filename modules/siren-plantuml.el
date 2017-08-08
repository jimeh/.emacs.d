;;; siren-plantuml.el --- jimeh's Emacs Siren: plantuml-mode configuration.

;;; Commentary:

;; Basic configuration for plantuml-mode.

;;; Code:

(use-package plantuml-mode
  :mode "\\.uml\\'"

  :config
  (require 'siren-programming)

  (defun siren-plantuml-mode-defaults ()
    (siren-prog-mode-defaults)
    (setq tab-width 2)
    (setq plantuml-jar-path "/usr/local/Cellar/plantuml/8048/plantuml.8048.jar")
    (highlight-indentation-set-offset 2)
    (highlight-indentation-current-column-mode))

  (setq siren-plantuml-mode-hook 'siren-plantuml-mode-defaults)
  (add-hook 'plantuml-mode-hook (lambda ()
                                  (run-hooks 'siren-plantuml-mode-hook))))

(provide 'siren-plantuml)
;;; siren-plantuml.el ends here
