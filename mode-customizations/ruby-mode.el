(autoload 'ruby-mode "ruby-mode" nil t)

(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rabl\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.prawn\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Cheffile" . ruby-mode))

(defun customizations-for-ruby-mode ()
  (interactive)
  (require 'inf-ruby)

  (when (require 'ruby-electric nil 'noerror)
    (ruby-electric-mode t)
    (setq ruby-electric-expand-delimiters-list (quote (124))))

  (when (require 'ruby-compilation nil 'noerror)
    (define-key ruby-mode-map (kbd "s-r") 'ruby-compilation-this-buffer)
    (define-key ruby-mode-map (kbd "C-c C-r") 'ruby-compilation-this-buffer))

  (when (require 'auto-complete nil 'noerror)
    (auto-complete-mode))

  (when (require 'rsense nil 'noerror)
    (add-to-list 'ac-sources 'ac-source-rsense-method)
    (add-to-list 'ac-sources 'ac-source-rsense-constant)
    (define-key ruby-mode-map (kbd "C-c C-.") 'ac-complete-rsense))

  (when (require 'eproject nil 'noerror)
    (define-key ruby-mode-map (kbd "C-c C-b") 'eproject-ibuffer))

  (when (require 'textmate nil 'noerror)
    (define-key ruby-mode-map (kbd "C-x C-t") 'textmate-goto-file))

  (linum-mode t)
  (fci-mode)
  (flyspell-prog-mode)
  (highlight-indentation-mode)
  (highlight-indentation-current-column-mode)
  (hs-minor-mode 1)
  (flymake-ruby-load)
  (subword-mode)
  (setq ruby-deep-arglist t)
  (setq ruby-deep-indent-paren nil)
  (setq c-tab-always-indent nil)
  (setq ruby-use-encoding-map nil)
  (setq whitespace-action (quote (auto-cleanup)))
  (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
  (define-key ruby-mode-map (kbd "C-c C-h") 'hs-toggle-hiding)
  (define-key ruby-mode-map (kbd "C-c C-l") 'goto-line)
)

(add-hook 'ruby-mode-hook 'customizations-for-ruby-mode)

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

;; Auto-complete when indenting
(defadvice ruby-indent-command (around ac-before-ruby-indent activate)
  "Call `auto-complete' if text was recently entered"
  (if (ac-trigger-command-p last-command)
      (auto-complete)
    ad-do-it))

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
