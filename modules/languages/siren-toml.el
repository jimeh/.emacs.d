;;; siren-toml.el --- jimeh's Emacs Siren: toml-mode configuration.

;;; Commentary:

;; Basic configuration for toml-mode.

;;; Code:

(require 'siren-prog-mode)

(use-package conf-toml-mode
  :straight (:type built-in)
  :mode "\\.toml\\'" "Cargo\\.lock\\'"
  :hook (conf-toml-mode . siren-toml-mode-setup))

;; Use built-in treesit support if available.
(if (fboundp 'toml-ts-mode)
    (use-package toml-ts-mode
      :straight (:type built-in)
      :mode "\\.toml\\'" "Cargo\\.lock\\'"
      :hook
      (toml-ts-mode . siren-toml-mode-setup)

      :init
      (require 'siren-treesit)))

(defun siren-toml-mode-setup ()
  (run-hooks 'prog-mode-hook)
  (setq-local tab-width 2))

(provide 'siren-toml)
;;; siren-toml.el ends here
