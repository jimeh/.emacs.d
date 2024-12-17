;;; siren-easysession.el --- jimeh's Emacs Siren: easysession configuration.

;;; Commentary:

;; Basic configuration for easysession.

;;; Code:

(use-package easysession
  :ensure t
  :hook
  (easysession-after-load . siren-easysession-after-load)
  ((easysession-after-load easysession-new-session-hook) . siren-easysession-setup)

  :general
  ("C-z C-z c" 'easysession-save-as)
  ("C-z C-z C-c" 'easysession-save-as)
  ("C-z C-z k" 'easysession-delete)
  ("C-z C-z C-k" 'easysession-delete)
  ("C-z C-z r" 'easysession-rename)
  ("C-z C-z C-r" 'easysession-rename)
  ("C-z C-z l" 'easysession-load)
  ("C-z C-z C-l" 'easysession-load)
  ("C-z C-z s" 'easysession-switch-to)
  ("C-z C-z C-s" 'easysession-switch-to)

  :custom
  (easysession-save-interval 10)
  (easysession-mode-line-misc-info nil)

  :preface
  (defun siren-easysession-setup ()
    "Enable easysession-save-mode."
    (easysession-save-mode +1))

  (defun siren-easysession-after-load ()
    ;; Ensure tab-bar-mode bar is correctly enabled after a session load.
    (tab-bar-mode +1)))

(provide 'siren-easysession)
;;; siren-easysession.el ends here
