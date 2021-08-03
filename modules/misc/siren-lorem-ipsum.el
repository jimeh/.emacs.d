;;; siren-lorem-ipsum.el --- jimeh's Emacs Siren: lorem-ipsum configuration.

;;; Commentary:

;; Basic configuration for lorem-ipsum.

;;; Code:

(use-package lorem-ipsum
  :bind
  ("C-c l s" . lorem-ipsum-insert-sentences)
  ("C-c l p" . lorem-ipsum-insert-paragraphs)
  ("C-c l l" . lorem-ipsum-insert-list))

(provide 'siren-lorem-ipsum)
;;; siren-lorem-ipsum.el ends here
