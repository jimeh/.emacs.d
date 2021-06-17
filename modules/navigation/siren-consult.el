;;; siren-consult.el --- jimeh's Emacs Siren: consult configuration.

;;; Commentary:

;; Basic configuration for consult.

;;; Code:

(require 'siren-prescient)
(require 'siren-projectile)
(require 'siren-selectrum)

(use-package consult
  :defer t
  :bind
  ("C-x b" . consult-buffer)
  ("M-g M-g" . consult-goto-line)

  :custom
  (consult-buffer-sources '(consult--source-hidden-buffer
                            consult--source-buffer
                            consult--source-project-buffer
                            consult--source-project-file))
  (consult-preview-max-count 10)
  (consult-project-root-function 'projectile-project-root))

(provide 'siren-consult)
;;; siren-consult.el ends here
