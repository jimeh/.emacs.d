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
            (require 'inf-ruby)
            (require 'ruby-electric)
            (require 'ruby-compilation)
            (require 'flymake)
            (require 'flymake-ruby)
            (flymake-ruby-load)
            (flyspell-prog-mode)
            (ruby-electric-mode t)
            (setq ruby-deep-arglist t)
            (setq ruby-deep-indent-paren nil)
            (setq c-tab-always-indent nil)
            (setq ruby-use-encoding-map nil)
            (setq ruby-electric-expand-delimiters-list (quote (124)))
            (setq whitespace-action (quote (auto-cleanup)))
            (column-marker-1 80)
            (define-key ruby-mode-map
              (kbd "RET") 'reindent-then-newline-and-indent)
            (define-key ruby-mode-map
              (kbd "s-r") 'run-rails-test-or-ruby-buffer)))

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
