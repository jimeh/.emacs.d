;; Default tab-width of 2 spaces
(setq-default tab-width 2)

;; Electric behavior
(electric-layout-mode t)

;; Always indent with spaces
(setq-default indent-tabs-mode nil)

;; Answer yes/no questions by typing y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; Enable C-x C-l and C-x C-u for down/up-case conversions
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Autopair mode. I'm sorry, electric-pair mode just isn't as good, mainly
;; cause it can't wrap the region in the pair-character you type.
(when (require 'autopair nil 'noerror)
  (autopair-global-mode))

;; Popwin
(when (require 'popwin nil 'noerror)
  (setq display-buffer-function 'popwin:display-buffer))

;; When using autopair, ECB and delete-selection-mode there's a weird conflict
;; which disables delete-selection-mode whenever you click on a directory or
;; file in ECB's tree buffer. For that reason, and for it's neat rectangle
;; selection feature we're using cua-mode as it's delete-selection-ish feature
;; is not effected by the issue.
(setq cua-rectangle-mark-key (kbd "M-RET"))
(cua-mode t)

;; Disable cua-mode's fancy keys like C-z, C-v, etc. cause we use them for
;; other things, and we already have good keybindings for cut, copy, paste and
;; undo.
(setq cua-enable-cua-keys nil
      cua-remap-control-v nil
      cua-remap-control-z nil)

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

;; Auto-complete when indenting.
(defadvice indent-for-tab-command (around ac-before-indent activate)
  "Call `auto-complete' if text was recently entered"
  (if (ac-trigger-command-p last-command)
      (auto-complete)
    ad-do-it))

;; Scroll half a screen when using scroll-up and scroll-down functions.
(defadvice scroll-up (around half-window activate)
  (setq next-screen-context-lines
        (max 1 (/ (1- (window-height (selected-window))) 2)))
  ad-do-it)

(defadvice scroll-down (around half-window activate)
  (setq next-screen-context-lines
        (max 1 (/ (1- (window-height (selected-window))) 2)))
  ad-do-it)
