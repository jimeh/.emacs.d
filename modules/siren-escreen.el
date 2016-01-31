;;; siren-escreen.el --- jimeh's Emacs Siren: escreen configuration.

;;; Commentary:

;; Basic configuration for escreen.

;;; Code:

;; Loads from vendor.
(require 'escreen)

;;
;; Escreen Helper
;; - from http://blog.nguyenvq.com/2011/03/07/escreen-instead-of-elscreen-for-screen-like-features-in-emacs/
;;

(defun escreen-get-active-screen-numbers-with-emphasis ()
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

;; Initialize escreen
(escreen-install)

;; Set prefix key to C-z.
(setq escreen-prefix-char (kbd "C-z"))
(global-set-key escreen-prefix-char 'escreen-prefix)
(define-key escreen-map escreen-prefix-char 'escreen-goto-last-screen)

;; Toggle screens.
(define-key escreen-map (kbd "l") 'escreen-goto-last-screen)
(define-key escreen-map (kbd "C-l") 'escreen-goto-last-screen)

;; List screens.
(define-key escreen-map (kbd "a")
  'escreen-get-active-screen-numbers-with-emphasis)
(define-key escreen-map (kbd "C-a")
  'escreen-get-active-screen-numbers-with-emphasis)
(define-key escreen-map (kbd ";")
  'escreen-get-active-screen-numbers-with-emphasis)
(define-key escreen-map (kbd "C-;")
  'escreen-get-active-screen-numbers-with-emphasis)

;; Goto screens.
(global-set-key (kbd "s-}") 'escreen-goto-next-screen)
(global-set-key (kbd "s-{") 'escreen-goto-prev-screen)

;; Ctrl versions of default commands.
(define-key escreen-map (kbd "C-c") 'escreen-create-screen)
(define-key escreen-map (kbd "C-g") 'escreen-goto-screen)
(define-key escreen-map (kbd "C-k") 'escreen-kill-screen)
(define-key escreen-map (kbd "C-n") 'escreen-goto-next-screen)
(define-key escreen-map (kbd "C-p") 'escreen-goto-prev-screen)

;; Show list of screens when you switch/create/kill.
(add-hook 'escreen-goto-screen-hook
          'escreen-get-active-screen-numbers-with-emphasis)

(provide 'siren-escreen)
;;; siren-escreen.el ends here
