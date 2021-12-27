;;; siren-core-package-overrides.el --- jimeh's Emacs Siren: Package overrides

;;; Commentary:

;; List of custom package recipe overrides.

;;; Code:

(setq straight-recipe-overrides
      '((nil . (
                ;; Use latest version of undo-tree from main git repo. The
                ;; package on elpa.gnu.org is quite old.
                (undo-tree :type git :host gitlab
                           :repo "tsc25/undo-tree"
                           :branch "master")))))

(provide 'siren-core-package-overrides)
;;; siren-core-packages.el ends here
