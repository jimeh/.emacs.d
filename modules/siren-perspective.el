;;
;; perspective
;;

(siren-require-packages '(perspective))

(require 'perspective)

(define-key persp-mode-map (kbd "C-z") perspective-map)

(define-key persp-mode-map (kbd "C-z s") 'persp-switch)
(define-key persp-mode-map (kbd "C-z C-s") 'persp-switch)
(define-key persp-mode-map (kbd "C-z b") 'persp-switch)
(define-key persp-mode-map (kbd "C-z C-b") 'persp-switch)

(define-key persp-mode-map (kbd "C-z c") 'persp-remove-buffer)
(define-key persp-mode-map (kbd "C-z C-c") 'persp-remove-buffer)

(define-key persp-mode-map (kbd "C-z k") 'persp-kill)
(define-key persp-mode-map (kbd "C-z C-k") 'persp-kill)

(define-key persp-mode-map (kbd "C-z r") 'persp-rename)
(define-key persp-mode-map (kbd "C-z C-r") 'persp-rename)

(define-key persp-mode-map (kbd "C-z a") 'persp-add-buffer)
(define-key persp-mode-map (kbd "C-z C-a") 'persp-add-buffer)

(define-key persp-mode-map (kbd "C-z i") 'persp-import)
(define-key persp-mode-map (kbd "C-z C-i") 'persp-import)

(define-key persp-mode-map (kbd "C-z n") 'persp-next)
(define-key persp-mode-map (kbd "C-z C-n") 'persp-next)
(define-key persp-mode-map (kbd "C-z p") 'persp-prev)
(define-key persp-mode-map (kbd "C-z C-p") 'persp-prev)


(provide 'siren-perspective)