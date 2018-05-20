;;; siren-rubocop.el --- jimeh's Emacs Siren: rubocop-mode configuration.

;;; Commentary:

;; Basic configuration for rubocop-mode.

;;; Code:

(use-package rubocop
  :defer t
  :bind (:map rubocop-mode-map
              ("C-c C-f" . siren-rubocop-autocorrect))

  :hook
  (rubocop-mode . siren-rubocop-mode-setup)
  (after-save . siren-rubocop-autocorrect-hook)

  :init
  (defun siren-rubocop-mode-setup ())

  :config
  (defgroup siren-rubocop nil
    "Rubocop options specific to Siren."
    :group 'siren)

  (defcustom siren-rubocop-autocorrect-on-save t
    "Auto-correct files with rubocop when saving."
    :group 'siren-rubocop
    :type 'boolean)

  (defadvice compilation-start
      (around inhibit-display
              (command &optional mode name-function highlight-regexp))
    (if (not (string-match "^\\(find\\|grep\\)" command))
        (flet ((display-buffer)
               (set-window-point)
               (goto-char))
          (fset 'display-buffer 'ignore)
          (fset 'goto-char 'ignore)
          (fset 'set-window-point 'ignore)
          (save-window-excursion
            ad-do-it))
      ad-do-it))

  (defun siren-rubocop-autocorrect ()
    "Auto-correct with Rubocop and instantly revert buffer."
    (interactive)
    (if siren-rubocop-autocorrect-on-save
        (save-buffer)
      (siren-rubocop-autocorrect-p t)))

  (defun siren-rubocop-autocorrect-p (force-save)
    "Auto-correct with Rubocop and instantly revert buffer.

If FORCE-SAVE is nil then file will not be saved before
auto-correction is triggered."
    (if force-save (save-buffer))
    (ad-activate 'compilation-start)
    (rubocop-autocorrect-current-file)
    (ad-deactivate 'compilation-start)
    ;; doesn't work, buffer just updates a few seconds later via auto-revert.
    ;; (revert-buffer t t)
    )

  (defun siren-rubocop-autocorrect-hook ()
    "Siren's Rubocop auto-correct hook."
    (if siren-rubocop-autocorrect-on-save
        (siren-rubocop-autocorrect-p nil))))

(provide 'siren-rubocop)
;;; siren-rubocop.el ends here
