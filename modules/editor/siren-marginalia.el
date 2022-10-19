;;; siren-marginalia.el --- jimeh's Emacs Siren: marginalia configuration.

;;; Commentary:

;; Basic configuration for marginalia.

;;; Code:

(use-package marginalia
  :demand t
  :general
  (:keymaps 'minibuffer-local-map
            "M-A" 'marginalia-cycle)

  :custom
  (marginalia-align-offset 10)
  (marginalia-field-width 120)
  (marginalia-separator "  ")

  :preface
  (defun siren-marginalia-annotate-tab (cand)
    "Annotate named tab CAND with index, group, window and buffer information."
    (when-let* ((tabs (funcall tab-bar-tabs-function))
                (index (seq-position
                        tabs nil
                        (lambda (tab _) (equal (alist-get 'name tab) cand)))))
      (let* ((tab (nth index tabs))
             (groups (mapcar (lambda (tab) (alist-get 'group tab)) tabs))
             (group-width (if (length> groups 0)
                              (length (car (seq-sort-by #'length #'> groups)))
                            0))
             (group-format (format "%%%ds" (- group-width)))
             (ws (alist-get 'ws tab))
             (group (alist-get 'group tab))
             (bufs (window-state-buffers ws)))
        ;; NOTE: When the buffer key is present in the window state
        ;; it is added in front of the window buffer list and gets duplicated.
        (when (cadr (assq 'buffer ws)) (pop bufs))

        (concat
         (format #(" (%s)" 0 5 (face marginalia-key)) index)
         (marginalia--fields
          ((format group-format (if group group ""))
           :face 'marginalia-key)
          ((if (cdr bufs)
               (format "%d windows" (length bufs))
             "1 window ")
           :face 'marginalia-size)
          ((if (memq 'current-tab tab)
               "*current tab*"
             (string-join bufs " "))
           :face 'marginalia-documentation)
          )))))

  (defun marginalia-annotate-project-buffer (cand)
    "Annotate project buffer CAND with modification status, file name and major
mode."
    (when-let (buffer (get-buffer cand))
      (marginalia--fields
       ((marginalia--buffer-status buffer))
       ((marginalia--project-buffer-file buffer)
        :truncate (/ marginalia-field-width 2)
        :face 'marginalia-file-name))))

  (defun marginalia--project-buffer-file (buffer)
    "Return the file or process name of BUFFER relative to project root, if it
is within project root."
    (let ((root (marginalia--project-root))
          (file (marginalia--buffer-file buffer)))
      (if (string-equal root file) file
        (string-remove-prefix root file))))

  :config
  ;; Default command category to 'marginalia-annotate-binding instead of
  ;; 'marginalia-annotate-command which has a slight performance impact when
  ;; filtering M-x candidates.
  (mapc
   (lambda (x)
     (pcase (car x)
       ('command
        (setcdr x (cons 'marginalia-annotate-binding
                        (remq 'marginalia-annotate-binding (cdr x)))))))
   marginalia-annotator-registry)

  ;; Add custom annotators.
  (add-to-list 'marginalia-annotator-registry
               '(project-buffer marginalia-annotate-project-buffer))
  (add-to-list 'marginalia-annotator-registry
               '(tab siren-marginalia-annotate-tab))

  ;; Customize projectile commands when/if loaded.
  (with-eval-after-load 'projectile
    (add-to-list 'marginalia-command-categories
                 '(projectile-switch-project . file))
    (add-to-list 'marginalia-command-categories
                 '(projectile-switch-open-project . file))
    (add-to-list 'marginalia-command-categories
                 '(projectile-find-file . project-file))
    (add-to-list 'marginalia-command-categories
                 '(projectile-recentf . project-file))
    (add-to-list 'marginalia-command-categories
                 '(projectile-display-buffer . project-buffer))
    (add-to-list 'marginalia-command-categories
                 '(projectile-switch-to-buffer . project-buffer)))

  ;; Enable marginalia.
  (marginalia-mode +1))

(provide 'siren-marginalia)
;;; siren-marginalia.el ends here
