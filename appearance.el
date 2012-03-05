;; Disable splash page
(setq inhibit-startup-message t)

;; Set default font
(set-face-attribute 'default nil :family "Monaco" :height 110)

;; Load Theme
(if window-system (require 'birds-of-paradise-plus-theme)
  (require 'tomorrow-night-paradise-theme))

;; Disable menu-bar
(menu-bar-mode 0)

;; Disable toolbar
(tool-bar-mode -1)

;; Scrollbar
(set-scroll-bar-mode 'nil)

;; Show matching paranthensis
(show-paren-mode t)

;; Show column number globally
(column-number-mode t)

;; Highlight current line globally
(global-hl-line-mode t)

;; Customize line numbers when running in a console
(unless window-system
  (setq linum+-smart-format "%%%dd ")
  (setq linum+-dynamic-format "%%%dd "))

;; meaningful names for buffers with the same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; Display whitespace characters globally
(global-whitespace-mode t)

;; Customize Whitespace Characters
;;  - Newline: \u00AC = ¬
;;  - Tab:     \u25B8 = ▸
(setq whitespace-display-mappings
      (quote ((newline-mark ?\n    [?\u00AC ?\n] [?$ ?\n])
              (tab-mark     ?\t    [?\u25B8 ?\t] [?\u00BB ?\t] [?\\ ?\t]))))

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
