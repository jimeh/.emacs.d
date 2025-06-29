;;; siren-docker.el --- jimeh's Emacs Siren: docker configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for docker.

;;; Code:

;; Temporarily remove warning about docker-tramp deprecation in Emacs 29.x.
(when (not (version< emacs-version "29.0"))
  (with-eval-after-load 'tramp-compat
    (assq-delete-all 'docker-tramp after-load-alist)))

(use-package docker
  :defer t)

(provide 'siren-docker)
;;; siren-docker.el ends here
