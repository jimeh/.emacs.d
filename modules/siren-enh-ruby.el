;;
;; ruby
;;

(require 'siren-programming)

(siren-require-packages '(enh-ruby-mode ruby-tools inf-ruby yari))

;; Rake files are ruby, too, as are gemspecs, rackup files, and gemfiles.
(add-to-list 'auto-mode-alist '("\\.rb\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.cap\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rabl\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Thorfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Podfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.podspec\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Puppetfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Berksfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Appraisals\\'" . enh-ruby-mode))

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

;; I don't like having operators colored.
(custom-set-faces '(enh-ruby-op-face ((t nil))))

(eval-after-load 'enh-ruby-mode
  '(progn
     (defun siren-ruby-mode-defaults ()
       (siren-prog-mode-defaults)
       (ruby-tools-mode +1)
       (setq tab-width 2)
       (hs-minor-mode 1)
       (company-mode +1)
       (subword-mode +1)
       (setq highlight-indentation-offset 2)
       (highlight-indentation-mode)
       (highlight-indentation-current-column-mode)
       (setq enh-ruby-check-syntax nil)
       (setq enh-ruby-deep-indent-paren nil)
       (setq enh-ruby-bounce-deep-indent t)
       (setq ruby-deep-arglist nil)
       (setq c-tab-always-indent nil)
       (setq ruby-use-encoding-map nil)
       (define-key enh-ruby-mode-map (kbd "C-c C-h") 'toggle-hiding)
       (define-key enh-ruby-mode-map (kbd "C-c C-l") 'goto-line))

     (setq siren-ruby-mode-hook 'siren-ruby-mode-defaults)

     (add-hook 'enh-ruby-mode-hook (lambda ()
                                     (run-hooks 'siren-ruby-mode-hook)))))


(provide 'siren-enh-ruby)
