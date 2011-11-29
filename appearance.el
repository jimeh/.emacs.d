;; Disable splash page
(setq inhibit-startup-message t)

;; Set default font
(set-frame-font "Monaco-11")

;; Load Theme
(if window-system
    (require 'birds-of-paradise-plus-theme)
    (color-theme-tomorrow-night-bright))

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

;; Customize line numbers when Emacs runs in console
(if window-system ()
  (setq linum+-smart-format "%%%dd " linum+-dynamic-format "%%%dd "))

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 10)) ;; two lines at a time
      mouse-wheel-progressive-speed nil ;; don't accelerate scrolling
      mouse-wheel-follow-mouse 't ;; scroll window under mouse
      scroll-step 1 ;; keyboard scroll one line at a time
      scroll-margin 0)

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
