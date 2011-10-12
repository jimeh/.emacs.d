(require 'org-install)
(require 'remember)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; Remember mode configuration.
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)

;; Org-mode configuration
(custom-set-variables
 '(org-agenda-files (list "~/.org-files/todos.org"
                          "~/.org-files/notes.org"
                          "~/.org-files/events.org"))
 '(org-directory "~/.org-files/")
 '(org-default-notes-files "~/.org-files/notes.org")

 '(org-log-done t)
 '(org-agenda-ndays 7)
 '(org-deadline-warning-days 14)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-reverse-note-order t)
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-remember-store-without-prompt t)

 ;; Remember templates.
 '(org-remember-templates
   '(("Todo" ?t "** TODO %?\n" "~/.org-files/todos.org" "Tasks")
     ("Note" ?n "** %?\n" "~/.org-files/notes.org" "Notes"))))
