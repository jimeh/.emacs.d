;;; siren-copilot.el --- jimeh's Emacs Siren: copilot configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for copilot. Auto completion on steroids.

;;; Code:

(require 'cl-lib)

(use-package copilot
  :straight (:host github :repo "copilot-emacs/copilot.el"
                   :files ("dist" "*.el"))
  :hook
  (prog-mode . copilot-mode)

  :general
  ("C-<tab>" 'siren-copilot-dwim-with-mods)
  ("<backtab>" 'siren-copilot-dwim-with-mods)
  ("M-]" 'siren-copilot-dwim-with-mods)
  ("M-F" 'siren-copilot-dwim-by-word)
  ("M-E" 'siren-copilot-dwim-by-line)
  (:keymaps 'copilot-completion-map
            "C-g" 'copilot-clear-overlay
            "M-N" 'copilot-next-completion
            "M-P" 'copilot-previous-completion
            ;; "M-f" 'copilot-accept-completion-by-word
            "M-<right>" 'copilot-accept-completion-by-word
            ;; "C-e" 'copilot-accept-completion-by-line
            "<end>" #'copilot-accept-completion-by-line)

  :custom
  (copilot-disable-predicates '(siren-copilot-disable-predicate))
  (copilot-indent-offset-warning-disable t)

  :preface
  (defun siren-copilot-disable-predicate ()
    (if buffer-file-name
      (let* ((full buffer-file-name)
             (base (file-name-nondirectory full))
             (dir (file-name-directory full)))
        (or (string-prefix-p ".env" base)
            (string-match-p "\/\.ansible\/tmp\/ansible-local-.+$" dir)
            (string-suffix-p ".kube/config" full)))
      (let ((name (string-trim (buffer-name))))
        (or (string-prefix-p "*temp*" name)
            (string-match-p "*scratch*" name)))))

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
    (siren-copilot--complete-or-call
     'siren-copilot-accept-with-mods))

  (defun siren-copilot--complete-or-call (f &rest args)
    "Trigger copilot-complete or call F."
    (if (copilot--overlay-visible)
        (apply f args)
      (copilot-complete)))

  (defgroup siren-copilot nil
    "Siren: copilot customization."
    :group 'copilot)

  (defcustom siren-copilot-accept-mods
    '((ruby-mode . ((:match "\\([^\s]+\s+\\)do\\(?: |.+|\\)?\\'"
                            :replace "\\1")
                    (:match "\\`\s*do\\( |.+|\\)?\\'"
                            :before "\n" :after "\nend")))
      (ruby-ts-mode . ((:match "\\([^\s]+\s+\\)do\\(?: |.+|\\)?\\'"
                                  :replace "\\1")
                          (:match "\\`\s*do\\( |.+|\\)?\\'"
                            :before "\n" :after "\nend")))
      (t . (;; Strip opening "{" from end of completion.
            (:match "\\([^\s]+\s*\\)\{\\'" :replace "\\1")
            ;; Inject closing "}" on newline if completion is only "{" or " {".
            (:match "\\`\s*\{\\'" :before "\n" :after "\n}")
            ;; Strip opening "[" from end of completion.
            (:match "\\([^\s]+\s*\\)\\[\\'" :replace "\\1")
            ;; Inject closing "]" on newline if completion is only "[" or " [".
            (:match "\\`\s*\\[\\'" :before "\n" :after "\n]")
            ;; Strip opening "(" from end of completion.
            (:match "\\([^\s]+\s*\\)\(\\'" :replace "\\1")
            ;; Inject closing ")" on newline if completion is only "(" or " (".
            (:match "\\`\s*\(\\'" :before "\n" :after "\n)"))))
    "List of mods of characters to balance."
    :group 'siren-copilot
    :type '(alist :key-type symbol
                  :value-type (repeat (plist :key-type symbol
                                             :value-type string))))

  (defun siren-copilot-accept-with-mods (&optional transform-fn)
    "Accept completion, and add balance text after point if needed."
    (interactive)
    (let ((active-mod nil))
      (copilot-accept-completion
       (lambda (completion)
         (let* ((t-completion (funcall (or transform-fn #'identity) completion))
                (mod (siren-copilot--get-mod t-completion)))
           (setq active-mod mod)
           (siren-copilot--replace-mod mod t-completion))))
      (siren-copilot--inject-mod active-mod)))

  (defun siren-copilot--get-mod (completion)
    (let ((mods (append (cdr (assoc major-mode siren-copilot-accept-mods))
                        (cdr (assoc t siren-copilot-accept-mods)))))
      (when (length> mods 0)
        (cl-loop for mod in mods
                 when (string-match-p (plist-get mod :match) completion)
                 return mod))))

  (defun siren-copilot--replace-mod (mod completion)
    (let ((match (plist-get mod :match))
          (replace (plist-get mod :replace)))
      (if (and match replace)
          (replace-regexp-in-string match replace completion)
        completion)))

  (defun siren-copilot--inject-mod (mod)
    (when mod
      (let ((before (plist-get mod :before))
            (after (plist-get mod :after))
            (indent (not (plist-get mod :no-indent)))
            (start (point))
            (end (point)))
        (when (or before after)
          (when before
            (insert before))
          (when after
            (save-excursion
              (insert after)
              (setq end (point))))
          (when indent
            (indent-region start end)
            (indent-according-to-mode))))))

  :config
  (with-eval-after-load 'company
    ;; Use company popup even when there's only one result.
    (when (member 'company-preview-if-just-one-frontend company-frontends)
      (require 'cl-seq)
      (setf (nth (cl-position 'company-preview-if-just-one-frontend
                              company-frontends)
                 company-frontends)
            'company-pseudo-tooltip-frontend)
      (delq 'company-preview-if-just-one-frontend company-frontends))))

(provide 'siren-copilot)
;;; siren-copilot.el ends here
