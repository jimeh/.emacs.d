;;; siren-core-package-overrides.el --- jimeh's Emacs Siren: Package overrides

;;; Commentary:

;; List of custom package recipe overrides.

;;; Code:

(setq straight-recipe-overrides
      '((nil . (
                ;; Override go-playground to use my fork, which has a fix for
                ;; uploading to go.dev/play.
                (go-playground :type git :host github :repo "grafov/go-playground"
                               :fork (:host github :repo "jimeh/go-playground"
                                            :branch "fix-upload"))
                ;; Override vertico recipe to fix issues with extensions.
                (vertico :type git :host github :repo "minad/vertico"
                         :files (:defaults "extensions/*" (:exclude ".git")))))))

(provide 'siren-core-package-overrides)
;;; siren-core-packages.el ends here
