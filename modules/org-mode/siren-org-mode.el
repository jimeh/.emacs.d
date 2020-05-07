;;; siren-org-mode.el --- jimeh's Emacs Siren: org-mode configuration.

;;; Commentary:

;; Basic configuration for org-mode.

;;; Code:

(require 'siren-display-fill-column)
(require 'siren-display-indentation)
(require 'siren-display-line-numbers)
(require 'siren-flyspell)
(require 'siren-smartparens)

(use-package org
  :bind
  (:map org-mode-map
        ("C-j" . org-return-indent)
        ("RET" . org-return-indent)
        ("M-{" . org-promote-subtree)
        ("M-}" . org-demote-subtree)
        ("M-P" . org-metaup)
        ("M-N" . org-metadown)
        ("C-M-n" . outline-next-visible-heading)
        ("C-M-p" . outline-previous-visible-heading))
  (:map org-src-mode-map
        ("C-c C-c" . org-edit-src-exit))

  :hook
  (org-mode . siren-org-mode-setup)

  :custom
  (org-blank-before-new-entry '((heading . auto) (plain-list-item . nil)))
  (org-catch-invisible-edits 'show)
  (org-ctrl-k-protect-subtree t)
  (org-export-backends '(ascii html icalendar latex md))
  (org-export-with-section-numbers nil)
  (org-export-with-sub-superscripts '{})
  (org-return-follows-link t)
  (org-special-ctrl-a/e t)
  (org-special-ctrl-k t)

  (org-directory (if (file-directory-p "~/Dropbox/org")
                     "~/Dropbox/org" "~/org"))

  :init
  (defun siren-org-mode-setup ()
    (setq fill-column 80
          whitespace-action '(auto-cleanup))

    (setcar (nthcdr 4 org-emphasis-regexp-components) 20)
    (org-set-emph-re 'org-emphasis-regexp-components
                     org-emphasis-regexp-components)

    (siren-display-fill-column)
    (siren-display-indentation)
    (siren-display-line-numbers)
    (flyspell-mode)
    (smartparens-mode +1)
    (visual-line-mode +1)
    (whitespace-mode +1))

  :config
  (require 'org-mouse)
  (setq org-id-locations-file
        (expand-file-name ".org-id-locations" org-directory)))

(provide 'siren-org-mode)
;;; siren-org-mode.el ends here
