;;; siren-org-mode.el --- jimeh's Emacs Siren: org-mode configuration.

;;; Commentary:

;; Basic configuration for org-mode.

;;; Code:

(require 'siren-fci)
(require 'siren-flyspell)
(require 'siren-smartparens)

(defun siren-org-mode-setup ()
  (setq org-export-backends '(ascii html icalendar latex md confluence)
        fill-column 80
        whitespace-action '(auto-cleanup))

  (require 'org-mouse)

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
    (define-key map (kbd "C-M-p") 'outline-previous-visible-heading)))

(add-hook 'org-mode-hook #'siren-org-mode-setup)

(provide 'siren-org-mode)
;;; siren-org-mode.el ends here
