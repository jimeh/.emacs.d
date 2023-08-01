;;; siren-treesit.el --- jimeh's Emacs Siren: treesit

;;; Commentary:

;; Configuration for treesit

;;; Code:

(when (fboundp 'treesit-ready-p)
  (require 'treesit)
  (setopt treesit-font-lock-level 4)

  (defun siren-treesit-prepare (mode source)
    "Setup treesit for MODE with SOURCE."
    (add-to-list 'treesit-language-source-alist source)
    (let ((lang (car source)))
      (advice-add mode :before `(lambda (&rest _)
                                  (when (not (treesit-ready-p ',lang))
                                    (treesit-install-language-grammar ',lang))))))

  (use-package treesit-auto
    :demand t
    :if (fboundp 'treesit-ready-p)
    :custom
    (treesit-auto-install nil)
    :config
    (global-treesit-auto-mode)))

(provide 'siren-treesit)
;;; siren-treesit.el ends here
