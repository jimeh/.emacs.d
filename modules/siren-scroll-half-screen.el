;;
;; scroll-half-screen
;;

;; Scroll half a screen when using scroll-up and scroll-down functions.
(defadvice scroll-up (around half-window activate)
  (setq next-screen-context-lines
        (max 1 (/ (1- (window-height (selected-window))) 2)))
  ad-do-it)

(defadvice scroll-down (around half-window activate)
  (setq next-screen-context-lines
        (max 1 (/ (1- (window-height (selected-window))) 2)))
  ad-do-it)


(provide 'siren-scroll-half-screen)