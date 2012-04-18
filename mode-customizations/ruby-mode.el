(autoload 'ruby-mode "ruby-mode" nil t)

(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rabl\\'" . ruby-mode))

(add-hook 'ruby-mode-hook
          (lambda ()
            (flyspell-prog-mode)
            (linum-mode t)
            (fci-mode)
            (require 'inf-ruby)
            (require 'ruby-electric)
            (require 'ruby-compilation)
            (require 'flymake)
            (require 'flymake-ruby)
            (when (require 'rsense nil 'noerror)
              (add-to-list 'ac-sources 'ac-source-rsense-method)
              (add-to-list 'ac-sources 'ac-source-rsense-constant))
            (flymake-ruby-load)
            (highlight-indentation-mode)
            (ruby-electric-mode t)
            (setq ruby-deep-arglist t)
            (setq ruby-deep-indent-paren nil)
            (setq c-tab-always-indent nil)
            (setq ruby-use-encoding-map nil)
            (setq ruby-electric-expand-delimiters-list (quote (124)))
            (hs-minor-mode 1)
            (setq whitespace-action (quote (auto-cleanup)))
            (define-key ruby-mode-map
              (kbd "RET") 'reindent-then-newline-and-indent)
            (define-key ruby-mode-map
              (kbd "C-c C-j") 'hs-toggle-hiding)
            (define-key ruby-mode-map
              (kbd "s-r") 'ruby-compilation-this-buffer)
            (define-key ruby-mode-map
              (kbd "C-c C-r") 'ruby-compilation-this-buffer)
            (define-key ruby-mode-map
              (kbd "C-c C-.") 'ac-complete-rsense)
            (define-key ruby-mode-map
              (kbd "C-x t") 'textmate-goto-file)
            (define-key ruby-mode-map
              (kbd "C-x C-t") 'textmate-goto-file)
            (define-key ruby-mode-map
              (kbd "C-c C-l") 'goto-line)
            (define-key ruby-mode-map
              (kbd "C-c C-b") 'eproject-ibuffer)))

;; Set up hs-mode (HideShow) for Ruby
(add-to-list 'hs-special-modes-alist
             '(ruby-mode
               "\\(def \\|class\\|module\\|do\\)" "end" "#"
               (lambda (arg) (ruby-end-of-block)) nil))

;; Workaround for missing method in ruby-mode.el
;; See: https://gist.github.com/1213051
(defun ruby-insert-end ()
  "Insert \"end\" at point and reindent current line."
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))

;; Yasnippet workaround for ruby-electric-mode
;; See: http://code.google.com/p/yasnippet/issues/detail?id=71
(defun yas/advise-indent-function (function-symbol)
  (eval `(defadvice ,function-symbol (around yas/try-expand-first activate)
           ,(format
             "Try to expand a snippet before point, then call `%s' as usual"
             function-symbol)
           (let ((yas/fallback-behavior nil))
             (unless (and (interactive-p)
                          (yas/expand))
               ad-do-it)))))
(yas/advise-indent-function 'ruby-indent-line)
(yas/advise-indent-function 'ruby-indent-command)
