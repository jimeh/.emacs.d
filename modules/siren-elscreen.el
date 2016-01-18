;;
;; elscreen
;;

(siren-require-packages '(elscreen elscreen-buffer-group))

(require 'elscreen)
;; (require 'elscreen-buffer-group) ;; Breaks elscreen.

;; (setq elscreen-display-tab nil)

;; Prefix key.
(define-key elscreen-map (kbd "C-z") elscreen-map)

;; Goto screens.
(global-set-key (kbd "s-}") 'elscreen-next)
(global-set-key (kbd "s-{") 'elscreen-previous)

;; Set screen nickname
(define-key elscreen-map (kbd ",")   'elscreen-screen-nickname)
(define-key elscreen-map (kbd "C-,") 'elscreen-screen-nickname)

;; Toggle screens.
(define-key elscreen-map (kbd "l")   'elscreen-toggle)
(define-key elscreen-map (kbd "C-l") 'elscreen-toggle)

;; Display list of screens.
(define-key elscreen-map (kbd ";")   'elscreen-display-screen-name-list)
(define-key elscreen-map (kbd "C-;") 'elscreen-display-screen-name-list)


;; Start ElScreen.
(elscreen-start)


(provide 'siren-elscreen)
