;;; siren-helm.el --- jimeh's Emacs Siren: helm configuration.

;;; Commentary:

;; Basic configuration for helm.

;;; Code:

;; Helm fails with tramp-methods symbol being void if tramp is not required.
(require 'tramp)

(use-package helm-global-bindings
  :straight helm
  :demand
  :general
  (:keymaps 'helm-command-map
            "M" 'helm-man-woman)

  :custom
  (helm-command-prefix-key "C-c h"))

(use-package helm-core
  :after helm-global-bindings
  :defer t)

(use-package helm
  :after (helm-global-bindings)
  :defer t
  :hook
  (helm-minibuffer-set-up . siren-helm--hide-minibuffer-maybe)
  (helm-after-initialize . siren-helm--toggle-source-header-line)
  (helm-minibuffer-set-up . siren-helm--popwin-help-mode-off)
  (helm-cleanup . siren-helm--popwin-help-mode-on)
  (helm-cleanup . siren-helm--show-neotree-maybe)
  (helm-cleanup . siren-helm--show-treemacs-maybe)

  :custom
  (helm-always-two-windows t)
  (helm-autoresize-max-height 48)
  (helm-autoresize-min-height 10)
  (helm-autoresize-mode nil)
  (helm-case-fold-search 'smart)
  (helm-display-buffer-height 64)
  (helm-display-buffer-reuse-frame nil)
  (helm-display-buffer-width 160)
  (helm-display-function 'helm-default-display-buffer)
  (helm-display-header-line t)
  (helm-echo-input-in-header-line t)
  (helm-file-name-case-fold-search 'smart)
  (helm-follow-mode-persistent t)
  (helm-full-frame t)
  (helm-show-completion-display-function 'helm-display-buffer-in-own-frame)
  (helm-source-names-using-follow '("AG" "Diagnostics" "Helm Xref"))
  (helm-split-window-default-side 'above)
  (helm-split-window-inside-p nil)
  (helm-use-undecorated-frame-option t)

  (siren-helm-auto-toggle-neotree t)
  (siren-helm-auto-toggle-treemacs t)

  :preface
  (defgroup siren-helm nil
    "Siren specific settings for helm."
    :group 'helm)

  (defcustom siren-helm-auto-toggle-neotree t
    "When t and automatically hide and show neotree when helm is activated."
    :type 'boolean
    :group 'siren-helm)

  (defcustom siren-helm-auto-toggle-treemacs t
    "When t and automatically hide and show treemacs when helm is activated."
    :type 'boolean
    :group 'siren-helm)

  (defvar siren-helm--did-hide-neotree nil)
  (defvar siren-helm--did-hide-treemacs nil)

  ;; From: https://www.reddit.com/r/emacs/comments/3asbyn/new_and_very_useful_helm_feature_enter_search/
  (defun siren-helm--hide-minibuffer-maybe ()
    (when (with-helm-buffer helm-echo-input-in-header-line)
      (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
        (overlay-put ov 'window (selected-window))
        (overlay-put ov 'face (let ((bg-color (face-background 'default nil)))
                                `(:background ,bg-color :foreground ,bg-color)))
        (setq-local cursor-type nil))))

  ;; From: https://github.com/emacs-helm/helm/issues/918#issuecomment-81555133
  (defun siren-helm--toggle-source-header-line ()
    (if (= (length (ignore-errors (with-helm-buffer helm-sources))) 1)
        (set-face-attribute 'helm-source-header nil :height 0.1)
      (set-face-attribute 'helm-source-header nil :height 1.0)))

  ;; From: https://github.com/emacs-helm/helm/wiki/Popwin
  (defun siren-helm--popwin-help-mode-off ()
    "Turn `popwin-mode' off for *Help* buffers."
    (when (boundp 'popwin:special-display-config)
      (customize-set-variable 'popwin:special-display-config
                              (delq 'help-mode popwin:special-display-config))))

  ;; From: https://github.com/emacs-helm/helm/wiki/Popwin
  (defun siren-helm--popwin-help-mode-on ()
    "Turn `popwin-mode' on for *Help* buffers."
    (when (boundp 'popwin:special-display-config)
      (customize-set-variable 'popwin:special-display-config
                              (add-to-list 'popwin:special-display-config
                                           'help-mode nil #'eq))))

  (defun siren-helm--hide-neotree (&rest plist)
    (when (and siren-helm-auto-toggle-neotree
               (not (eq helm-display-function 'helm-posframe-display))
               (fboundp 'neotree-hide)
               (fboundp 'neo-global--window-exists-p)
               (neo-global--window-exists-p))
      (setq siren-helm--did-hide-neotree t)
      (neotree-hide)))

  (defun siren-helm--show-neotree-maybe ()
    (when (and (fboundp 'neotree-show)
               siren-helm--did-hide-neotree)
      (setq siren-helm--did-hide-neotree nil)
      (run-with-timer 0.01 nil #'neotree-show)))

  (defun siren-helm--hide-treemacs (&rest plist)
    (when (and siren-helm-auto-toggle-treemacs
               (not (eq helm-display-function 'helm-posframe-display))
               (fboundp 'treemacs-get-local-window))
      (let ((win (treemacs-get-local-window)))
        (when win
          (setq siren-helm--did-hide-treemacs t)
          (delete-window win)))))

  (defun siren-helm--show-treemacs-maybe ()
    (when siren-helm--did-hide-treemacs
      (setq siren-helm--did-hide-treemacs nil)
      (run-with-timer 0.01 nil #'siren-helm--show-treemacs)))

  (defun siren-helm--show-treemacs ()
    (when (fboundp 'treemacs-select-window)
      (let ((win (selected-window)))
        (treemacs-select-window)
        (select-window win))))

  :config
  (require 'helm-mode)
  (advice-add 'helm :before 'siren-helm--hide-neotree)
  (advice-add 'helm :before 'siren-helm--hide-treemacs))

(use-package helm-elisp
  :straight helm
  :after (helm-global-bindings)
  :general
  (:keymaps 'helm-command-map
            "d" 'helm-apropos))

(use-package helm-files
  :straight helm
  :after (helm-global-bindings)
  :general
  ("C-x f" 'helm-find-files)

  :custom
  (helm-buffer-max-length 64)
  (helm-ff-file-name-history-use-recentf t)
  (helm-ff-search-library-in-sexp t))

(use-package helm-for-files
  :straight helm
  :after (helm-global-bindings)
  :general
  ("C-c f f" 'helm-for-files)
  ("C-c f r" 'helm-recentf))

(use-package helm-ring
  :straight helm
  :after (helm-global-bindings)
  :preface
  (defun siren-helm-ring-yank-pop-advice (orig-fun &rest args)
    "If last action was not a yank, run `helm-show-kill-ring' instead."
    (if (not (eq last-command 'yank))
        (helm-show-kill-ring)
      (barf-if-buffer-read-only)
      (apply orig-fun args)))

  :init
  (advice-add 'yank-pop :around #'siren-helm-ring-yank-pop-advice))

(use-package helm-descbinds
  :defer t
  :after (helm-global-bindings))

(use-package helm-describe-modes
  :defer t
  :after (helm-global-bindings))

(use-package helm-xref
  :defer t
  :after (helm-global-bindings))

(use-package helm-posframe
  :if window-system

  :custom
  (helm-posframe-border-width 3)
  (helm-posframe-height nil)
  (helm-posframe-min-height 70)
  (helm-posframe-min-width nil)
  (helm-posframe-parameters '((left-fringe . 10) (right-fringe . 10)))
  (helm-posframe-width 500)

  :preface
  ;; helm-posframe does not come with a minor mode to toggle it on/off, so let's
  ;; make one to make life easier.
  (define-minor-mode helm-posframe-mode
    "Toggle helm-posframe."
    :lighter " fmt"
    (if helm-posframe-mode (helm-posframe-enable) (helm-posframe-disable)))

  (defun siren-helm-posframe-clear-on-fullscreen (frame)
    (let ((fullscreen  (frame-parameter frame 'fullscreen)))
      (when (and helm-posframe-mode
                 (memq fullscreen '(fullscreen fullboth)))
        (posframe-hide-all))))

  :config
  (add-hook 'window-size-change-functions
            'siren-helm-posframe-clear-on-fullscreen)

  ;; (helm-posframe-mode +1)
  )

(provide 'siren-helm)
;;; siren-helm.el ends here
