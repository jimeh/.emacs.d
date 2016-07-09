;;; siren-go.el --- jimeh's Emacs Siren: go-mode configuration.

;;; Commentary:

;; Basic configuration for go-mode.

;;; Code:

(require 'siren-programming)
(siren-require-packages
 '(go-mode company-go go-eldoc go-projectile gotest flycheck-gometalinter))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-copy-env "GOPATH"))

;; Ignore go test -c output files
(add-to-list 'completion-ignored-extensions ".test")

(require 'flycheck-gometalinter)
(setq flycheck-gometalinter-fast t)
(setq flycheck-gometalinter-tests t)
(setq flycheck-gometalinter-vendor t)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-gometalinter-setup))

(define-key 'help-command (kbd "G") 'godoc)

(eval-after-load 'go-mode
  '(progn
     (require 'go-projectile)
     (require 'company-go)

     (defun siren-go-mode-defaults ()
       (siren-prog-mode-defaults)

       ;; Add to default go-mode key bindings
       (let ((map go-mode-map))
         (define-key map (kbd "RET") 'newline-and-indent)
         (define-key map (kbd "C-c a") 'go-test-current-project)
         (define-key map (kbd "C-c m") 'go-test-current-file)
         (define-key map (kbd "C-c .") 'go-test-current-test)
         (define-key map (kbd "C-c b") 'go-run)
         (define-key map (kbd "C-h f") 'godoc-at-point))

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
                               (run-hooks 'siren-go-mode-hook)))))

(provide 'siren-go)
;;; siren-go.el ends here
