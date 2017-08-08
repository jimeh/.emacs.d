;;; siren-phi-search.el --- jimeh's Emacs Siren: phi-search configuration.

;;; Commentary:

;; Basic configuration for phi-search.

;;; Code:

(use-package phi-search
  :bind
  ("C-s" . phi-search)
  ("C-r" . phi-search-backward)

  :config
  (custom-set-faces
   '(phi-search-match-face
     ((t (:background "paleturquoise4"))))
   '(phi-search-selection-face
     ((t (:background "palevioletred2" :foreground "brown4"))))))

(provide 'siren-phi-search)
;;; siren-phi-search.el ends here
