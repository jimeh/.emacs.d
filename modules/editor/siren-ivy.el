;;; siren-ivy.el --- jimeh's Emacs Siren: ivy configuration.

;;; Commentary:

;; Basic configuration for ivy.

;;; Code:

(use-package ivy
  :defer t

  :custom
  (ivy-use-virtual-buffers nil)
  (ivy-count-format "%d ")
  (ivy-re-builders-alist '((amx-completing-read-ivy . ivy--regex-fuzzy)
                           (t . ivy--regex-plus))))

(provide 'siren-ivy)
;;; siren-ivy.el ends here
