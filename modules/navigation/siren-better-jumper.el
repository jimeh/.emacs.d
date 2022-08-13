;;; siren-better-jumper.el --- jimeh's Emacs Siren: better-jumper configuration.

;;; Commentary:

;; Basic configuration for better-jumper.

;;; Code:

(use-package better-jumper
  :hook
  (prog-mode . better-jumper-local-mode)

  :general
  ("M-g M-b" 'better-jumper-jump-backward)
  ("M-g M-f" 'better-jumper-jump-forward)

  :custom
  (better-jumper-context 'window)            ;; default: 'window
  (better-jumper-new-window-behavior 'copy)  ;; default: 'copy
  (better-jumper-add-jump-behavior 'replace) ;; default: 'append
  (better-jumper-max-length 100)             ;; default: 100

  :preface
  (defgroup siren-better-jumper nil
    "Siren specific tweaks to tar-bar-mode."
    :group 'better-jumper)

  (defvar siren-better-jumper-adviced-funs '()
    "List of functions which have been adviced.")

  (defun siren-better-jumper-set-advice (orig-fun &rest args)
    "Advice for ORIG-FUN to call `better-jumper-set-jump' before and after it."
    (better-jumper-set-jump)
    (apply orig-fun args)
    (better-jumper-set-jump))

  (defun siren-better-jumper-setup (funs)
    "Advice list of FUNS with `siren-better-jumper-set-advice'."
    (when (boundp 'funs)
      (mapc (lambda (fun)
              (advice-add fun :around #'siren-better-jumper-set-advice)
              (add-to-list 'siren-better-jumper-adviced-funs fun))
            funs)))

  (defun siren-better-jumper-teardown ()
    "Remove all advices setup with `siren-better-jumper-setup'."
    (when (boundp 'siren-better-jumper-adviced-funs)
      (mapc (lambda (fun)
              (advice-remove fun #'siren-better-jumper-set-advice))
            siren-better-jumper-adviced-funs)
      (setq siren-better-jumper-adviced-funs '())))

  :config
  (with-eval-after-load 'dumb-jump
    (siren-better-jumper-setup '(dumb-jump-go)))
  (with-eval-after-load 'lsp-mode
    (siren-better-jumper-setup '(lsp-find-definition)))
  (with-eval-after-load 'lsp-ui-peek
    (siren-better-jumper-setup '(lsp-ui-peek-find-definitions
                                     lsp-ui-peek-find-references)))
  (with-eval-after-load 'xref
    (siren-better-jumper-setup '(xref-find-definitions
                                     xref-find-references))))

(provide 'siren-better-jumper)
;;; siren-better-jumper.el ends here
