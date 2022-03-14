;;; siren-perspective.el --- jimeh's Emacs Siren: perspective configuration.

;;; Commentary:

;; Basic configuration for perspective.

;;; Code:

(use-package perspective
  :demand
  :general
  (:keymaps 'persp-mode-map
            "C-z z" 'persp-switch
            "C-z C-z" 'persp-switch
            "C-z c" 'persp-switch
            "C-z C-c" 'persp-switch
            "C-z s" 'persp-switch
            "C-z C-s" 'persp-switch
            "C-z b" 'persp-switch
            "C-z C-b" 'persp-switch
            "C-z l" 'persp-switch-last
            "C-z C-l" 'persp-switch-last
            "C-z c" 'persp-remove-buffer
            "C-z C-c" 'persp-remove-buffer
            "C-z k" 'persp-kill
            "C-z C-k" 'persp-kill
            "C-z r" 'persp-rename
            "C-z C-r" 'persp-rename
            "C-z a" 'persp-add-buffer
            "C-z C-a" 'persp-add-buffer
            "C-z i" 'persp-import
            "C-z C-i" 'persp-import
            "C-z n" 'persp-next
            "C-z C-n" 'persp-next
            "C-z p" 'persp-prev
            "C-z C-p" 'persp-prev)

  :custom-face
  ;; (persp-selected-face ((t (:foreground "#d97a35" :weight bold))))

  :custom
  (persp-mode-prefix-key "")
  (persp-initial-frame-name "0:main")

  :config
  (define-key persp-mode-map (kbd "C-z") perspective-map)
  (persp-mode))

(provide 'siren-perspective)
;;; siren-perspective.el ends here
