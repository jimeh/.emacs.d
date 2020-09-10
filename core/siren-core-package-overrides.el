;;; siren-core-package-overrides.el --- jimeh's Emacs Siren: Package overrides

;;; Commentary:

;; List of custom package recipe overrides.

;;; Code:

(setq straight-recipe-overrides
      '((nil . (
                ;; Use custom fork of json-snatcher which fixes auto-loading
                ;; issue with its kill-buffer-hook. More details:
                ;; https://github.com/Sterlingg/json-snatcher/pull/12
                (json-snatcher :type git :host github
                               :repo "Sterlingg/json-snatcher"
                               :branch "master"
                               :fork (:host github
                                            :repo "jimeh/json-snatcher"
                                            :branch "fix-kill-buffer-hook"))))))

(provide 'siren-core-package-overrides)
;;; siren-core-packages.el ends here
