;;; siren-yasnippet.el --- jimeh's Emacs Siren: yasnippet configuration.

;;; Commentary:

;; Basic configuration for yasnippet.

;;; Code:

(use-package yasnippet
  :diminish yas-minor-mode
  :hook (emacs-startup . yas-reload-all)

  :config
  (yas-global-mode))

(use-package yasnippet-snippets
  :after yasnippet

  :config
  (let ((skip-file (expand-file-name "prog-mode/.yas-skip"
                                     yasnippet-snippets-dir)))
    (when (not (file-exists-p skip-file))
      (make-empty-file skip-file t))))

(provide 'siren-yasnippet)
;;; siren-yasnippet.el ends here
