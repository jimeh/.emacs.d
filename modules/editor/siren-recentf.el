;;; siren-recentf.el --- jimeh's Emacs Siren: recentf configuration.

;;; Commentary:

;; Basic configuration for recentf.

;;; Code:

(use-package recentf
  :straight (:type built-in)
  :demand t

  :custom
  (recentf-save-file (expand-file-name "recentf" siren-cache-dir))
  (recentf-max-saved-items 5000)
  (recentf-max-menu-items 1000)
  (recentf-auto-cleanup 'never)
  (recentf-exclude '("\\.git.*" "\\.hg.*" "\\.svn.*"))

  :preface
  (defun siren-recentf-exclude-p (file)
    "A predicate to decide whether to exclude FILE from recentf."
    (let ((file-dir (file-truename (file-name-directory file))))
      (-any-p (lambda (dir)
                (string-prefix-p dir file-dir))
              (mapcar 'file-truename (list siren-cache-dir package-user-dir)))))

  :config
  (add-to-list 'recentf-exclude 'siren-recentf-exclude-p)
  (recentf-mode +1))

(provide 'siren-recentf)
;;; siren-recentf.el ends here
