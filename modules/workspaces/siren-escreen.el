;;; siren-escreen.el --- jimeh's Emacs Siren: escreen configuration.

;;; Commentary:

;; Basic configuration for escreen.

;;; Code:

(use-package escreen
  :straight (:type git :host github :repo "renard/escreen-el")
  :demand

  :general
  ("s-}" 'escreen-goto-next-screen)
  ("s-{" 'escreen-goto-prev-screen)
  (:keymaps 'escreen-map
            "C-z" 'escreen-goto-last-screen
            "l" 'escreen-goto-last-screen
            "C-l" 'escreen-goto-last-screen
            ";" 'siren-escreen-get-active-screen
            "C-;" 'siren-escreen-get-active-screen
            "C-c" 'escreen-create-screen
            "C-g" 'escreen-goto-screen
            "C-k" 'escreen-kill-screen
            "C-n" 'escreen-goto-next-screen
            "C-p" 'escreen-goto-prev-screen)

  :hook
  (escreen-goto-screen . siren-escreen-get-active-screen)

  :init
  (defun siren-escreen-get-active-screen ()
    "what the name says"
    (interactive)
    (let ((escreens (escreen-get-active-screen-numbers))
          (emphased ""))
      (dolist (s escreens)
        (setq emphased
              (concat emphased (if (= escreen-current-screen-number s)
                                   (propertize (number-to-string s)
                                               ;;'face 'custom-variable-tag) " ")
                                               ;;'face 'info-title-3)
                                               'face 'font-lock-warning-face)
                                 ;;'face 'secondary-selection)
                                 (number-to-string s))
                      " ")))
      (message "escreen: active screens: %s" emphased)))

  :config
  (escreen-install)
  (setq escreen-prefix-char (kbd "C-z"))
  (global-set-key escreen-prefix-char 'escreen-prefix))

(provide 'siren-escreen)
;;; siren-escreen.el ends here
