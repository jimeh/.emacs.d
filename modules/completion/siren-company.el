;;; siren-company.el --- jimeh's Emacs Siren: company configuration.

;;; Commentary:

;; Basic configuration for company. Auto completion on steroids.

;;; Code:

(use-package company
  :general
  ;; Enable indent and complete at point functionality by pressing tab.
  ("TAB" 'company-indent-or-complete-common)
  ;; Scroll through company suggestions with C-n and C-p.
  (:keymaps 'company-active-map
            "C-n" 'company-select-next
            "C-p" 'company-select-previous
            "<tab>" 'company-complete-selection)

  :custom
  (company-begin-commands '(self-insert-command))
  (company-dabbrev-downcase nil)
  (company-echo-delay 0.01)
  (company-idle-delay 0.2)
  (company-minimum-prefix-length 2)
  (company-tooltip-limit 20)
  ;; invert the navigation direction if the the completion popup-isearch-match
  ;; is displayed on top (happens near the bottom of windows)
  (company-tooltip-flip-when-above t)

  :hook
  (lsp-completion-mode . siren-company-lsp-mode-setup)

  :preface
  (defun siren-company-lsp-mode-setup ()
    (setq-local company-backends '(company-capf)))

  :config
  (global-company-mode 1)

  (with-eval-after-load 'fill-column-indicator
    (defvar-local siren-company--fci-mode-on-p nil)

    (defun siren-company--turn-off-fci (&rest ignore)
      (when (boundp 'fci-mode)
        (when fci-mode
          (turn-off-fci-mode)
          (setq siren-company--fci-mode-on-p t))))

    (defun siren-company--maybe-turn-on-fci (&rest ignore)
      (when siren-company--fci-mode-on-p
        (turn-on-fci-mode)
        (setq siren-company--fci-mode-on-p nil)))

    (add-hook 'company-completion-started-hook
              #'siren-company--turn-off-fci)
    (add-hook 'company-completion-finished-hook
              #'siren-company--maybe-turn-on-fci)
    (add-hook 'company-completion-cancelled-hook
              #'siren-company--maybe-turn-on-fci)))

(use-package company-yasnippet
  :straight company

  :preface
  (defgroup siren-company-yasnippet nil
    "Siren specific tweaks to company-yasnippet."
    :group 'company)

  (defcustom siren-company-yasnippet-exact-match-only nil
    "Only match completion when it is a exact match for a snippet key.

This allows company-yasnippet to be used before company-capf / lsp, allowing
snippets to be easily used when exactly typing out a snippet key."
    :type 'boolean
    :group 'siren-company-yasnippet)

  :custom
  (siren-company-yasnippet-exact-match-only t)

  :config
  ;; Dirty hack to optionally enable company-yasnippet to only match exact
  ;; snippet keys.
  (defun company-yasnippet--completions-for-prefix (prefix key-prefix tables)
    (cl-mapcan
     (lambda (table)
       (let ((keyhash (yas--table-hash table))
             (requirement (yas--require-template-specific-condition-p))
             res)
         (when keyhash
           (maphash
            (lambda (key value)
              (when (and (stringp key)
                         (if siren-company-yasnippet-exact-match-only
                             (string-equal key-prefix key)
                           (string-prefix-p key-prefix key)))
                (maphash
                 (lambda (name template)
                   (when (yas--template-can-expand-p
                          (yas--template-condition template) requirement)
                     (push
                      (propertize key
                                  'yas-annotation name
                                  'yas-template template
                                  'yas-prefix-offset (- (length key-prefix)
                                                        (length prefix)))
                      res)))
                 value)))
            keyhash))
         res))
     tables)))

(provide 'siren-company)
;;; siren-company.el ends here
