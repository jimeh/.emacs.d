;;; siren-consult.el --- jimeh's Emacs Siren: consult configuration.

;;; Commentary:

;; Basic configuration for consult.

;;; Code:

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
  (consult-project-root-function 'siren-consult-project-root)

  :init
  (defun siren-consult-project-root (&rest args)
    "Call projectile-project-root if defined, otherwise return empty string."
    (if (fboundp 'projectile-project-root)
        (apply 'projectile-project-root args) "")))

(provide 'siren-consult)
;;; siren-consult.el ends here
