;;; siren-org-mode.el --- jimeh's Emacs Siren: org-mode configuration.

;;; Commentary:

;; Basic configuration for org-mode.

;;; Code:

(require 'siren-fci)
(require 'siren-flyspell)
(require 'siren-linum)
(require 'siren-smartparens)

(use-package org-mode
  :ensure nil ;; loaded from emacs built-ins
  :hook (org-mode . siren-org-mode-setup)

  :init
  (defun siren-org-mode-setup ()
    (setq org-export-backends '(ascii html icalendar latex md confluence)
          fill-column 80
          whitespace-action '(auto-cleanup))

    (linum-mode t)
    (flyspell-mode)
    (fci-mode)
    (smartparens-mode +1)
    (visual-line-mode +1)
    (whitespace-mode +1)
    (let ((map org-mode-map))
      (define-key map (kbd "M-[") 'org-promote-subtree)
      (define-key map (kbd "M-]") 'org-demote-subtree)
      (define-key map (kbd "M-p") 'org-metaup)
      (define-key map (kbd "M-n") 'org-metadown)
      (define-key map (kbd "C-M-n") 'outline-next-visible-heading)
      (define-key map (kbd "C-M-p") 'outline-previous-visible-heading))))

(use-package org-mouse
  :ensure nil ;; loaded from emacs built-ins
  )

(provide 'siren-org-mode)
;;; siren-org-mode.el ends here
