;;; siren-golang.el --- jimeh's Emacs Siren: go-mode configuration.

;;; Commentary:

;; Basic configuration for go-mode.

;;; Code:

(require 'siren-dap)
(require 'siren-flycheck)
(require 'siren-lsp)
(require 'siren-prog-mode)
(require 'siren-projectile)
(require 'siren-reformatter)

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
  (go-dot-mod-mode . siren-go-dot-mod-mode-setup)
  (go-dot-work-mode . siren-go-dot-mod-mode-setup)

  :preface
  (defgroup siren-go nil
    "Siren: go-mode configuration."
    :group 'go)

  (defcustom siren-go-tab-width 4
    "Tab width to set in all Go related modes."
    :type 'number
    :group 'siren-go)

  (defun siren-go-mode-setup ()
    (setq-local tab-width siren-go-tab-width
                company-minimum-prefix-length 1)

    (when (fboundp 'highlight-symbol-mode)
      (highlight-symbol-mode -1))
    (when (fboundp 'auto-highlight-symbol-mode)
      (auto-highlight-symbol-mode -1)))

  (defun siren-go-dot-mod-mode-setup ()
    (run-hooks 'prog-mode-hook)
    (setq-local tab-width siren-go-tab-width))

  (defun siren-define-golines-format-mode ()
    "Setup and define golines formatter."
    (reformatter-define golines-format
      :program "golines"
      :args '("-t" "4" "-m" "80" "--no-reformat-tags")
      :lighter " GOLINES"))

  :init
  (with-eval-after-load 'projectile
    (add-to-list 'projectile-globally-ignored-directories "Godeps")
    (add-to-list 'projectile-globally-ignored-directories "vendor/github.com")
    (add-to-list 'projectile-globally-ignored-directories "vendor/gopkg.in"))

  (with-eval-after-load 'tree-sitter-langs
    (tree-sitter-hl-add-patterns 'go
      [
       ;; Highlight built-in functions with the built-in face, based on:
       ;; https://github.com/tree-sitter/tree-sitter-go/pull/61
       (call_expression
        function: (identifier) @function.builtin
        (.match? @function.builtin "^(append|cap|close|complex|copy|delete|imag|len|make|new|panic|print|println|real|recover)$"))
       ;; Highlight struct/block keys as properties after field_identifier was
       ;; removed from the Go parser:
       ;; https://github.com/tree-sitter/tree-sitter-go/pull/71
       (keyed_element
        \.
        (literal_element (identifier)) @property)
       ]))

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
                     (unusedvariable . t)
                     (unusedwrite . t)
                     (useany . t)))
  (lsp-go-codelenses '((gc_details . :json-false)
                       (generate . t)
                       (regenerate_cgo . t)
                       (run_govulncheck . t)
                       (tidy . t)
                       (upgrade_dependency . t)
                       (test . t)
                       (vendor . t)))

  :config
  (lsp-register-custom-settings
   '(("gopls.hints" ((constantValues . t)))))

  :preface
  (defun siren-lsp-go-mode-setup ()
    (setq-local siren-lsp-manual-format-buffer-func
                'siren-lsp-go-manual-format-buffer)
    (lsp-format-buffer-on-save-mode t)
    (lsp-organize-imports-on-save-mode t)
    (lsp-deferred))

  (defun siren-lsp-go-manual-format-buffer ()
    (lsp-format-buffer)
    (golines-format-buffer)))

(use-package lsp-golangci-lint
  :straight (:type built-in) ;; from vendor directory
  :custom
  (lsp-golangci-lint-server-debug nil))

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

  (defvar-local siren-gotest-golden-update nil
    "If non-nil, update golden files by setting GOLDEN_UPDATE=1 env var.")

  (defun siren-gotest-run (gotest-fun)
    "Run a Go test function with an optional prefix argument.
If called with a prefix argument, set the variable
siren-gotest-golden-update to t, which will update the golden
files when running the test. Otherwise, set it to nil, which will
compare the output with the existing golden files. The argument
GOTEST-FUN should be a function that runs a Go test command."
    (interactive "P")
    ;; (message "siren-gotest-run: ")
    ;; (message gotest-fun)
    ;; (message "prefix-arg: ")
    (message "siren-gotest-run: %s, prefix: " gotest-fun current-prefix-arg)
    (let ((siren-gotest-golden-update current-prefix-arg))
      (funcall gotest-fun)))

  (defun siren-gotest--get-program-advice(orig-fun args &optional env)
    "Advice to set the program to use for go test.
When siren-gotest-golden-update is non-nil, add `GOLDEN_UPDATE=1' to env."
    (let ((env (if current-prefix-arg
                   (cons "GOLDEN_UPDATE=1" env)
                 env)))
      (apply orig-fun args env)))

  :config
  (advice-add 'go-test--get-program :around #'siren-gotest--get-program-advice)

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
  :hook
  (go-mode . siren-go-projectile-setup)

  :custom
  ;; prevent go-projectile from screwing up GOPATH
  (go-projectile-switch-gopath 'never)

  :preface
  (defun siren-go-projectile-setup ()))

(use-package go-playground
  :defer t
  :hook
  (go-playground-mode . siren-go-playground-setup)

  :general
  (:keymaps 'go-playground-mode-map
            "C-c C-c" 'go-playground-exec
            "C-c k" 'go-playground-rm)

  :custom
  (go-playground-init-command "touch .projectile && go mod init playground")
  (go-playground-basedir
   (expand-file-name "src/playground" (or (getenv "GOPATH")
                                          "~/Projects/Go")))

  :preface
  (defun siren-go-playground-setup ()
    (if (fboundp 'solaire-mode)
        (solaire-mode -1))))

(provide 'siren-golang)
;;; siren-golang.el ends here
