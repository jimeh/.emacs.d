;; Disable splash page
(setq inhibit-startup-message t)

;; Set default font
(if gui-window-system
    ;;; Large
    ;; (set-face-attribute 'default nil :family "Monaco" :height 110)
    ;; (set-face-attribute 'default nil :family "Menlo" :height 110)

    ;;; Small
    (set-face-attribute 'default nil :family "Monaco" :height 100)
    ;; (set-face-attribute 'default nil :family "Menlo" :height 100)
    ;; (set-face-attribute 'default nil :family "Inconsolata" :height 120)
)

;; Load Theme
(if gui-window-system (require 'twilight-anti-bright-theme)
  (require 'tomorrow-night-paradise-theme))

;; Disable menu-bar
(menu-bar-mode 0)

;; Disable toolbar
(tool-bar-mode -1)

;; Disable Scrollbar
(set-scroll-bar-mode 'nil)

;; Show matching parentheses
(show-paren-mode t)

;; Show column number globally
(column-number-mode t)

;; Highlight current line globally
(global-hl-line-mode t)

;; Don't use OSX Native fullscreen mode
(setq ns-use-native-fullscreen nil)

;; Customize line numbers
(setq linum+-dynamic-format " %%%dd ")

;; Linum+ resets linum-format to "smart" when it's loaded, hence we have to
;; use a eval-after-load hook to set it to "dynamic".
(eval-after-load "linum+" '(progn (setq linum-format 'dynamic)))

;; Display up to 20 results in when using grizzl completion.
(when (require 'grizzl nil 'noerror)
  (setq *grizzl-read-max-results* 20))

;; Display ido results vertically, rather than horizontally.
(when (require 'ido nil 'noerror)
  (setq ido-decorations
        (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]"
                " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))

  (defun ido-disable-line-truncation ()
    (set (make-local-variable 'truncate-lines) nil))

  (defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
    (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
    (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))

  (add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
  (add-hook 'ido-setup-hook 'ido-define-keys))

;; meaningful names for buffers with the same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; Display whitespace characters globally
(global-whitespace-mode t)

;; Customize Whitespace Characters
;;  - Newline: \u00AC = ¬
;;  - Tab:     \u25B6 = ▶
;;             \u25B8 = ▸
(setq whitespace-display-mappings
      (quote ((newline-mark ?\n [?\u00AC ?\n] [?$ ?\n])
              (tab-mark     ?\t [?\u25B6 ?\t] [?\u00BB ?\t] [?\\ ?\t]))))

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
(setq transparency-level 99)
(transparency-set-value transparency-level)
(add-hook 'after-make-frame-functions
          (lambda (selected-frame)
            (set-frame-parameter selected-frame 'alpha transparency-level)))

;; Relative line numbers -- from: http://stackoverflow.com/a/6928112/42146
;; (defvar my-linum-format-string "%3d ")
;; ;; (add-hook 'linum-before-numbering-hook 'my-linum-get-format-string)
;; (defun my-linum-get-format-string ()
;;   (let* ((width (1+ (length (number-to-string
;;                              (count-lines (point-min) (point-max))))))
;;          (format (concat "%" (number-to-string width) "d")))
;;     (setq my-linum-format-string format)))
;; (defvar my-linum-current-line-number 0)
;; (setq linum-format 'my-linum-relative-line-numbers)
;; (defun my-linum-relative-line-numbers (line-number)
;;   (let ((offset (abs(- line-number my-linum-current-line-number))))
;;     (propertize (format my-linum-format-string offset) 'face 'linum)))
;; (defadvice linum-update (around my-linum-update)
;;   (let ((my-linum-current-line-number (line-number-at-pos)))
;;     ad-do-it))
;; (ad-activate 'linum-update)
