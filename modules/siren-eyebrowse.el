;;; siren-eyebrowse.el --- jimeh's Emacs Siren: eyebrowse configuration.

;;; Commentary:

;; Basic configuration for eyebrowse.

;;; Code:

(use-package eyebrowse
  :config
  (setq eyebrowse-keymap-prefix ""
        eyebrowse-mode-line-style 'always
        eyebrowse-new-workspace t
        eyebrowse-wrap-around t)

  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "c") 'eyebrowse-create-window-config)
    (define-key map (kbd "C-c") 'eyebrowse-create-window-config)
    (define-key map (kbd "k") 'eyebrowse-close-window-config)
    (define-key map (kbd "C-k") 'eyebrowse-close-window-config)
    (define-key map (kbd "n") 'eyebrowse-next-window-config)
    (define-key map (kbd "C-n") 'eyebrowse-next-window-config)
    (define-key map (kbd "p") 'eyebrowse-prev-window-config)
    (define-key map (kbd "C-p") 'eyebrowse-prev-window-config)
    (define-key map (kbd "l") 'eyebrowse-last-window-config)
    (define-key map (kbd "C-l") 'eyebrowse-last-window-config)
    (define-key map (kbd ",") 'eyebrowse-rename-window-config)
    (define-key map (kbd "C-,") 'eyebrowse-rename-window-config)
    (define-key map (kbd ";") 'eyebrowse-switch-to-window-config)
    (define-key map (kbd "C-;") 'eyebrowse-switch-to-window-config)
    (define-key map (kbd "0") 'eyebrowse-switch-to-window-config-0)
    (define-key map (kbd "1") 'eyebrowse-switch-to-window-config-1)
    (define-key map (kbd "2") 'eyebrowse-switch-to-window-config-2)
    (define-key map (kbd "3") 'eyebrowse-switch-to-window-config-3)
    (define-key map (kbd "4") 'eyebrowse-switch-to-window-config-4)
    (define-key map (kbd "5") 'eyebrowse-switch-to-window-config-5)
    (define-key map (kbd "6") 'eyebrowse-switch-to-window-config-6)
    (define-key map (kbd "7") 'eyebrowse-switch-to-window-config-7)
    (define-key map (kbd "8") 'eyebrowse-switch-to-window-config-8)
    (define-key map (kbd "9") 'eyebrowse-switch-to-window-config-9)
    (define-key eyebrowse-mode-map eyebrowse-keymap-prefix map))

  (eyebrowse-mode t)

  (provide 'siren-eyebrowse))
;;; siren-eyebrowse.el ends here
