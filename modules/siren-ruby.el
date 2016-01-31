;;; siren-ruby.el --- jimeh's Emacs Siren: ruby-mode configuration.

;;; Commentary:

;; Basic configuration for ruby-mode.

;;; Code:

(require 'siren-programming)
(require 'siren-company)

(siren-require-packages '(ruby-tools inf-ruby yari))

;; Rake files are ruby, too, as are gemspecs, rackup files, and gemfiles.
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.cap\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rabl\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Thorfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Podfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.podspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Puppetfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Berksfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Appraisals\\'" . ruby-mode))

;; We never want to edit Rubinius bytecode
(add-to-list 'completion-ignored-extensions ".rbc")

(define-key 'help-command (kbd "R") 'yari)

;; Set up hs-mode (HideShow) for Ruby
(add-to-list 'hs-special-modes-alist
             `(ruby-mode
               ,(rx (or "def" "class" "module" "do")) ;; Block start
               ,(rx (or "end"))                       ;; Block end
               ,(rx (or "#" "=begin"))                ;; Comment start
               ruby-forward-sexp nil))

;; Make company-mode play nice
(push 'ruby-mode company-dabbrev-code-modes)

(eval-after-load 'ruby-mode
  '(progn
     (defun siren-ruby-mode-defaults ()
       (siren-prog-mode-defaults)
       (ruby-tools-mode +1)
       (setq tab-width 2)
       (hs-minor-mode 1)
       (company-mode +1)
       (subword-mode +1)
       (highlight-indentation-mode)
       (highlight-indentation-current-column-mode)

       (setq ruby-use-smie t)
       (setq ruby-align-chained-calls t)
       (setq ruby-insert-encoding-magic-comment t)

       (setq c-tab-always-indent nil)
       (setq ruby-use-encoding-map nil)
       (let ((map ruby-mode-map))
         (define-key map (kbd "C-j") 'newline-and-indent)
         (define-key map (kbd "RET") 'newline-and-indent)
         (define-key map (kbd "C-c C-h") 'siren-toggle-hiding)
         (define-key map (kbd "C-c C-l") 'goto-line)))

     (setq siren-ruby-mode-hook 'siren-ruby-mode-defaults)

     (add-hook 'ruby-mode-hook (lambda ()
                                 (run-hooks 'siren-ruby-mode-hook)))))

;; ;; Auto-complete when indenting
;; (defadvice ruby-indent-command (around ac-before-ruby-indent activate)
;;   "Call `auto-complete' if text was recently entered"
;;   (if (ac-trigger-command-p last-command)
;;       (auto-complete)
;;     ad-do-it))

(provide 'siren-ruby)
;;; siren-ruby.el ends here
