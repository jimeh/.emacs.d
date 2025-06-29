;;; siren-core-package-overrides.el --- jimeh's Emacs Siren: Package overrides  -*- lexical-binding: nil; -*-

;;; Commentary:

;; List of custom package recipe overrides.

;;; Code:

(setq straight-recipe-overrides
      '((nil . (
                ;; Override all-the-icons-completion to use fork with more
                ;; features.
                (all-the-icons-completion :type git :flavor melpa :host github :repo "iyefrat/all-the-icons-completion"
                                          :fork (:host github :repo "MintSoup/all-the-icons-completion"))
                ;; Use fork from doom-emacs author with various fixes.
                (dirvish :type git :flavor melpa :host github :repo "alexluigit/dirvish"
                         :fork (:host github :repo "hlissner/dirvish" :branch "main")
                         :files (:defaults "extensions/*.el" "dirvish-pkg.el"))))))

(provide 'siren-core-package-overrides)
;;; siren-core-packages.el ends here
