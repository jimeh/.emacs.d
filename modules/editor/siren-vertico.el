;;; siren-vertico.el --- jimeh's Emacs Siren: vertico configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for vertico.

;;; Code:

(use-package vertico
  :demand t
  :custom
  (vertico-count 16)
  (vertico-cycle t)
  (vertico-resize nil)

  (enable-recursive-minibuffers t)
  (read-extended-command-predicate #'command-completion-default-include-p)

  :preface
  (defun siren-crm-indicator (args)
    (cons (concat "[CRM] " (car args)) (cdr args)))

  :config
  (vertico-mode +1)
  (advice-add #'completing-read-multiple :filter-args #'siren-crm-indicator))

(use-package vertico-mouse
  :ensure nil
  :after vertico)

(use-package vertico-repeat
  :ensure nil
  :after vertico
  :general
  ("C-c C-v" 'vertico-repeat))

(use-package vertico-directory
  :ensure nil
  :after vertico
  :demand t
  :general
  (:keymaps 'vertico-map
            "C-l" 'vertico-directory-up)

  :preface
  ;; Hacky minor-mode to toggle vertico-directory features on and off.
  (define-minor-mode vertico-directory-mode
    "Remap vertico keybindings to handle files/folders better."
    :global t
    (let ((map vertico-map))
      (if vertico-directory-mode
          (progn
            (add-hook 'rfn-eshadow-update-overlay-hook
                      'vertico-directory-tidy)
            (define-key map (kbd "RET") 'vertico-directory-enter)
            (define-key map (kbd "DEL") 'vertico-directory-delete-char)
            (define-key map (kbd "M-DEL") 'vertico-directory-delete-word))
        (progn
          (remove-hook 'rfn-eshadow-update-overlay-hook
                       'vertico-directory-tidy)
          (define-key map (kbd "RET") 'vertico-exit)
          (define-key map (kbd "DEL") 'backward-delete-char)
          (define-key map (kbd "M-DEL") 'backward-kill-word)))))

  :init
  (with-eval-after-load 'projectile
    ;; Hackily disable vertico-directory-mode when completing things for
    ;; projectile. This avoids breaking projectile-switch-project command.
    (defun siren-vertico-projectile-completing-read (orig-fun &rest args)
      (if vertico-directory-mode
          (progn
            (vertico-directory-mode -1)
            (unwind-protect
                (apply orig-fun args)
              (vertico-directory-mode +1)))
        (apply orig-fun args)))

    (advice-add 'projectile-completing-read :around
                'siren-vertico-projectile-completing-read))

  :config
  (vertico-directory-mode +1))

(provide 'siren-vertico)
;;; siren-vertico.el ends here
