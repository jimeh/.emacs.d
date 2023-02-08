;;; siren-treesit.el --- jimeh's Emacs Siren: treesit

;;; Commentary:

;; Configuration for treesit

;;; Code:

(require 'treesit)

(defun siren-treesit-prepare (mode source)
  "Setup treesit for MODE with SOURCE."
  (add-to-list 'treesit-language-source-alist source)
  (let ((lang (car source)))
    (advice-add mode :before `(lambda (&rest _)
                                (when (not (treesit-ready-p ',lang))
                                  (treesit-install-language-grammar ',lang))))))

(provide 'siren-treesit)
;;; siren-treesit.el ends here
