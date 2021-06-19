;;; siren-diff-hl.el --- jimeh's Emacs Siren: diff-hl configuration.

;;; Commentary:

;; Basic configuration for diff-hl.

;;; Code:

(require 'siren-magit)

(use-package diff-hl
  :hook
  (prog-mode . siren-turn-on-diff-hl-mode)
  (text-mode . siren-turn-on-diff-hl-mode)
  (dired-mode . diff-hl-dired-mode)
  (magit-pre-refresh . diff-hl-magit-pre-refresh)
  (magit-post-refresh . diff-hl-magit-post-refresh)
  (desktop-after-read . siren-diff-hl-set-render-mode)

  :custom
  (diff-hl-fringe-bmp-function 'siren-diff-hl-fringe-bmp-from-type)
  (diff-hl-fringe-face-function 'siren-diff-hl-fringe-face-from-type)
  (diff-hl-margin-symbols-alist
   '((insert . "┃")
     (delete . "┃")
     (change . "┃")
     (unknown . "?")
     (ignored . "i")))

  :init
  (defun siren-turn-on-diff-hl-mode ()
    (turn-on-diff-hl-mode)
    (diff-hl-flydiff-mode 1))

  (defgroup siren-diff-hl nil
    "Siren specific tweaks to diff-hl.")

  (defface siren-diff-hl-insert
    '((default :inherit diff-hl-insert))
    "Face used to highlight inserted lines."
    :group 'siren-diff-hl)

  (defface siren-diff-hl-delete
    '((default :inherit diff-hl-delete))
    "Face used to highlight deleted lines."
    :group 'siren-diff-hl)

  (defface siren-diff-hl-change
    '((default :inherit diff-hl-change))
    "Face used to highlight changed lines."
    :group 'siren-diff-hl)

  (defun siren-diff-hl-fringe-face-from-type (type _pos)
    (intern (format "siren-diff-hl-%s" type)))

  (defun siren-diff-hl-fringe-bmp-from-type(type _pos)
    (intern (format "siren-diff-hl-%s" type)))

  (defun siren-diff-hl-set-render-mode ()
    (diff-hl-margin-mode (if (window-system) -1 1)))

  :config
  (siren-diff-hl-set-render-mode)

  (define-fringe-bitmap 'siren-diff-hl-insert
    [#b00000011] nil nil '(center repeated))
  (define-fringe-bitmap 'siren-diff-hl-change
    [#b00000011] nil nil '(center repeated))
  (define-fringe-bitmap 'siren-diff-hl-delete
    [#b00000011] nil nil '(center repeated)))

(provide 'siren-diff-hl)
;;; siren-diff-hl.el ends here
