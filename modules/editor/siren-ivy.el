;;; siren-ivy.el --- jimeh's Emacs Siren: ivy configuration.

;;; Commentary:

;; Basic configuration for ivy.

;;; Code:

(require 'siren-prescient)

(use-package ivy
  :defer t
  :general
  ("C-c C-r" 'ivy-resume)

  :custom
  (ivy-use-virtual-buffers nil)
  (ivy-count-format "%d ")
  (ivy-re-builders-alist '((amx-completing-read-ivy . ivy--regex-fuzzy)
                           (t . ivy--regex-plus))))

(use-package ivy-prescient
  :after (ivy)

  :config
  (ivy-prescient-mode +1))

(provide 'siren-ivy)
;;; siren-ivy.el ends here
