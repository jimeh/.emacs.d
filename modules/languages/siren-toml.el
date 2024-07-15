;;; siren-toml.el --- jimeh's Emacs Siren: toml-mode configuration.

;;; Commentary:

;; Basic configuration for toml-mode.

;;; Code:

(require 'siren-prog-mode)

;; TODO: Revisit toml-ts-mode at some point the future. It's a bit buggy at the
;; moment.
;;
;; (if (fboundp 'toml-ts-mode)
;;     (use-package toml-ts-mode
;;       :straight (:type built-in)
;;       :mode "\\.toml\\'" "Cargo\\.lock\\'"
;;       :hook
;;       (toml-ts-mode . siren-toml-mode-setup)
;;       :preface
;;       (require 'siren-treesit)
;;       :config
;;       (siren-treesit-auto-ensure-grammar 'toml)))

(use-package conf-toml-mode
  :straight (:type built-in)
  :mode "\\.toml\\'" "Cargo\\.lock\\'"
  :hook (conf-toml-mode . siren-toml-mode-setup))

(defun siren-toml-mode-setup ()
  "Default tweaks for `toml-mode'."
  (run-hooks 'prog-mode-hook)
  (setq-local tab-width 2))

(provide 'siren-toml)
;;; siren-toml.el ends here
