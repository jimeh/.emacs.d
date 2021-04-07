;;; siren-golang.el --- jimeh's Emacs Siren: go-mode configuration.

;;; Commentary:

;; Basic configuration for go-mode.

;;; Code:

(require 'siren-company)
(require 'siren-dap)
(require 'siren-display-indentation)
(require 'siren-flycheck)
(require 'siren-folding)
(require 'siren-lsp)
(require 'siren-projectile)
(require 'siren-reformatter)

(use-package go-mode
  :mode "\\.go\\'"
  :interpreter "go"
  :commands go-mode
  :bind (:map go-mode-map
              ("RET" . newline-and-indent)
              ("C-h f" . godoc-at-point))

  :hook
  (go-mode . siren-go-mode-setup)

  :init
  (with-eval-after-load "projectile"
    (add-to-list 'projectile-globally-ignored-directories "Godeps")
    (add-to-list 'projectile-globally-ignored-directories "vendor/github.com")
    (add-to-list 'projectile-globally-ignored-directories "vendor/gopkg.in"))

  (defun siren-go-mode-setup ()
    (setq-local tab-width 4
                company-echo-delay 0.5
                company-minimum-prefix-length 1
                whitespace-style (delete 'indentation whitespace-style))

    (when (fboundp 'highlight-symbol-mode)
      (highlight-symbol-mode -1))
    (when (fboundp 'auto-highlight-symbol-mode)
      (auto-highlight-symbol-mode -1))

    (siren-display-indentation -1)
    (company-mode +1)
    (siren-folding)
    (subword-mode +1))

  :config
  ;; Setup golines formatter for manual use - on save formatting is handled by
  ;; lsp-mode.
  (reformatter-define golines
    :program "golines"
    :args '("-t" "4" "-m" "80" "--no-reformat-tags"
            "--base-formatter=gofumports")
    :lighter "GOLINES")

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

  :config
  (lsp-register-custom-settings
   '(("gopls.allowModfileModifications" t t)
     ("gopls.gofumpt" t t)))

  :init
  (defun siren-lsp-go-mode-setup ()
    (lsp-format-buffer-on-save-mode t)
    (lsp-organize-imports-on-save-mode t)
    (lsp-deferred)))

(use-package go-dlv
  :defer t)

(use-package gotest
  :defer t
  :after (go-mode)
  :bind (:map go-mode-map
              ("C-c , a" . go-test-current-project)
              ("C-c , v" . go-test-current-file)
              ("C-c , s" . go-test-current-test)
              ("C-c , c" . go-test-current-coverage)
              ("C-c , b" . go-test-current-benchmark)
              ("C-c , B" . go-test-current-project-benchmarks)
              ("C-c , r" . go-run))

  :custom
  (go-test-verbose t))

(use-package dap-go
  :straight dap-mode
  :after (go-mode)
  :bind (:map dap-mode-map
              ("C-c , d" . siren-dap-go-debug-current-test))

  :init
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
  :bind (:map go-mode-map
              ("C-c , g" . go-gen-test-dwim)
              ("C-c , G" . go-gen-test-exported)))

(use-package go-projectile
  :defer t
  :after (go-mode)
  :hook (go-mode . siren-go-projectile-setup)

  :custom
  ;; prevent go-projectile from screwing up GOPATH
  (go-projectile-switch-gopath 'never)

  :init
  (defun siren-go-projectile-setup ()))

(use-package go-playground
  :defer t)

(provide 'siren-golang)
;;; siren-golang.el ends here
