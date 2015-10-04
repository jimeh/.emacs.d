;;
;; linum
;;

;; Customize line numbers - In gui mode the fringe is the spacer between line
;; numbers and code, while in console mode we add an extra space for it.
(if window-system (setq linum+-dynamic-format " %%%dd")
  (setq linum+-dynamic-format " %%%dd "))

(eval-after-load "linum+" '(progn (setq linum-format 'dynamic)))

(require 'linum+)

(provide 'siren-linum)
