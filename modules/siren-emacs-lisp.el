;;; siren-emacs-lisp.el --- jimeh's Emacs Siren: emacs-lisp-mode configuration.

;;; Commentary:

;; Basic configuration for emacs-lisp-mode.

;;; Code:

(siren-require-packages '(rainbow-mode))

(require 'siren-lisp)

(defun siren-recompile-elc-on-save ()
  "Recompile your elc when saving an elisp file."
  (add-hook 'after-save-hook
            (lambda ()
              (when (and
                     (string-prefix-p siren-dir (file-truename buffer-file-name))
                     (file-exists-p (byte-compile-dest-file buffer-file-name)))
                (emacs-lisp-byte-compile)))
            nil
            t))

(defun siren-conditional-emacs-lisp-checker ()
  "Don't check doc style in Emacs Lisp test files."
  (let ((file-name (buffer-file-name)))
    (when (and file-name (string-match-p ".*-tests?\\.el\\'" file-name))
      (setq-local flycheck-checkers '(emacs-lisp)))))

(defun siren-emacs-lisp-mode-defaults ()
  "Sensible defaults for `emacs-lisp-mode'."
  ; (run-hooks 'siren-lisp-coding-hook)
  ; (eldoc-mode +1)
  ; (siren-recompile-elc-on-save)
  ; (rainbow-mode +1)
  ; (setq mode-name "EL")
  ; (siren-conditional-emacs-lisp-checker)
  )

(setq siren-emacs-lisp-mode-hook 'siren-emacs-lisp-mode-defaults)

(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (run-hooks 'siren-emacs-lisp-mode-hook)))

(add-to-list 'auto-mode-alist '("Cask\\'" . emacs-lisp-mode))

(eval-after-load "rainbow-mode"
  '(diminish 'rainbow-mode))

(provide 'siren-emacs-lisp)
;;; siren-emacs-lisp.el ends here
