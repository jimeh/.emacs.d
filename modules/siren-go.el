;;; siren-go.el --- jimeh's Emacs Siren: go-mode configuration.

;;; Commentary:

;; Basic configuration for go-mode.

;;; Code:

(require 'siren-programming)
(require 'siren-flycheck)

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
              ("C-h f" . godoc-at-point)
              :map help-command
              ("G" . godoc))

  :hook
  (go-mode . siren-go-mode-setup)

  :init
  (defun siren-go-mode-setup ()
    (siren-prog-mode-setup)

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

  :config
  (message "loading go-mode")

  (when (memq window-system '(mac ns))
    (exec-path-from-shell-copy-env "GOPATH"))

  ;; Ignore go test -c output files
  (add-to-list 'completion-ignored-extensions ".test"))

(use-package company-go :defer t)
(use-package go-eldoc :defer t)
(use-package go-guru :defer t)
(use-package go-rename :defer t)
(use-package gotest :defer t)

(use-package go-projectile
  :defer t
  :init
  ;; prevent go-projectile from screwing up GOPATH
  (setq go-projectile-switch-gopath 'never))

(use-package flycheck-gometalinter
  :requires flycheck
  :hook (flycheck-mode . flycheck-gometalinter-setup)

  :init
  (setq flycheck-gometalinter-fast t
        flycheck-gometalinter-tests t
        flycheck-gometalinter-vendor t))

(provide 'siren-go)
;;; siren-go.el ends here
