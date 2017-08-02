;;; siren-go.el --- jimeh's Emacs Siren: go-mode configuration.

;;; Commentary:

;; Basic configuration for go-mode.

;;; Code:

(use-package go-mode
  :mode "\\.go\\'"
  :interpreter "go"
  :commands go-mode
  :bind (:map go-mode-map
              ("RET" . newline-and-indent)
              ("C-c a" . go-test-current-project)
              ("C-c m" . go-test-current-file)
              ("C-c ." . go-test-current-test)
              ("C-c b" . go-run)
              ("C-c d" . godef-jump)
              ("C-c C-j" . avy-goto-word-or-subword-1)
              ("C-h f" . godoc-at-point))

  :config
  (message "loading go-mode")
  (use-package company-go)
  (use-package go-eldoc)
  (use-package go-guru)
  (use-package go-rename)
  (use-package gotest)

  (use-package go-projectile
    :init
    ;; prevent go-projectile from screwing up GOPATH
    (setq go-projectile-switch-gopath 'never))

  (use-package flycheck-gometalinter
    :init
    (setq flycheck-gometalinter-fast t
          flycheck-gometalinter-tests t
          flycheck-gometalinter-vendor t)
    :config
    (eval-after-load 'flycheck
      '(add-hook 'flycheck-mode-hook #'flycheck-gometalinter-setup)))

  (when (memq window-system '(mac ns))
    (exec-path-from-shell-copy-env "GOPATH"))

  ;; Ignore go test -c output files
  (add-to-list 'completion-ignored-extensions ".test")

  (define-key 'help-command (kbd "G") 'godoc)

  (require 'siren-programming)
  (defun siren-go-mode-defaults ()
    (siren-prog-mode-defaults)

    ;; Prefer goimports to gofmt if installed
    (let ((goimports (executable-find "goimports")))
      (when goimports
        (setq gofmt-command goimports)))

    ;; gofmt on save
    (add-hook 'before-save-hook 'gofmt-before-save nil t)

    ;; prevent go-projectile from screwing up GOPATH
    (setq go-projectile-switch-gopath 'never)

    ;; enable company-mode
    (set (make-local-variable 'company-backends) '(company-go))
    (company-mode +1)

    ;; enable hide/show
    (hs-minor-mode 1)

    ;; go-guru
    (go-guru-hl-identifier-mode 1)
    (setq go-guru-hl-identifier-idle-time 0.1)

    ;; stop whitespace being highlighted
    (whitespace-toggle-options '(tabs))

    ;; make tabs 4 spaces wide
    (setq tab-width 4)

    ;; El-doc for Go
    ;; (go-eldoc-setup)

    ;; CamelCase aware editing operations
    (subword-mode +1))

  (setq siren-go-mode-hook 'siren-go-mode-defaults)
  (add-hook 'go-mode-hook (lambda ()
                            (run-hooks 'siren-go-mode-hook))))

(provide 'siren-go)
;;; siren-go.el ends here
