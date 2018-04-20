;;; siren-ruby.el --- jimeh's Emacs Siren: ruby-mode configuration.

;;; Commentary:

;; Basic configuration for ruby-mode.

;;; Code:

(require 'siren-company)
(require 'siren-folding)
(require 'siren-programming)
(require 'siren-smartparens)
(require 'siren-toggle-quotes)

(require 'smartparens-ruby)

(use-package rubocopfmt
  :ensure nil ;; loaded from vendor
  )

(use-package inf-ruby
  :defer t)

(use-package rspec-mode
  :defer t
  :config
  (rspec-install-snippets))

(use-package ruby-refactor
  :defer t)

(use-package ruby-tools
  :defer t
  :bind (:map ruby-tools-mode-map
              ("C-'" . toggle-quotes)))

(use-package yari
  :defer t
  :init
  (define-key 'help-command (kbd "R") 'yari))

(use-package ruby-mode
  :ensure nil ;; loaded from emacs built-ins
  :interpreter "ruby"
  :mode
  "Appraisals\\'"
  "Berksfile\\'"
  "Capfile\\'"
  "Gemfile\\'"
  "Guardfile\\'"
  "Podfile\\'"
  "Puppetfile\\'"
  "Rakefile\\'"
  "Thorfile\\'"
  "Vagrantfile\\'"
  "\\.cap\\'"
  "\\.gemspec\\'"
  "\\.jbuilder\\'"
  "\\.podspec\\'"
  "\\.rabl\\'"
  "\\.rake\\'"
  "\\.ru\\'"
  "\\.thor\\'"
  "\\.rb\\'"

  :bind (:map ruby-mode-map
              ("C-j" . newline-and-indent)
              ("RET" . newline-and-indent)
              ("C-c C-h" . siren-toggle-hiding)
              ("C-c C-l" . goto-line)
              ("C-M-f" . sp-ruby-forward-sexp)
              ("C-M-b" . sp-ruby-backward-sexp))

  :hook
  (ruby-mode . siren-ruby-mode-setup)

  :init
  (defun siren-ruby-mode-setup ()
    (siren-prog-mode-setup)

    (setq c-tab-always-indent nil
          rspec-primary-source-dirs '("app")
          ruby-align-chained-calls t
          ruby-insert-encoding-magic-comment t
          ruby-refactor-add-parens t
          ruby-use-smie t
          tab-width 2)

    (rubocopfmt-mode)
    (ruby-tools-mode +1)
    (hs-minor-mode 1)
    (company-mode +1)
    (subword-mode +1)
    (highlight-indentation-current-column-mode)
    (hideshowvis-enable))

  :config
  ;; We never want to edit Rubinius bytecode
  (add-to-list 'completion-ignored-extensions ".rbc")

  ;; Set up hs-mode (HideShow) for Ruby
  (add-to-list 'hs-special-modes-alist
               `(ruby-mode
                 ,(rx (or "def" "class" "module" "do" "if" "case")) ;; Block start
                 ,(rx (or "end"))                                   ;; Block end
                 ,(rx (or "#" "=begin"))                            ;; Comment start
                 ruby-forward-sexp nil))

  ;; Make company-mode play nice
  (push 'ruby-mode company-dabbrev-code-modes))

(provide 'siren-ruby)
;;; siren-ruby.el ends here
