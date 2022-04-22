;;; siren-golang.el --- jimeh's Emacs Siren: go-mode configuration.

;;; Commentary:

;; Basic configuration for go-mode.

;;; Code:

(require 'siren-dap)
(require 'siren-display-indentation)
(require 'siren-flycheck)
(require 'siren-folding)
(require 'siren-lsp)
(require 'siren-projectile)
(require 'siren-reformatter)
(require 'siren-tree-sitter)

(use-package go-mode
  :mode "\\.go\\'"
  :interpreter "go"
  :commands go-mode
  :general
  (:keymaps 'go-mode-map
            "RET" 'newline-and-indent
            "C-h f" 'godoc-at-point)

  :hook
  (go-mode . siren-go-mode-setup)

  :preface
  (defun siren-go-mode-setup ()
    (setq-local tab-width 4
                company-minimum-prefix-length 1
                whitespace-style (delete 'indentation whitespace-style))

    (when (fboundp 'highlight-symbol-mode)
      (highlight-symbol-mode -1))
    (when (fboundp 'auto-highlight-symbol-mode)
      (auto-highlight-symbol-mode -1))

    (tree-sitter-mode +1)
    (siren-display-indentation -1)
    (siren-folding)
    (subword-mode +1))

  (defun siren-define-golines-format-mode ()
    ;; Setup golines formatter for manual use - on save formatting is handled by
    ;; lsp-mode.
    (reformatter-define golines-format
      :program "golines"
      :args '("-t" "4" "-m" "80" "--no-reformat-tags")
      :lighter "GOLINES"))

  :init
  (with-eval-after-load "projectile"
    (add-to-list 'projectile-globally-ignored-directories "Godeps")
    (add-to-list 'projectile-globally-ignored-directories "vendor/github.com")
    (add-to-list 'projectile-globally-ignored-directories "vendor/gopkg.in"))

  :config
  (siren-define-golines-format-mode)

  (define-key 'help-command (kbd "G") 'godoc)

  ;; Ignore go test -c output files
  (add-to-list 'completion-ignored-extensions ".test"))

(use-package lsp-go
  :straight lsp-mode

  :hook
  (go-mode . siren-lsp-go-mode-setup)

  :custom
  (lsp-go-use-placeholders t)
  (lsp-go-link-target "pkg.go.dev")
  (lsp-go-use-gofumpt t)
  (lsp-go-analyses '((nilness . t)
                     (shadow . t)
                     (unusedparams . t)
                     (unusedwrite . t)))

  :config
  ;; Create custom lsp-client for golangci-lint-langserver.
  (lsp-register-custom-settings
   '(("golangci-lint.command" ["golangci-lint" "run" "--out-format" "json"])))
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection
                                     '("golangci-lint-langserver"))
                    :major-modes '(go-mode)
                    :language-id "go"
                    :priority 0
                    :server-id 'golangci-lint
                    :add-on? t
                    :library-folders-fn #'lsp-go--library-default-directories
                    :initialization-options (lambda ()
                                              (gethash "golangci-lint"
                                                       (lsp-configuration-section "golangci-lint")))))
  (add-to-list 'lsp-language-id-configuration '(go-mode . "golangci-lint"))

  :preface
  (defun siren-lsp-go-mode-setup ()
    (setq-local siren-lsp-format-buffer-func 'siren-lsp-go-format-buffer)
    (lsp-format-buffer-on-save-mode t)
    (lsp-organize-imports-on-save-mode t)
    (lsp-deferred))

  (defun siren-lsp-go-format-buffer ()
    (lsp-format-buffer)
    (golines-format-buffer)))

(use-package go-dlv
  :defer t)

(use-package gotest
  :defer t
  :after (go-mode)
  :hook
  (go-mode . siren-gotest-setup)

  :general
  (:keymaps 'go-mode-map
            "C-c , a" 'go-test-current-project
            "C-c , v" 'go-test-current-file
            "C-c , s" 'go-test-current-test
            "C-c , c" 'go-test-current-coverage
            "C-c , b" 'go-test-current-benchmark
            "C-c , B" 'go-test-current-project-benchmarks
            "C-c , r" 'go-run
            "C-c , t" 'ff-find-other-file)

  :custom
  (go-test-verbose t)

  :preface
  (defun siren-gotest-setup ()
    (let ((extra-args "-count=1 -race"))
      (if (and (boundp 'go-test-local) go-test-local)
          (setq-local go-test-args (concat go-test-args " " extra-args))
        (setq-local go-test-args extra-args))))

  :init
  (when (not (version< emacs-version "28.0"))
    ;; Change ff-other-file-name to ff-find-the-other-file in Emacs 28.x and
    ;; later.
    (defun go-test--get-current-buffer ()
      "Return the test buffer for the current `buffer-file-name'.
If `buffer-file-name' ends with `_test.go', `current-buffer' is returned.
Otherwise, `ff-other-file-name' is used to find the test buffer.
For example, if the current buffer is `foo.go', the buffer for
`foo_test.go' is returned."
      (if (string-match "_test\.go$" buffer-file-name)
          (current-buffer)
        (let ((ff-always-try-to-create nil)
	      (filename (ff-find-the-other-file)))
          (when filename
	    (find-file-noselect filename)))))))

(use-package dap-go
  :straight dap-mode
  :after go-mode
  :general
  (:keymaps 'dap-mode-map
            "C-c , d" 'siren-dap-go-debug-current-test)

  :preface
  (defun siren-dap-go-debug-current-test ()
    (interactive)
    (let ((name (go-test--get-current-test)))
      (dap-debug
       (list :type "go"
             :request "launch"
             :name (concat "Go: Debug " name " test")
             :mode "auto"
             :program "${fileDirname}"
             :buildFlags nil
             :args (concat "-test.run ^" name "$")
             :env nil
             :envFile nil)))))

(use-package go-gen-test
  :defer t
  :after (go-mode)
  :general
  (:keymaps 'go-mode-map
            "C-c , g" 'go-gen-test-dwim
            "C-c , G" 'go-gen-test-exported))

(use-package go-projectile
  :defer t
  :after (go-mode)
  :hook (go-mode . siren-go-projectile-setup)

  :custom
  ;; prevent go-projectile from screwing up GOPATH
  (go-projectile-switch-gopath 'never)

  :preface
  (defun siren-go-projectile-setup ()))

(use-package go-playground
  :defer t)

(provide 'siren-golang)
;;; siren-golang.el ends here
