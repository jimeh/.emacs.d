;;
;; editor
;;

;; Set default font
(if window-system
    (set-face-attribute 'default nil :family "Monaco" :height 100))

;; don't use tabs to indent
(setq-default indent-tabs-mode nil)

;; but maintain correct appearance
(setq-default tab-width 8)

;; Newline at end of file
(setq require-final-newline t)

;; Visual Line mode - wrap lines
(visual-line-mode t)

;; Show matching parentheses
(show-paren-mode t)

;; Highlight current line globally
(global-hl-line-mode t)

;; delete the selection with a keypress
(delete-selection-mode t)

;; Electric behavior
;; (electric-layout-mode t)

;; Cursor
(if window-system
  (progn
      (blink-cursor-mode t)
      (setq initial-frame-alist
            (cons '(cursor-type . bar) (copy-alist initial-frame-alist)))
      (setq default-frame-alist
            (cons '(cursor-type . bar) (copy-alist default-frame-alist))))
      (blink-cursor-mode -1))

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; autosave the undo-tree history
(setq undo-tree-history-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq undo-tree-auto-save-history t)

;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; diminish keeps the modeline tidy
(require 'diminish)
(diminish 'visual-line-mode)

;; Enable mouse support when running in a console
(unless window-system
  (xterm-mouse-mode 1)
  (global-set-key [mouse-4] 'scroll-down-line)
  (global-set-key [mouse-5] 'scroll-up-line))

;; saveplace remembers your location in a file when saving files
(require 'saveplace)
(setq save-place-file (expand-file-name "saveplace" siren-savefile-dir))
;; activate it for all buffers
(setq-default save-place t)

;; savehist keeps track of some history
(require 'savehist)
(setq savehist-additional-variables
      ;; search entries
      '(search-ring regexp-search-ring)
      ;; save every minute
      savehist-autosave-interval 60
      ;; keep the home clean
      savehist-file (expand-file-name "savehist" siren-savefile-dir))
(savehist-mode +1)

;; Recentf
(require 'recentf)
(recentf-mode 1)
(setq recentf-save-file (expand-file-name "recentf" siren-savefile-dir)
      recentf-max-saved-items 500
      recentf-max-menu-items 100
      ;; disable recentf-cleanup on Emacs start, because it can cause
      ;; problems with remote files
      recentf-auto-cleanup 'never
      recentf-exclude '("\\.git.*" "\\.hg.*" "\\.svn.*"))

(defun siren-recentf-exclude-p (file)
  "A predicate to decide whether to exclude FILE from recentf."
  (let ((file-dir (file-truename (file-name-directory file))))
    (-any-p (lambda (dir)
              (string-prefix-p dir file-dir))
            (mapcar 'file-truename (list siren-savefile-dir package-user-dir)))))

(add-to-list 'recentf-exclude 'siren-recentf-exclude-p)

(recentf-mode +1)

;; meaningful names for buffers with the same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets
      uniquify-separator "/"
      uniquify-after-kill-buffer-p t     ; rename after killing uniquified
      uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; Display whitespace characters globally
(global-whitespace-mode t)
(diminish 'whitespace-mode)
(diminish 'global-whitespace-mode)
(setq whitespace-line-column 80)

;; Customize Whitespace Characters
;;  - Newline: \u00AC = ¬
;;  - Tab:     \u2192 = →
;;             \u00BB = »
;;             \u25B6 = ▶
(setq whitespace-display-mappings
      (quote ((newline-mark ?\n [?\u00AC ?\n] [?$ ?\n])
              (tab-mark     ?\t [?\u2192 ?\t] [?\u00BB ?\t] [?\\ ?\t]))))

(setq whitespace-style
      (quote (face tabs trailing space-before-tab newline
                   indentation space-after-tab tab-mark newline-mark
                   empty)))

;; flyspell setup
(require 'flyspell)
(diminish 'flyspell-mode)
(setq ispell-program-name "aspell" ; use aspell instead of ispell
      ispell-extra-args '("--sug-mode=ultra"))


;; enabled change region case commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; smarter kill-ring navigation
(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)
(global-set-key (kbd "s-y") 'browse-kill-ring)

;; automatically indenting yanked text if in programming-modes
(defun yank-advised-indent-function (beg end)
  "Do indentation, as long as the region isn't too large."
  (if (<= (- end beg) siren-yank-indent-threshold)
      (indent-region beg end nil)))

(defmacro advise-commands (advice-name commands class &rest body)
  "Apply advice named ADVICE-NAME to multiple COMMANDS.

The body of the advice is in BODY."
  `(progn
     ,@(mapcar (lambda (command)
                 `(defadvice ,command (,class ,(intern (concat (symbol-name command) "-" advice-name)) activate)
                    ,@body))
               commands)))

(advise-commands "indent" (yank yank-pop) after
  "If current mode is one of `siren-yank-indent-modes',
indent yanked text (with prefix arg don't indent)."
  (if (and (not (ad-get-arg 0))
           (not (member major-mode siren-indent-sensitive-modes))
           (or (derived-mode-p 'prog-mode)
               (member major-mode siren-yank-indent-modes)))
      (let ((transient-mark-mode nil))
        (yank-advised-indent-function (region-beginning) (region-end)))))

;; make a shell script executable automatically on save
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; .zsh file is shell script too
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . shell-script-mode))

;; saner regex syntax
(require 're-builder)
(setq reb-re-syntax 'string)

;; sensible undo
(global-undo-tree-mode)
(diminish 'undo-tree-mode)

;; diff-hl
(global-diff-hl-mode +1)
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)

;; easy-kill
(global-set-key [remap kill-ring-save] 'easy-kill)
(global-set-key [remap mark-sexp] 'easy-mark)

;; diminish various modes
;; (diminish 'hs-minor-mode)
;; (diminish 'subword-mode)



(provide 'siren-editor)
