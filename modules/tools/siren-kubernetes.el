;;; siren-kubernetes.el --- jimeh's Emacs Siren: kubernetes configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for kubernetes.

;;; Code:

(use-package kubernetes
  :defer t

  :preface
  (defalias 'ko 'kubernetes-overview))

(provide 'siren-kubernetes)
;;; siren-kubernetes.el ends here
