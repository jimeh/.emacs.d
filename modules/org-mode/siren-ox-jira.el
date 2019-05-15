;;; siren-ox-jira.el --- jimeh's Emacs Siren: ox-jira configuration.

;;; Commentary:

;; Basic configuration for ox-jira.

;;; Code:

(require 'siren-org-mode)

(use-package ox-jira
  :defer t

  :hook
  (org-mode . siren-ox-jira-setup)

  :init
  (defun siren-ox-jira-setup ()
    (require 'ox-jira)))

(provide 'siren-ox-jira)
;;; siren-ox-jira.el ends here
