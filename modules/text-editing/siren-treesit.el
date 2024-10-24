;;; siren-treesit.el --- jimeh's Emacs Siren: treesit

;;; Commentary:

;; Configuration for treesit

;;; Code:

(condition-case nil
    (require 'treesit)
  (error nil)) ; Do nothing if treesit is not available.

(when (fboundp 'treesit-ready-p)
  (defgroup siren-treesit nil
    "Siren specific options for treesit."
    :group 'treesit)

  (defcustom siren-treesit-grammar-dir (siren-cache-dir "treesit-grammars")
    "Directory where treesit grammars are stored."
    :type 'directory
    :group 'siren-tree-sitter
    :set (lambda (symbol value)
           (set-default symbol value)
           (setq treesit-extra-load-path `(,value))))

  (use-package treesit
    :straight (:type built-in)

    :custom
    (treesit-font-lock-level 4)

    :preface
    (defun siren-treesit-manual-prepare (mode source)
      "Setup treesit for MODE with SOURCE."
      (add-to-list 'treesit-language-source-alist source)
      (let ((lang (car source)))
        (advice-add mode :before
                    `(lambda (&rest _)
                       (when (not (treesit-ready-p ',lang t))
                         (treesit-install-language-grammar
                          ',lang
                          siren-treesit-grammar-dir))))))

    (defun siren-treesit-add-features (&rest features)
      "Add font-lock features to treesit."
      (add-to-list 'treesit-font-lock-feature-list features) t)

    (defun siren-treesit-prepend-font-lock-settings (&rest query-specs)
      "Replace existing features in font-lock settings, retaining feature order."
      (setq-local
       treesit-font-lock-settings
       (append (apply 'treesit-font-lock-rules query-specs)
               treesit-font-lock-settings)))

    (defun siren-treesit-append-font-lock-settings (&rest query-specs)
      "Replace existing features in font-lock settings, retaining feature order."
      (setq-local
       treesit-font-lock-settings
       (append treesit-font-lock-settings
               (apply 'treesit-font-lock-rules query-specs))))

    (defun siren-treesit-add-font-lock-settings (&rest query-specs)
      "Add features after existing ones  in font-lock settings."
      (dolist (item (apply 'treesit-font-lock-rules query-specs))
        (let* ((feature (nth 2 item))
               (existing (cl-find-if (lambda (x) (eq (nth 2 x) feature))
                                     (reverse treesit-font-lock-settings))))
          (if existing
              (siren-add-after treesit-font-lock-settings existing item)
            (add-to-list 'treesit-font-lock-settings item t)))))

    (defun siren-treesit-replace-font-lock-settings (&rest query-specs)
      "Replace existing features in font-lock settings, retaining feature order."
      (setq-local
       treesit-font-lock-settings
       (siren-treesit--replace-font-lock-settings
        treesit-font-lock-settings
        (apply 'treesit-font-lock-rules query-specs))))

    (defun siren-treesit-replace-or-add-font-lock-settings (&rest query-specs)
      "Set font-lock settings for treesit, merging with existing settings."
      (setq-local treesit-font-lock-settings
                  (siren-treesit--merge-font-lock-settings
                   treesit-font-lock-settings
                   (apply 'treesit-font-lock-rules query-specs))))

    (defun siren-treesit-get-font-lock-rule (feature)
      "Get the current treesit font-lock settings."
      (cl-find-if (lambda (x) (eq (siren-treesit--feature x) feature))
                  treesit-font-lock-settings))

    (defun siren-treesit--feature (compiled-query)
      "Get the feature from a compiled treesit query."
      (nth 2 compiled-query))

    (defun siren-treesit--replace-font-lock-settings (a b)
      "Replace treesit font-lock settings A with B based on feature."
      (let ((merged (copy-tree a)))
        (dolist (replacement b)
          (let* ((feature (siren-treesit--feature replacement))
                 (existing (cl-find-if
                            (lambda (x) (eq (siren-treesit--feature x) feature))
                            merged)))
            (if existing
                (setf (car (member existing merged)) replacement)
              )))
        merged))

    (defun siren-treesit--merge-font-lock-settings (a b)
      "Merge two treesit font-lock settings A and B into a new list.

This function merges the two treesit font-lock settings lists, returning
a new list.

Features from B will replace features in A if they are present in both.
Features only present in A will be kept, and features only present in B
will be appended."
      (let ((merged (copy-tree a)))
        (dolist (item-b b)
          (let* ((key (siren-treesit--feature item-b))
                 (existing (cl-find-if
                            (lambda (item) (eq (siren-treesit--feature item) key))
                            merged)))
            (if existing
                (setf (car (member existing merged)) item-b)
              (setq merged (append merged (list item-b))))))
        merged)))

  (use-package treesit-auto
    :demand t
    :if (fboundp 'treesit-ready-p)
    :custom
    (treesit-auto-install nil)

    :preface
    (defun siren-treesit-auto-ensure-grammar (grammar)
      "Ensure treesit GRAMMAR is installed and ready for use."
      (when (and (fboundp 'treesit-ready-p)
                 (not (treesit-ready-p grammar t)))
        (siren-treesit-auto-install-grammar grammar)))

    (defun siren-treesit-auto-install-grammar (grammar)
      "Install treesit GRAMMAR."
      (when (fboundp 'treesit-ready-p)
        (let ((treesit-language-source-alist
               (treesit-auto--build-treesit-source-alist)))
          (treesit-install-language-grammar grammar
                                            siren-treesit-grammar-dir))))

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
