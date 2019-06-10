;;; siren-helm-files.el --- jimeh's Emacs Siren: helm-files configuration.

;;; Commentary:

;; Basic configuration for helm-files.

;;; Code:

(require 'siren-helm)

(use-package helm-files
  :ensure helm
  :defer t
  :bind
  ("C-x C-f" . helm-find-files)
  ("C-c f f" . helm-for-files)
  ("C-c f r" . helm-recentf)

  :custom
  (helm-ff-file-name-history-use-recentf t)
  (helm-ff-search-library-in-sexp t))

(provide 'siren-helm-files)
;;; siren-helm-files.el ends here
