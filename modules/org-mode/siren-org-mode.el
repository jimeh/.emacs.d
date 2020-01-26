;;; siren-org-mode.el --- jimeh's Emacs Siren: org-mode configuration.

;;; Commentary:

;; Basic configuration for org-mode.

;;; Code:

(require 'siren-display-indentation)
(require 'siren-display-line-numbers)
(require 'siren-fci)
(require 'siren-flyspell)
(require 'siren-smartparens)

(use-package org-mode
  :ensure nil ;; loaded from emacs built-ins
  :bind (:map org-mode-map
              ("C-j" . newline-and-indent)
              ("RET" . newline-and-indent)
              ("M-{" . org-promote-subtree)
              ("M-}" . org-demote-subtree)
              ("M-P" . org-metaup)
              ("M-N" . org-metadown)
              ("C-M-n" . outline-next-visible-heading)
              ("C-M-p" . outline-previous-visible-heading))
  :hook (org-mode . siren-org-mode-setup)

  :custom
  (org-export-backends '(ascii html icalendar latex md confluence))
  (org-export-with-section-numbers nil)
  (org-export-with-sub-superscripts '{})

  :init
  (defun siren-org-mode-setup ()
    (setq fill-column 80
          whitespace-action '(auto-cleanup))

    (setcar (nthcdr 4 org-emphasis-regexp-components) 20)
    (org-set-emph-re 'org-emphasis-regexp-components
                     org-emphasis-regexp-components)

    (siren-display-indentation)
    (siren-display-line-numbers)
    (flyspell-mode)
    (fci-mode)
    (smartparens-mode +1)
    (visual-line-mode +1)
    (whitespace-mode +1)))

(provide 'siren-org-mode)
;;; siren-org-mode.el ends here
