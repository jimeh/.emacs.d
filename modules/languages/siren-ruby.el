;;; siren-ruby.el --- jimeh's Emacs Siren: ruby-mode configuration.

;;; Commentary:

;; Basic configuration for ruby-mode.

;;; Code:

(require 'siren-cycle-quotes)
(require 'siren-dap)
(require 'siren-hideshow)
(require 'siren-lsp)
(require 'siren-projectile)
(require 'siren-reformatter)
(require 'siren-string-inflection)
(require 'siren-treesit)

(defun siren-define-stree-format-mode ()
  "Setup stree (syntax_tree) formatter."
  (when (not (boundp 'stree-format-on-save-mode-hook))
    (reformatter-define stree-format
      :program "stree"
      :args '("format" "--print-width=80")
      :lighter " STREE")))

(defun siren-ruby-setup-hs-special-modes ()
  "Set up hs-mode (HideShow) for Ruby."
  (add-to-list 'hs-special-modes-alist
               `(ruby-mode
                 ,(rx (or "def" "class" "module" "do" "if" "case")) ;; Block start
                 ,(rx (or "end"))                                   ;; Block end
                 ,(rx (or "#" "=begin"))                            ;; Comment start
                 ruby-forward-sexp nil)))

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

  :general
  (:keymaps 'ruby-mode-map
            "C-j" 'newline-and-indent
            "RET" 'newline-and-indent
            "M-'" 'ruby-toggle-string-quotes
            "C-c C-l" 'goto-line
            "C-M-f" 'sp-ruby-forward-sexp
            "C-M-b" 'sp-ruby-backward-sexp
            "C-c C-u" 'string-inflection-ruby-style-cycle)

  :hook
  (ruby-mode . siren-ruby-mode-setup)

  :preface
  (defun siren-ruby-mode-setup ()
    (setq-local c-tab-always-indent nil
                ruby-align-chained-calls t
                ruby-insert-encoding-magic-comment t
                ruby-use-smie t
                tab-width 2)

    (hs-minor-mode t))

  :init
  (with-eval-after-load 'projectile
    (add-to-list 'projectile-globally-ignored-directories "vendor/bundle")
    (add-to-list 'projectile-globally-ignored-directories "vendor/ruby"))

  :config
  (siren-define-stree-format-mode)
  (siren-ruby-setup-hs-special-modes)

  ;; Use M-' instead to togle quote styles
  (unbind-key "C-c '" ruby-mode-map)

  ;; We never want to edit Rubinius bytecode
  (add-to-list 'completion-ignored-extensions ".rbc"))

(if (fboundp 'ruby-ts-mode)
    (use-package ruby-ts-mode
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

      :general
      (:keymaps 'ruby-ts-mode-map
                "C-j" 'newline-and-indent
                "RET" 'newline-and-indent
                "M-'" 'ruby-toggle-string-quotes
                "C-c C-l" 'goto-line
                "C-M-f" 'sp-ruby-forward-sexp
                "C-M-b" 'sp-ruby-backward-sexp
                "C-c C-u" 'string-inflection-ruby-style-cycle)

      :hook
      (ruby-ts-mode . siren-ruby-ts-mode-setup)

      :preface
      (defun siren-ruby-ts-mode-setup ()
        (setq-local c-tab-always-indent nil
                    tab-width 2)

        (siren-treesit-add-features '(block-braces))
        (siren-treesit-append-font-lock-settings
         :default-language 'ruby

         ;; Use custom operators list.
         :feature 'operator
         :override t
         `("!" @font-lock-negation-char-face
             [,@siren-ruby-ts-operators] @font-lock-operator-face)

         ;; Braces, when used to denote a block, have the same function as
         ;; "do" and "end" and should be highlighted similarly.
         :feature 'block-braces
         :override t
         '((block ["{" "}"] @font-lock-keyword-face))

         ;; Highlight string interpolation begin/end markers as keywords.
         :feature 'interpolation
         :override t
         '((interpolation "#{" @font-lock-keyword-face)
             (interpolation "}" @font-lock-keyword-face)))

        (hs-minor-mode t))

      :config
      (siren-treesit-auto-ensure-grammar 'ruby)
      (siren-define-stree-format-mode)
      (siren-ruby-setup-hs-special-modes)

      (defgroup siren-ruby-ts nil
        "Customizations for the ruby-ts-mode package."
        :group 'siren)

      ;; Must be defined after ruby-ts-mode is loaded, as we need access to the
      ;; `ruby-ts--operators' variable.
      (defcustom siren-ruby-ts-operators
        (append ruby-ts--operators '("->" "||="))
        "Ruby operators for tree-sitter font-locking."
        :group 'siren-ruby-ts)))

(use-package lsp-solargraph
  :straight lsp-mode

  :hook
  (ruby-mode . siren-lsp-ruby-mode-setup)
  (ruby-ts-mode . siren-lsp-ruby-mode-setup)

  :custom
  (lsp-solargraph-multi-root nil)
  (lsp-solargraph-log-level "warn")

  :preface
  (defun siren-lsp-solargraph-format-on-save-p ()
    "Determine if format on save (FoS) should be enabled in the current buffer.

Returns t if FoS should be enabled, nil otherwise.

Currently only disables FoS in 'db/schema.rb' files, as Rails' generated
output typically does not conform to any common Ruby formatting standards."
    (let ((db-schema-file (concat (file-name-as-directory "db") "schema.rb")))
      (or (not buffer-file-name)
          (not (string-suffix-p db-schema-file buffer-file-name)))))

  (defun siren-lsp-ruby-mode-setup ()
    (setq-local siren-lsp-manual-format-buffer-func
                'siren-lsp-solargraph-manual-format-buffer)

    ;; Disable ruby clients which have higher priority than the ruby-ls client.
    (setq-local lsp-disabled-clients '(vue-semantic-server))

    ;; Enable format on save if the predicate returns true.
    (when (siren-lsp-solargraph-format-on-save-p)
      (lsp-format-buffer-on-save-mode t))

    (lsp-deferred))

  (defun siren-lsp-solargraph-manual-format-buffer ()
    (stree-format-buffer)
    (lsp-format-buffer))

  (defun siren-lsp-ruby-prevent-rename-advice (orig-fun &rest args)
    "Prevent lsp-rename being using in Ruby buffers.

Solargraph's rename functionality is highly unreliable. Most of
the time randomly renames unrelated things to new random values.

Essentially, any use of lsp-rename in Ruby buffers is a mistake,
and will break things."
    (if (or (eq major-mode 'ruby-mode) (eq major-mode 'ruby-ts-mode))
        (message "lsp-rename is disabled in ruby-mode and ruby-ts-mode")
      (apply orig-fun args)))

  :init
  (advice-add 'lsp-rename :around #'siren-lsp-ruby-prevent-rename-advice)
  (add-to-list 'safe-local-variable-values
               '(lsp-solargraph-use-bundler . t)))

;; (use-package lsp-ruby-lsp
;;   :straight lsp-mode

;;   :hook
;;   (ruby-mode . siren-lsp-ruby-lsp-mode-setup)

;;   :custom
;;   (lsp-solargraph-multi-root nil)
;;   (lsp-solargraph-log-level "warn")

;;   :preface
;;   (defun siren-lsp-ruby-lsp-format-on-save-p ()
;;     "Determine if format on save (FoS) should be enabled in the current buffer.

;; Returns t if FoS should be enabled, nil otherwise.

;; Currently only disables FoS in 'db/schema.rb' files, as Rails' generated
;; output typically does not conform to any common Ruby formatting standards."
;;     (let ((db-schema-file (concat (file-name-as-directory "db") "schema.rb")))
;;       (or (not buffer-file-name)
;;           (not (string-suffix-p db-schema-file buffer-file-name)))))

;;   (defun siren-lsp-ruby-lsp-mode-setup ()
;;     (setq-local siren-lsp-manual-format-buffer-func
;;                 'siren-lsp-ruby-lsp-manual-format-buffer)

;;     ;; Disable ruby clients which have higher priority than the ruby-lsp-ls
;;     ;; client.
;;     (setq-local lsp-disabled-clients '(vue-semantic-server ruby-ls rubocop-ls))

;;     ;; Disable semantic tokens as it typically causes an annoying delay with the
;;     ;; syntax highlighting as you type. Essentially all new text is a very faded
;;     ;; out grey color for the first 1-2 seconds as you type.
;;     (setq-local lsp-semantic-tokens-enable nil)

;;     ;; Enable format on save if the predicate returns true.
;;     (when (siren-lsp-ruby-lsp-format-on-save-p)
;;       (lsp-format-buffer-on-save-mode t))

;;     (lsp-deferred))

;;   (defun siren-lsp-ruby-lsp-manual-format-buffer ()
;;     (stree-format-buffer)
;;     (lsp-format-buffer))

;;   ;; :config
;;   ;; (lsp-register-client
;;   ;;  (make-lsp-client
;;   ;;   :new-connection (lsp-stdio-connection #'lsp-rubocop--build-command)
;;   ;;   :activation-fn (lsp-activate-on "ruby")
;;   ;;   :priority -1
;;   ;;   :server-id 'rubocop-lsp
;;   ;;   :add-on? t))
;;   )

(use-package dap-ruby
  :straight dap-mode
  :after (ruby-mode dap-mode))

(use-package bundler
  :defer t
  :preface
  (defun siren-bundle-command (cmd)
    "Run cmd in a compilation buffer."
    (let* ((buffer-name "*Bundler*")
           (default-directory (bundle-locate-gemfile))
           (compilation-buffer-name-function (lambda (mode) buffer-name)))
      (if (string-prefix-p "bundle exec" cmd)
          (async-shell-command cmd buffer-name)
        (compile cmd))))

  :config
  (defalias 'bundle-command 'siren-bundle-command))

(use-package inf-ruby
  :defer t
  :hook
  (ruby-mode . inf-ruby-minor-mode)
  (ruby-ts-mode . inf-ruby-minor-mode)
  (inf-ruby-mode . siren-inf-ruby-mode-setup)
  (compilation-filter . inf-ruby-auto-enter)

  :preface
  (defun siren-inf-ruby-mode-setup ()
    (if (fboundp 'company-mode)
        (company-mode -1)))

  :config
  (inf-ruby-switch-setup)
  (unbind-key "C-c C-b" inf-ruby-minor-mode-map)
  (unbind-key "C-c C-q" inf-ruby-minor-mode-map)
  (unbind-key "C-c C-r" inf-ruby-minor-mode-map)
  (unbind-key "C-c C-s" inf-ruby-minor-mode-map))

(use-package rspec-mode
  :defer t
  :hook (rspec-mode . siren-rspec-mode-setup)

  :custom
  (compilation-scroll-output t)
  (rspec-primary-source-dirs '("app"))
  (rspec-spec-command "env COVERAGE=0 rspec")
  (rspec-use-opts-file-when-available nil)
  (rspec-use-spring-when-possible nil)

  :preface
  (defun siren-rspec-mode-setup ())

  :config
  (rspec-install-snippets))

(use-package rubocop
  :defer t
  :after ruby-mode
  :general
  (:keymaps '(ruby-mode-map ruby-ts-mode-map)
            "C-c . f" 'rubocop-check-current-file
            "C-c . p" 'rubocop-check-project
            "C-c . d" 'rubocop-check-directory
            "C-c . F" 'rubocop-autocorrect-current-file
            "C-c . P" 'rubocop-autocorrect-project
            "C-c . D" 'rubocop-autocorrect-directory))

(use-package rubocopfmt
  :general
  (:keymaps '(ruby-mode-map ruby-ts-mode-map)
            "C-c C-f" 'rubocopfmt)

  :custom
  (rubocopfmt-include-unsafe-cops t)
  (rubocopfmt-show-errors 'echo)
  (rubocopfmt-use-bundler-when-possible t)

  :init
  (add-to-list 'safe-local-variable-values
               '(rubocopfmt-include-unsafe-cops))
  (add-to-list 'safe-local-variable-values
               '(rubocopfmt-on-save-use-lsp-format-buffer)))

(use-package ruby-compilation
  :defer t)

(use-package ruby-refactor
  :defer t
  :hook
  (ruby-mode . ruby-refactor-mode)
  (ruby-ts-mode . ruby-refactor-mode)

  :custom
  (ruby-refactor-keymap-prefix (kbd "C-c C-="))
  (ruby-refactor-add-parens t))

(use-package ruby-tools
  :defer t
  :diminish ruby-tools-mode
  :general
  (:keymaps 'ruby-tools-mode-map
            "C-'" 'cycle-quotes)
  :hook
  (ruby-mode . ruby-tools-mode)
  (ruby-ts-mode . ruby-tools-mode)

  :config
  ;; Unbind key used by siren-resize-window module.
  (unbind-key "C-;" ruby-tools-mode-map))

(use-package seeing-is-believing
  :defer t
  :commands seeing-is-believing)

(use-package yari
  :defer t
  :general
  (:keymaps 'help-command
            "R" 'yari))

(provide 'siren-ruby)
;;; siren-ruby.el ends here
