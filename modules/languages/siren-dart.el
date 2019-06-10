;;; siren-dart.el --- jimeh's Emacs Siren: dart-mode configuration.

;;; Commentary:

;; Basic configuration for dart-mode.

;;; Code:

(require 'siren-projectile)

(use-package dart-mode
  :mode "\\.dart"
  :interpreter "dart"

  :hook
  (dart-mode . siren-dart-mode-setup)

  :custom
  (dart-format-on-save t)
  (dart-enable-analysis-server t)

  :init
  (defun siren-dart-mode-setup ()
    (company-mode +1)
    (lsp)
    (highlight-symbol-mode -1)
    (hs-minor-mode 1)
    (hideshowvis-enable)
    (subword-mode +1))

  (with-eval-after-load "projectile"
    (add-to-list 'projectile-project-root-files-bottom-up "pubspec.yaml")
    (add-to-list 'projectile-project-root-files-bottom-up "BUILD")))

(provide 'siren-dart)
;;; siren-dart.el ends here
