;;; siren-consult.el --- jimeh's Emacs Siren: consult configuration.

;;; Commentary:

;; Basic configuration for consult.

;;; Code:

(require 'siren-projectile)

(eval-when-compile
  (require 'cl-lib))

(use-package consult
  :defer t
  :general
  ("C-t" 'siren-consult-imenu)
  ("C-x b" 'consult-buffer)
  ("C-c b" 'siren-consult-projectile-buffer)
  ("M-g M-g" 'consult-goto-line)

  :custom
  (consult-buffer-sources '(siren-consult--source-buffer-outside-project
                            siren-consult--source-project-buffer
                            siren-consult--source-not-project-buffer))
  (consult-preview-max-count 10)

  :config
  (setq consult-project-root-function 'projectile-project-root)

  :preface
  (defun siren-consult-imenu ()
    "Intelligently trigger consult-lsp-file-symbols or consult-imenu."
    (interactive)
    (if (and (fboundp 'consult-lsp-file-symbols)
             (boundp 'lsp-mode)
             lsp-mode)
        ;; consult-lsp-file-symbols errors on some language servers, in such
        ;; a case, fall back to consult-imenu.
        (condition-case _
            (consult-lsp-file-symbols)
          ('error (consult-imenu)))
      (consult-imenu)))

  (defun siren-consult-project-buffer ()
    "project buffer with consult"
    (interactive)
    (when-let (buffer (consult--multi '(consult--source-hidden-buffer
                                        siren-consult--source-buffer-outside-project
                                        siren-consult--source-project-buffer
                                        siren-consult--source-not-project-buffer
                                        consult--source-recent-file
                                        consult--source-bookmark
                                        consult--source-project-recent-file)
                                      :require-match
                                      (confirm-nonexistent-file-or-buffer)
                                      :prompt "Switch to: "
                                      :history 'consult--projectile-buffer-history
                                      :sort nil))
      ;; When the buffer does not belong to a source,
      ;; create a new buffer with the name.
      (unless (cdr buffer)
        (consult--buffer-action (car buffer)))))

  (defun siren-consult-projectile-buffer ()
    "Select projectile buffers with consult.
Only shows file-based buffers."
    (interactive)
    (when-let (buffer (consult--multi `(siren-consult--source-projectile-buffer)
                                      :require-match
                                      (confirm-nonexistent-file-or-buffer)
                                      :prompt "Switch to: "
                                      :history 'consult--projectile-buffer-history
                                      :sort nil))
      ;; When the buffer does not belong to a source,
      ;; create a new buffer with the name.
      (unless (cdr buffer)
        (consult--buffer-action (car buffer)))))

  (defvar siren-consult--source-buffer-outside-project
    `(:name "Buffer"
            :narrow   ?b
            :category buffer
            :face     consult-buffer
            :history  buffer-name-history
            :state    ,#'consult--buffer-state
            :enabled  ,(lambda () (not (and consult-project-root-function
                                            (funcall consult-project-root-function))))
            :default  t
            :items
            ,(lambda () (consult--buffer-query :sort 'visibility
                                               :as #'buffer-name)))
    "Buffer candidate source for `consult-buffer'.")

  (defvar siren-consult--source-project-buffer
    `(:name "Project Buffers"
            :narrow   (?p . "Project")
            :hidden   nil
            :category project-buffer
            :face     consult-buffer
            :history  buffer-name-history
            :state    ,#'consult--buffer-state
            :enabled  ,(lambda () (and consult-project-root-function
                                       (funcall consult-project-root-function)))
            :items
            ,(lambda ()
               (siren-consult--buffer-query :sort 'visibility
                                            :directory 'project
                                            :as #'buffer-name)))
    "Project buffer candidate source for `consult-buffer'.")

  (defvar siren-consult--source-not-project-buffer
    `(:name "Other Buffers"
            :narrow   (?b . "Other Buffer")
            :hidden   nil
            :category buffer
            :face     consult-buffer
            :history  buffer-name-history
            :state    ,#'consult--buffer-state
            :enabled  ,(lambda () (and consult-project-root-function
                                       (funcall consult-project-root-function)))
            :items
            ,(lambda ()
               (siren-consult--buffer-query :sort 'visibility
                                            :directory 'not-project
                                            :as #'buffer-name)))
    "Non-project buffer candidate source for `consult-buffer'.")

  (defvar siren-consult--source-projectile-buffer
    `(:name "Projectile Buffers"
            :narrow   (?p . "Project")
            :hidden   nil
            :category project-buffer
            :face     consult-buffer
            :history  buffer-name-history
            :state    ,#'consult--buffer-state
            :enabled  ,(lambda () (fboundp 'projectile-project-buffer-names))
            :items
            ,(lambda ()
               (projectile-project-buffer-names)))
    "Projectile buffer candidate source for `siren-consult-projectile-buffer'.")

  ;; Custom versions of consult's buffer query functions which supports the
  ;; 'not-project directory value.
  (defun siren-consult--normalize-directory (dir)
    "Normalize directory DIR.
DIR can be project, not-project, nil or a path."
    (cond
     ((or (eq dir 'project) (eq dir 'not-project)) (consult--project-root))
     (dir (expand-file-name dir))))

  (cl-defun siren-consult--buffer-query (&key sort directory mode as predicate (filter t)
                                        include (exclude consult-buffer-filter))
    "Buffer query function.
DIRECTORY can either be project, not-project or a path.
SORT can be visibility, alpha or nil.
FILTER can be either t, nil or invert.
EXCLUDE is a list of regexps.
INCLUDE is a list of regexps.
MODE can be a mode or a list of modes to restrict the returned buffers.
PREDICATE is a predicate function.
AS is a conversion function."
    ;; This function is the backbone of most `consult-buffer' source. The
    ;; function supports filtering by various criteria which are used throughout
    ;; Consult.
    (when-let (root (or (siren-consult--normalize-directory directory) t))
      (let ((buffers (buffer-list))
            (not-project (eq directory 'not-project)))
        (when sort
          (setq buffers (funcall (intern (format "consult--buffer-sort-%s" sort)) buffers)))
        (when (or filter mode as (stringp root))
          (let ((mode (consult--ensure-list mode))
                (exclude-re (consult--regexp-filter exclude))
                (include-re (consult--regexp-filter include)))
            (consult--keep! buffers
              (and
               (or (not mode)
                   (apply #'provided-mode-derived-p
                          (buffer-local-value 'major-mode it) mode))
               (pcase-exhaustive filter
                 ('nil t)
                 ((or 't 'invert)
                  (eq (eq filter t)
                      (and
                       (or (not exclude)
                           (not (string-match-p exclude-re (buffer-name it))))
                       (or (not include)
                           (not (not (string-match-p include-re (buffer-name it)))))))))
               (or (not (stringp root))
                   (when-let (dir (buffer-local-value 'default-directory it))
                     (let ((in-project (string-prefix-p root
                                                       (if (and (/= 0 (length dir)) (eq (aref dir 0) ?/))
                                                           dir
                                                         (expand-file-name dir)))))
                       (or (and not-project (not in-project))
                           (and (not not-project) in-project)))))
               (or (not predicate) (funcall predicate it))
               (if as (funcall as it) it)))))
        buffers))))

(provide 'siren-consult)
;;; siren-consult.el ends here
