;;; siren-dart.el --- jimeh's Emacs Siren: dart-mode configuration.

;;; Commentary:

;; Basic configuration for dart-mode.

;;; Code:

(require 'siren-lsp)
(require 'siren-projectile)

(use-package dart-mode
  :mode "\\.dart\\'"
  :interpreter "dart"

  :hook
  (dart-mode . siren-dart-mode-setup)

  :custom
  (dart-format-on-save t)
  (dart-enable-analysis-server t)

  :preface
  (defun siren-dart-mode-setup ()
    (when (fboundp 'highlight-symbol-mode)
      (highlight-symbol-mode -1))
    (when (fboundp 'auto-highlight-symbol-mode)
      (auto-highlight-symbol-mode -1))

    (lsp-deferred))

  :init
  (with-eval-after-load 'projectile
    (add-to-list 'projectile-project-root-files-bottom-up "pubspec.yaml")
    (add-to-list 'projectile-project-root-files-bottom-up "BUILD")))

(provide 'siren-dart)
;;; siren-dart.el ends here
