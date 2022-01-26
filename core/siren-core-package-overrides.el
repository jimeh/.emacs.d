;;; siren-core-package-overrides.el --- jimeh's Emacs Siren: Package overrides

;;; Commentary:

;; List of custom package recipe overrides.

;;; Code:

(setq straight-recipe-overrides
      '((nil . (
                ;; Override company-nginx recipe as the original repo was
                ;; deleted.
                (company-nginx :type git :host github
                               :repo "emacsmirror/company-nginx"
                               :branch "master")
                ;; Use latest version of undo-tree from main git repo. The
                ;; package on elpa.gnu.org is quite old.
                (undo-tree :type git :host gitlab
                           :repo "tsc25/undo-tree"
                           :branch "master")
                ;; Override vertico recipe to fix issues with extensions.
                (vertico :type git :host github :repo "minad/vertico"
                         :files (:defaults "extensions/*")
                         :includes (vertico-buffer
                                    vertico-directory
                                    vertico-flat
                                    vertico-grid
                                    vertico-indexed
                                    vertico-mouse
                                    vertico-multiform
                                    vertico-quick
                                    vertico-repeat
                                    vertico-reverse
                                    vertico-unobtrusive))))))

(provide 'siren-core-package-overrides)
;;; siren-core-packages.el ends here
