;;; siren-core-package-overrides.el --- jimeh's Emacs Siren: Package overrides

;;; Commentary:

;; List of custom package recipe overrides.

;;; Code:

(setq straight-recipe-overrides
      '((nil . (
                ;; Override all-the-icons-completion to use fork with more
                ;; features.
                (all-the-icons-completion :type git :flavor melpa :host github :repo "iyefrat/all-the-icons-completion"
                                          :fork (:host github :repo "MintSoup/all-the-icons-completion"))
                ;; Use fork with a fix for latest Emacs 30.x builds.
                (dirvish :type git :flavor melpa :host github :repo "alexluigit/dirvish"
                         :fork (:host github :repo "jimeh/dirvish" :branch "emacs-30-fix")
                         :files (:defaults "extensions/*.el" "dirvish-pkg.el"))
                ;; Override vertico recipe to fix issues with extensions.
                (vertico :type git :host github :repo "minad/vertico"
                         :files (:defaults "extensions/*" (:exclude ".git")))))))

(provide 'siren-core-package-overrides)
;;; siren-core-packages.el ends here
