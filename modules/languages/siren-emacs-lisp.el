;;; siren-emacs-lisp.el --- jimeh's Emacs Siren: emacs-lisp-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for emacs-lisp-mode.

;;; Code:

(require 'siren-lisp)
(require 'siren-string-inflection)

(use-package emacs-lisp-mode
  :straight (:type built-in)
  :mode "Cask\\'"

  :hook
  (emacs-lisp-mode . siren-emacs-lisp-mode-setup)

  :general
  (:keymaps 'emacs-lisp-mode-map
            "C-c C-u" 'string-inflection-all-cycle)

  :preface
  (defun siren-emacs-lisp-mode-setup ()
    "Sensible defaults for `emacs-lisp-mode'."
    ;; (run-hooks 'siren-lisp-coding-hook)
    ;; (eldoc-mode +1)
    ;; (siren-recompile-elc-on-save)
    ;; (rainbow-mode +1)
    ;; (setq-local mode-name "EL")
    ;; (siren-conditional-emacs-lisp-checker)
    )

  (defun siren-recompile-elc-on-save ()
    "Recompile your elc when saving an elisp file."
    (add-hook 'after-save-hook
              (lambda ()
                (when (and
                       (string-prefix-p siren-dir (file-truename buffer-file-name))
                       (file-exists-p (byte-compile-dest-file buffer-file-name)))
                  (emacs-lisp-byte-compile)))
              nil t))

  (defun siren-conditional-emacs-lisp-checker ()
    "Don't check doc style in Emacs Lisp test files."
    (let ((file-name (buffer-file-name)))
      (when (and file-name (string-match-p ".*-tests?\\.el\\'" file-name))
        (setq-local flycheck-checkers '(emacs-lisp))))))

(provide 'siren-emacs-lisp)
;;; siren-emacs-lisp.el ends here
