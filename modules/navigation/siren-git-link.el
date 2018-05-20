;;; siren-git-link.el --- jimeh's Emacs Siren: git-link configuration.

;;; Commentary:

;; Basic configuration for git-link.

;;; Code:

(use-package git-link
  :bind
  ("C-c g" . git-link)

  :config
  (setq git-link-open-in-browser t)

  ;; Add custom handlers relevant only for machine with hostname "UAC00024".
  (when (string= (system-name) "UAC00024")
      (defun git-link-uac00024-bitbucket (hostname dirname filename branch commit start end)
        (format "https://%s/projects/%srepos/%s/browse/%s"
                "bitbucket.il2management.local"
                (upcase (file-name-directory dirname))
                (file-name-nondirectory dirname)
                (concat filename
                        (unless (string= (or branch commit) "master")
                          (format "?at=%s" (or branch commit)))
                        (when start
                          (concat "#"
                                  (if end (format "%s-%s" start end)
                                    (format "%s" start)))))))

      (defun git-link-commit-uac00024-bitbucket (hostname dirname commit)
        (format "https://%s/projects/%srepos/%s/commits/%s"
                "bitbucket.il2management.local"
                (upcase (file-name-directory dirname))
                (file-name-nondirectory dirname)
                commit))

      (add-to-list 'git-link-remote-alist
                   '("git" git-link-uac00024-bitbucket) t)
      (add-to-list 'git-link-commit-remote-alist
                   '("git" git-link-commit-uac00024-bitbucket) t)))

(provide 'siren-git-link)
;;; siren-git-link.el ends here
