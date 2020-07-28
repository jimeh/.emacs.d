;;; siren-ruby.el --- jimeh's Emacs Siren: ruby-mode configuration.

;;; Commentary:

;; Basic configuration for ruby-mode.

;;; Code:

(require 'siren-company)
(require 'siren-folding)
(require 'siren-lsp)
(require 'siren-projectile)
(require 'siren-string-inflection)
(require 'siren-toggle-quotes)

(add-to-list 'projectile-globally-ignored-directories "vendor/bundle")
(add-to-list 'projectile-globally-ignored-directories "vendor/ruby")

(use-package ruby-mode
  :straight (:type built-in)
  :interpreter "ruby"
  :mode
  "Appraisals\\'"
  "Berksfile\\'"
  "Brewfile\\'"
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
              ("M-'" . ruby-toggle-string-quotes)
              ("C-c C-l" . goto-line)
              ("C-M-f" . sp-ruby-forward-sexp)
              ("C-M-b" . sp-ruby-backward-sexp)
              ("C-c C-u" . string-inflection-ruby-style-cycle))

  :hook
  (ruby-mode . siren-ruby-mode-setup)

  :init
  (defun siren-ruby-mode-setup ()
    (setq-local c-tab-always-indent nil
                ruby-align-chained-calls t
                ruby-insert-encoding-magic-comment t
                ruby-use-smie t
                tab-width 2)

    (company-mode +1)
    (siren-folding)
    (subword-mode +1))

  :config
  ;; Use M-' instead to togle quote styles
  (unbind-key "C-c '" ruby-mode-map)

  ;; We never want to edit Rubinius bytecode
  (add-to-list 'completion-ignored-extensions ".rbc")

  ;; Set up hs-mode (HideShow) for Ruby
  (add-to-list 'hs-special-modes-alist
               `(ruby-mode
                 ,(rx (or "def" "class" "module" "do" "if" "case")) ;; Block start
                 ,(rx (or "end"))                                   ;; Block end
                 ,(rx (or "#" "=begin"))                            ;; Comment start
                 ruby-forward-sexp nil)))

(use-package lsp-solargraph
  :straight (lsp-mode)

  :hook
  (ruby-mode . lsp-deferred)

  :custom
  (lsp-solargraph-multi-root nil))

(use-package bundler
  :defer t)

(use-package inf-ruby
  :defer t
  :hook
  (ruby-mode . inf-ruby-minor-mode)
  (inf-ruby-mode . siren-inf-ruby-mode-setup)
  (compilation-filter . inf-ruby-auto-enter)

  :init
  (defun siren-inf-ruby-mode-setup ()
    (company-mode -1))

  :config
  (unbind-key "C-c C-r" inf-ruby-minor-mode-map)
  (unbind-key "C-c C-s" inf-ruby-minor-mode-map))

(use-package rbenv
  :defer t
  :config
  (global-rbenv-mode))

(use-package rspec-mode
  :defer t
  :hook (rspec-mode . siren-rspec-mode-setup)

  :custom
  (compilation-scroll-output t)
  (rspec-primary-source-dirs '("app"))
  (rspec-spec-command "env COVERAGE=0 rspec")
  (rspec-use-opts-file-when-available nil)
  (rspec-use-spring-when-possible nil)

  :init
  (defun siren-rspec-mode-setup ())

  :config
  (rspec-install-snippets))

(use-package rubocop
  :defer t
  :after ruby-mode
  :bind (:map ruby-mode-map
              ("C-c . f" . rubocop-check-current-file)
              ("C-c . p" . rubocop-check-project)
              ("C-c . d" . rubocop-check-directory)
              ("C-c . F" . rubocop-autocorrect-current-file)
              ("C-c . P" . rubocop-autocorrect-project)
              ("C-c . D" . rubocop-autocorrect-directory)))

(use-package rubocopfmt
  :bind (:map ruby-mode-map
              ("C-c C-f" . rubocopfmt))
  :hook
  (ruby-mode . rubocopfmt-mode)

  :custom
  (rubocopfmt-include-unsafe-cops t)
  (rubocopfmt-on-save-use-lsp-format-buffer nil)
  (rubocopfmt-show-errors 'echo)
  (rubocopfmt-use-bundler-when-possible nil)
  (rubocopfmt-rubocop-command
   (expand-file-name "bin/rubocop-daemon-wrapper" siren-dir)))

(use-package ruby-compilation
  :defer t)

(use-package ruby-refactor
  :defer t
  :hook
  (ruby-mode . ruby-refactor-mode)

  :custom
  (ruby-refactor-keymap-prefix (kbd "C-c C-="))
  (ruby-refactor-add-parens t))

(use-package ruby-tools
  :defer t
  :diminish ruby-tools-mode
  :bind (:map ruby-tools-mode-map
              ("C-'" . toggle-quotes))
  :hook
  (ruby-mode . ruby-tools-mode)

  :config
  ;; Unbind key used by siren-resize-window module.
  (unbind-key "C-;" ruby-tools-mode-map))

(use-package seeing-is-believing
  :defer t
  :commands seeing-is-believing)

(use-package yari
  :defer t
  :init
  (define-key 'help-command (kbd "R") 'yari))

(provide 'siren-ruby)
;;; siren-ruby.el ends here
