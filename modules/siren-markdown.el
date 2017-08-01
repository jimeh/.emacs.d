;;; siren-markdown.el --- jimeh's Emacs Siren: markdown-mode configuration.

;;; Commentary:

;; Basic configuration for markdown-mode.

;;; Code:

(siren-require-packages '(markdown-mode))

(require 'markdown-mode)

(setq markdown-command "redcarpet")

(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.mkd" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.mkdn" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.mdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

(defun siren-markdown-mode-defaults ()
  (setq whitespace-action nil)
  (setq fill-column 80)
  (setq markdown-asymmetric-header t)
  (fci-mode)
  (linum-mode t)
  (flyspell-mode)
  (auto-fill-mode)
  (subword-mode)
  (define-key markdown-mode-map (kbd "C-c p") 'markdown-preview))

(setq siren-markdown-mode-hook 'siren-markdown-mode-defaults)

(add-hook 'markdown-mode-hook (lambda () (run-hooks 'siren-markdown-mode-hook)))

(custom-set-faces
 '(markdown-code-face ((t nil))))

(provide 'siren-markdown)
;;; siren-markdown.el ends here
