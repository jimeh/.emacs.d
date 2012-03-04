;; Default tab-width of 2 spaces
(setq-default tab-width 2)

;; Electric behavior
(electric-pair-mode t)
(electric-layout-mode t)

;; Always indent with spaces
(setq-default indent-tabs-mode nil)

;; Answer yes/no questions by typing y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; Enable C-x C-l and C-x C-u for down/up-case conversions
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Globally enable delete-selection-mode
(delete-selection-mode 1)

;; Use textmate-mode
(when (require 'textmate nil 'noerror)
  (textmate-mode))

;; Highlight matching parenthesis
(show-paren-mode 1)

;; Make sure all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.saves")))

;; Make re-builder easier to use
(require 're-builder)
(setq reb-re-syntax 'string)

;; smoother scrolling (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 10)) ;; two lines at a time
      mouse-wheel-progressive-speed nil ;; don't accelerate scrolling
      mouse-wheel-follow-mouse 't ;; scroll window under mouse
      scroll-step 1 ;; keyboard scroll one line at a time
      scroll-margin 0)

;; Enable mouse support when running in a console
(unless window-system
  (xterm-mouse-mode 1)
  (global-set-key [mouse-4] 'scroll-down-line)
  (global-set-key [mouse-5] 'scroll-up-line))
