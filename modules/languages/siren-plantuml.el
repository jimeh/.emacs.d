;;; siren-plantuml.el --- jimeh's Emacs Siren: plantuml-mode configuration.

;;; Commentary:

;; Basic configuration for plantuml-mode.

;;; Code:

(use-package plantuml-mode
  :mode "\\.uml\\'"
  :hook
  (plantuml-mode . siren-plantuml-mode-setup)

  :init
  (defun siren-plantuml-mode-setup ()
    (setq tab-width 2
          plantuml-jar-path "/usr/local/opt/plantuml/libexec/plantuml.jar")))

(provide 'siren-plantuml)
;;; siren-plantuml.el ends here
