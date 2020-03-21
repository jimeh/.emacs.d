;;; siren-selectrum.el --- jimeh's Emacs Siren: selectrum configuration.

;;; Commentary:

;; Basic configuration for selectrum.

;;; Code:

(require 'siren-prescient)

(use-package selectrum
  :straight (:host github :repo "raxod502/selectrum")

  :config
  (selectrum-mode +1))

(use-package selectrum-prescient
  :straight (:host github :repo "raxod502/prescient.el"
                   :files ("selectrum-prescient.el"))
  :after (selectrum)

  :config
  (selectrum-prescient-mode +1))

(provide 'siren-selectrum)
;;; siren-selectrum.el ends here
