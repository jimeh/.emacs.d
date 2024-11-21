;;; siren-anzu.el --- jimeh's Emacs Siren: anzu configuration.

;;; Commentary:

;; Basic configuration for anzu.

;;; Code:

(use-package anzu
  :general
  ("C-x C-r" 'anzu-query-replace-regexp)
  ("M-%" 'anzu-query-replace)
  ([remap query-replace] 'anzu-query-replace)
  ([remap query-replace-regexp] 'anzu-query-replace-regexp)

  :custom
  (anzu-mode-lighter "")
  (anzu-deactivate-region t)
  (anzu-search-threshold 1000)
  (anzu-replace-threshold 50)
  (anzu-replace-to-string-separator " => ")

  :config
  (set-face-attribute 'anzu-mode-line nil
                      :foreground "yellow" :weight 'bold)

  (global-anzu-mode +1))

(provide 'siren-anzu)
;;; siren-anzu.el ends here
