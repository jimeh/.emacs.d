;;; siren-dockerfile.el --- jimeh's Emacs Siren: dockerfile-mode configuration.

;;; Commentary:

;; Basic configuration for dockerfile-mode.

;;; Code:

(use-package dockerfile-mode
  :hook
  (dockerfile-mode . siren-dockerfile-mode-setup)

  ;; TODO: The auto-mode-alist customizations can be removed once this PR is
  ;; merged: https://github.com/spotify/dockerfile-mode/pull/63
  :mode
  ;; Custom auto-mode-alist patterns requiring Dockerfiles to match of
  ;; "Dockerfile", "Dockerfile.*", or "*.dockerfile".
  "/Dockerfile\\(?:\\..*\\)?\\'"
  "\\.dockerfile\\'"

  :init
  ;; Delete default auto-mode-list from dockerfile-mode package, as it matches
  ;; basically matches most filenames which contain "dockerfile", including this
  ;; very file (siren-dockerfile.el).
  (setq auto-mode-alist
        (delete '("Dockerfile\\(?:\\..*\\)?\\'" . dockerfile-mode)
                auto-mode-alist))

  (defun siren-dockerfile-mode-setup ()
    (subword-mode +1)))

(provide 'siren-dockerfile)
;;; siren-dockerfile.el ends here
