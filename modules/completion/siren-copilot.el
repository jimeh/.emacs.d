;;; siren-copilot.el --- jimeh's Emacs Siren: copilot configuration.

;;; Commentary:

;; Basic configuration for copilot. Auto completion on steroids.

;;; Code:

(require 'cl-lib)

(use-package copilot
  :straight (:host github :repo "zerolfx/copilot.el"
                   :files ("dist" "*.el"))
  :hook
  (prog-mode . copilot-mode)

  :general
  ("C-<tab>" 'siren-copilot-dwim-with-mods)
  ("<backtab>" 'siren-copilot-dwim-with-mods)
  ("M-F" 'siren-copilot-dwim-by-word)
  ("M-E" 'siren-copilot-dwim-by-line)
  (:keymaps 'copilot-completion-map
            "M-N" 'copilot-next-completion
            "M-P" 'copilot-previous-completion)

  :custom
  (copilot-auto-balance t)
  (copilot-disable-predicates '(siren-copilot-disable-predicate))

  :preface
  (defun siren-copilot-disable-predicate ()
    (when buffer-file-name
      (let* ((full buffer-file-name)
             (base (file-name-nondirectory full))
             (dir (file-name-directory full)))
        (or (string-prefix-p ".env" base)
            (string-match-p "\/\.ansible\/tmp\/ansible-local-.+$" dir)
            (string-suffix-p ".kube/config" full)))))

  (defun siren-copilot-dwim ()
    "Trigger or accept completion."
    (interactive)
    (siren-copilot--complete-or-call
     'copilot-accept-completion))

  (defun siren-copilot-dwim-by-word (n-word)
    "Trigger or accept N-WORD words from current completion."
    (interactive "p")
    (siren-copilot--complete-or-call
     'copilot-accept-completion-by-word n-word))

  (defun siren-copilot-dwim-by-line (n-line)
    "Trigger or accept N-LINE lines from current completion."
    (interactive "p")
    (siren-copilot--complete-or-call
     'copilot-accept-completion-by-line n-line))

  (defun siren-copilot-dwim-with-mods ()
    "Trigger or accept completion."
    (interactive)
    (if (copilot--overlay-visible)
        (siren-copilot-accept-with-mods)
      (copilot-complete)))

  (defun siren-copilot--complete-or-call (f &rest args)
    "Trigger copilot-complete or call F."
    (if (copilot--overlay-visible)
        (apply f args)
      (copilot-complete)))

  (defgroup siren-copilot nil
    "Siren: copilot customization."
    :group 'copilot)

  (defcustom siren-copilot-accept-mods
    '((ruby-mode . ((" do\\( |.+|\\)?" . ("\n" "\nend"))))
      (t . (("\{$" . ("\n" "\n}"))
            ("\\[$" . ("\n" "\n]"))
            ("\($" . ("\n" "\n)")))))
    "List of mods of characters to balance."
    :type '(alist :key-type symbol
                  :value-type (alist :key-type string
                                     :value-type (list string string)))
    :group 'siren-copilot)

  (defun siren-copilot-accept-with-mods ()
    "Accept completion, and add balance text after point if needed."
    (interactive)
    (let ((mod nil))
      (copilot-accept-completion (lambda (completion)
                                   (setq mod (siren-copilot--get-mod completion))
                                   completion))
      (siren-copilot--insert-mod mod)))

  (defun siren-copilot--get-mod (text)
    (let ((mods (append (cdr (assoc major-mode siren-copilot-accept-mods))
                        (cdr (assoc t siren-copilot-accept-mods)))))
      (when (length> mods 0)
        (cl-loop for (open . mod) in mods
                 when (string-match-p open text)
                 return mod))))

  (defun siren-copilot--insert-mod (mod)
    (when mod
      (let ((before (if (length> mod 1) (car mod)))
            (after (if (length> mod 1) (cadr mod) (car mod))))
        (let ((start (point))
              (end (point)))
          (if before (insert before))
          (save-excursion
            (insert after)
            (setq end (point)))
          (indent-region start end)
          (indent-according-to-mode)))))

  :config
  (with-eval-after-load 'company
    ;; Use company popup even when there's only one result
    (when (member 'company-preview-if-just-one-frontend company-frontends)
      (require 'cl-seq)
      (delq 'company-preview-if-just-one-frontend company-frontends)
      (setf (nth (cl-position 'company-pseudo-tooltip-unless-just-one-frontend
                           company-frontends)
                 company-frontends)
            'company-pseudo-tooltip-frontend))))

(provide 'siren-copilot)
;;; siren-copilot.el ends here
