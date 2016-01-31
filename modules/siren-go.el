;;; siren-go.el --- jimeh's Emacs Siren: go-mode configuration.

;;; Commentary:

;; Basic configuration for go-mode.

;;; Code:

(require 'siren-programming)

(setenv "GOPATH" (expand-file-name "~/.go"))

;; Ignore go test -c output files
(add-to-list 'completion-ignored-extensions ".test")

(define-key 'help-command (kbd "G") 'godoc)

(eval-after-load 'go-mode
  '(progn
     (siren-require-packages
      '(go-mode company-go go-eldoc go-projectile gotest))

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
