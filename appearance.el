;; Disable splash page
(setq inhibit-startup-message t)

;; Set default font
(set-frame-font "Monaco-11")

;; Disable toolbar
(tool-bar-mode -1)

;; Show matching paranthensis
(show-paren-mode t)

;; Show column number globally
(column-number-mode t)

;; Highlight current line globally
(global-hl-line-mode t)

;; Display line numbers globally
(global-linum-mode t)

;; Display whitespace characters globally
(global-whitespace-mode t)

;; Customize Whitespace Characters
(setq whitespace-display-mappings
      (quote ((newline-mark ?\n    [?¬ ?\n] [?$ ?\n])
              (tab-mark     ?\t    [?▸ ?\t] [?\u00BB ?\t] [?\\ ?\t]))))
(setq whitespace-style
      (quote (face tabs trailing space-before-tab newline
                   indentation space-after-tab tab-mark newline-mark
                   empty)))

;; Cursor
(blink-cursor-mode t)
(setq initial-frame-alist
      (cons '(cursor-type . bar) (copy-alist initial-frame-alist)))
(setq default-frame-alist
      (cons '(cursor-type . bar) (copy-alist default-frame-alist)))

;; Transparency (via helpers.el)
(setq transparency-level 97)
(transparency-set-value transparency-level)
(add-hook 'after-make-frame-functions
          (lambda (selected-frame)
            (set-frame-parameter selected-frame 'alpha transparency-level)))
