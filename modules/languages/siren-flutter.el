;;; siren-flutter.el --- jimeh's Emacs Siren: flutter-mode configuration.

;;; Commentary:

;; Basic configuration for flutter-mode.

;;; Code:

(require 'siren-dart)

(use-package flutter
  :after dart-mode
  :bind (:map dart-mode-map
              ("C-M-x" . #'flutter-run-or-hot-reload)))

(provide 'siren-flutter)
;;; siren-flutter.el ends here
