;;; siren-forge.el --- jimeh's Emacs Siren: forge configuration

;;; Commentary:

;; Basic configuration for forge.

;;; Code:

(require 'siren-magit)

(use-package forge
  :defer t
  :after magit)

(use-package forge-post
  :straight forge
  :defer t

  :hook
  (forge-post-mode . siren-forge-post-mode-setup)

  :init
  (defun siren-forge-post-mode-setup ()
    (setq-local prettier-js-args '("--parser" "markdown"
                                   "--print-width" "80"
                                   "--prose-wrap" "always"))))

(provide 'siren-forge)
;;; siren-forge.el ends here
