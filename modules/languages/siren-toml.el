;;; siren-toml.el --- jimeh's Emacs Siren: toml-mode configuration.

;;; Commentary:

;; Basic configuration for toml-mode.

;;; Code:

(require 'siren-prettier-js)
(require 'siren-prog-mode)

(use-package conf-toml-mode
  :straight (:type built-in)
  :mode "\\.toml\\'"
  :hook (conf-toml-mode . siren-toml-mode-setup)

  :preface
  (defun siren-toml-mode-setup ()
    (run-hooks 'prog-mode-hook)
    (setq tab-width 2)
    (prettier-js-mode)))

(provide 'siren-toml)
;;; siren-toml.el ends here
