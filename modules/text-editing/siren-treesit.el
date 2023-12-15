;;; siren-treesit.el --- jimeh's Emacs Siren: treesit

;;; Commentary:

;; Configuration for treesit

;;; Code:

(condition-case nil
    (require 'treesit)
  (error nil)) ; Do nothing if treesit is not available.

(when (fboundp 'treesit-ready-p)
  (setopt treesit-font-lock-level 4)

  (defun siren-treesit-manual-prepare (mode source)
    "Setup treesit for MODE with SOURCE."
    (add-to-list 'treesit-language-source-alist source)
    (let ((lang (car source)))
      (advice-add mode :before
                  `(lambda (&rest _)
                     (when (not (treesit-ready-p ',lang t))
                       (treesit-install-language-grammar ',lang))))))

  (use-package treesit-auto
    :demand t
    :if (fboundp 'treesit-ready-p)
    :custom
    (treesit-auto-install nil)

    :preface
    (defun siren-treesit-auto-ensure-grammar (grammar)
      "Ensure that treesit GRAMMAR is installed and ready for use."
      (when (and (fboundp 'treesit-ready-p)
                 (not (treesit-ready-p grammar t)))
        (let ((treesit-language-source-alist
               (treesit-auto--build-treesit-source-alist)))
          (treesit-install-language-grammar grammar))))

    (defvar siren-treesit-auto--source-alist-populated-p 'nil
      "Internal flag to track if `treesit-auto--build-treesit-source-alist'
has been used to populate `treesit-language-source-alist'.")

    (defun siren-treesit-auto--populate-treesit-language-source-alist ()
      (if (not siren-treesit-auto--source-alist-populated-p)
          (setq treesit-language-source-alist
                (append treesit-language-source-alist
                        (treesit-auto--build-treesit-source-alist))
                siren-treesit-auto--source-alist-populated-p t)))

    :config
    (siren-treesit-auto--populate-treesit-language-source-alist)))

(provide 'siren-treesit)
;;; siren-treesit.el ends here
