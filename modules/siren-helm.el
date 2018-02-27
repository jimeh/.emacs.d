;;; siren-helm.el --- jimeh's Emacs Siren: helm configuration.

;;; Commentary:

;; Basic configuration for helm.

;;; Code:

(use-package helm
  :defer t
  :config
  (setq helm-autoresize-mode t
        helm-autoresize-max-height 30
        helm-autoresize-min-height 30
        helm-buffer-max-length 64
        helm-case-fold-search 'smart
        helm-echo-input-in-header-line t
        helm-file-name-case-fold-search 'smart
        helm-split-window-default-side 'below)

  ;; From: https://www.reddit.com/r/emacs/comments/3asbyn/new_and_very_useful_helm_feature_enter_search/
  (defun siren-helm--hide-minibuffer-maybe ()
    (when (with-helm-buffer helm-echo-input-in-header-line)
      (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
        (overlay-put ov 'window (selected-window))
        (overlay-put ov 'face (let ((bg-color (face-background 'default nil)))
                                `(:background ,bg-color :foreground ,bg-color)))
        (setq-local cursor-type nil))))

  (add-hook 'helm-minibuffer-set-up-hook #'siren-helm--hide-minibuffer-maybe)

  ;; From: https://github.com/emacs-helm/helm/issues/918#issuecomment-81555133
  (defun siren-helm--toggle-header-line ()
    (if (= (length helm-sources) 1)
        (set-face-attribute 'helm-source-header nil :height 0.1)
      (set-face-attribute 'helm-source-header nil :height 1.0)))

  (add-hook 'helm-before-initialize-hook #'siren-helm--toggle-header-line)

  ;; From: https://github.com/emacs-helm/helm/wiki/Popwin
  (defun siren-helm--popwin-help-mode-off ()
    "Turn `popwin-mode' off for *Help* buffers."
    (when (boundp 'popwin:special-display-config)
      (customize-set-variable 'popwin:special-display-config
                              (delq 'help-mode popwin:special-display-config))))

  (add-hook 'helm-minibuffer-set-up-hook #'siren-helm--popwin-help-mode-off)

  ;; From: https://github.com/emacs-helm/helm/wiki/Popwin
  (defun siren-helm--popwin-help-mode-on ()
    "Turn `popwin-mode' on for *Help* buffers."
    (when (boundp 'popwin:special-display-config)
      (customize-set-variable 'popwin:special-display-config
                              (add-to-list 'popwin:special-display-config 'help-mode nil #'eq))))

  (add-hook 'helm-cleanup-hook #'siren-helm--popwin-help-mode-on)

(use-package helm-descbinds
  :defer t)

(use-package helm-describe-modes
  :defer t)

(provide 'siren-helm)
;;; siren-helm.el ends here
