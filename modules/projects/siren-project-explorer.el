;;; siren-project-explorer.el --- jimeh's Emacs Siren: project-explorer configuration.

;;; Commentary:

;; Basic configuration for project-explorer.

;;; Code:

(use-package project-explorer
  :general
  ("C-x C-p" 'project-explorer-toggle)

  :custom
  (pe/follow-current t)
  (pe/width 54)
  (pe/cache-directory (expand-file-name "project-explorer" siren-cache-dir))

  :config
  ;; Make Project Explorer open selected file in last used buffer
  (setq pe/display-content-buffer-function
        (lambda (buffer)
          (let* (( last-buffer
                   (car (cl-remove 'project-explorer-mode
                                   (buffer-list)
                                   :key (apply-partially 'buffer-local-value
                                                         'major-mode))))
                 ( window (get-buffer-window last-buffer)))
            (if window
                (set-window-buffer window buffer)
              (pe/show-buffer buffer)))
          )))

(provide 'siren-project-explorer)
;;; siren-project-explorer.el ends here
