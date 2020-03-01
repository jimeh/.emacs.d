;;; siren-helm.el --- jimeh's Emacs Siren: helm configuration.

;;; Commentary:

;; Basic configuration for helm.

;;; Code:

(require 'imenu)

(use-package imenu-anywhere
  :config
  (set-default 'imenu-auto-rescan t)
  (set-default 'imenu-max-item-length 160)
  (set-default 'imenu-max-items 400))

(use-package helm
  :hook
  (helm-minibuffer-set-up . siren-helm--hide-minibuffer-maybe)
  (helm-after-initialize . siren-helm--toggle-source-header-line)
  (helm-minibuffer-set-up . siren-helm--popwin-help-mode-off)
  (helm-cleanup . siren-helm--popwin-help-mode-on)
  (helm-cleanup . siren-helm--show-neotree-maybe)
  (helm-cleanup . siren-helm--show-treemacs-maybe)

  :bind
  ("C-t" . helm-imenu)
  ("C-c t" . helm-imenu-anywhere)
  ("C-x C-f" . helm-find-files)
  ("C-c f f" . helm-for-files)
  ("C-c f r" . helm-recentf)

  :custom
  (helm-M-x-always-save-history t)
  (helm-M-x-fuzzy-match t)
  (helm-autoresize-max-height 30)
  (helm-autoresize-min-height 30)
  (helm-autoresize-mode t)
  (helm-buffer-max-length 64)
  (helm-case-fold-search 'smart)
  (helm-command-prefix-key "C-c h")
  (helm-echo-input-in-header-line t)
  (helm-ff-file-name-history-use-recentf t)
  (helm-ff-search-library-in-sexp t)
  (helm-file-name-case-fold-search 'smart)
  (helm-split-window-default-side 'below)
  (siren-helm--did-hide-neotree nil)
  (siren-helm--did-hide-treemacs nil)

  :init
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
                              (add-to-list 'popwin:special-display-config 'help-mode nil #'eq))))

  (defun siren-helm--hide-neotree (&rest plist)
    (when (and (fboundp 'neotree-hide)
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
    (when (fboundp 'treemacs-get-local-window)
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
  (require 'helm-config)

  (require 'helm-command)
  (require 'helm-files)
  (require 'helm-imenu)

  (advice-add 'helm :before 'siren-helm--hide-neotree)
  (advice-add 'helm :before 'siren-helm--hide-treemacs))

(use-package helm-descbinds
  :defer t)

(use-package helm-describe-modes
  :defer t)

(provide 'siren-helm)
;;; siren-helm.el ends here
