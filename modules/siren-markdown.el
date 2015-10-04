;;
;; sass
;;

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
  (fci-mode)
  (linum-mode t)
  (flyspell-mode)
  (auto-fill-mode)
  (subword-mode)
  (define-key markdown-mode-map (kbd "C-c p") 'markdown-preview))

(setq siren-markdown-mode-hook 'siren-markdown-mode-defaults)

(add-hook 'markdown-mode-hook (lambda () (run-hooks 'siren-markdown-mode-hook)))


(provide 'siren-markdown)
