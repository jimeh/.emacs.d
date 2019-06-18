;;; siren-ruby.el --- jimeh's Emacs Siren: ruby-mode configuration.

;;; Commentary:

;; Basic configuration for ruby-mode.

;;; Code:

(require 'siren-company)
(require 'siren-folding)
(require 'siren-highlight-indentation)
(require 'siren-lsp)
(require 'siren-projectile)
(require 'siren-realgud)
(require 'siren-smartparens)
(require 'siren-toggle-quotes)

(add-to-list 'projectile-globally-ignored-directories "vendor/bundle")
(add-to-list 'projectile-globally-ignored-directories "vendor/ruby")

(use-package ruby-mode
  :ensure nil ;; loaded from emacs built-ins
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
              ("C-c C-l" . goto-line)
              ("C-M-f" . sp-ruby-forward-sexp)
              ("C-M-b" . sp-ruby-backward-sexp)
              ("C-c C-j" . lsp-ui-peek-find-definitions)
              ("C-c C-." . lsp-rename))

  :hook
  (ruby-mode . siren-ruby-mode-setup)

  :init
  (defun siren-ruby-mode-setup ()
    (setq c-tab-always-indent nil
          ruby-align-chained-calls t
          ruby-insert-encoding-magic-comment t
          ruby-use-smie t
          tab-width 2)

    (company-mode +1)
    (lsp)
    (hs-minor-mode 1)
    (hideshowvis-enable)
    (highlight-indentation-current-column-mode)
    (subword-mode +1))

  :config
  ;; We never want to edit Rubinius bytecode
  (add-to-list 'completion-ignored-extensions ".rbc")

  ;; Set up hs-mode (HideShow) for Ruby
  (add-to-list 'hs-special-modes-alist
               `(ruby-mode
                 ,(rx (or "def" "class" "module" "do" "if" "case")) ;; Block start
                 ,(rx (or "end"))                                   ;; Block end
                 ,(rx (or "#" "=begin"))                            ;; Comment start
                 ruby-forward-sexp nil)))

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
  (unbind-key "C-c C-r" inf-ruby-minor-mode-map))

(use-package rbenv
  :defer t
  :config
  (global-rbenv-mode))

(use-package realgud-byebug
  :commands realgud:byebug
  :after realgud)

(use-package robe
  :defer t
  :bind (:map robe-mode-map
              ("C-c C-j" . robe-jump)
              ("C-c b". pop-tag-mark))
  :hook (ruby-mode . robe-mode)

  :init
  (eval-after-load 'company
    '(push 'company-robe company-backends))

  :config
  ;; Unbind keys used by siren-expand-region module.
  (unbind-key "M-." robe-mode-map)
  (unbind-key "M-," robe-mode-map))

(use-package rspec-mode
  :defer t
  :hook (rspec-mode . siren-rspec-mode-setup)
  :init
  (defun siren-rspec-mode-setup ()
    (setq compilation-scroll-output t
          rspec-primary-source-dirs '("app")
          rspec-use-opts-file-when-available nil
          rspec-use-spring-when-possible t))

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
  :commands (rubocopfmt rubocopfmt-mode)
  :bind (:map ruby-mode-map
              ("C-c C-f" . rubocopfmt))
  :hook
  (ruby-mode . rubocopfmt-mode)

  :custom
  (rubocopfmt-show-errors 'echo))

(use-package ruby-compilation
  :defer t)

(use-package ruby-guard
  :ensure nil ;; loaded from vendor
  :commands ruby-guard)

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
