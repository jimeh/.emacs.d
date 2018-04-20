;;; siren-goto-chg.el --- jimeh's Emacs Siren: goto-chg configuration.

;;; Commentary:

;; Basic configuration for goto-chg.

;;; Code:

(use-package goto-chg
  :bind (("C-." . goto-last-change)
         ("C-," . goto-last-change-reverse)
         ;; Flyspell uses C-. and C-, itself in a such a way that this is the
         ;; only way to make goto-chg bind to those keys while flyspell-mode is
         ;; enabled.
         :map flyspell-mode-map
         ("C-." . goto-last-change)
         ("C-," . goto-last-change-reverse)))

(provide 'siren-goto-chg)
;;; siren-goto-chg.el ends here
