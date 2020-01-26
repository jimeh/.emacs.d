;;; siren-display-line-numbers.el --- jimeh's Emacs Siren: display-line-numbers configuration.

;;; Commentary:

;; Basic configuration for display-line-numbers.

;;; Code:

(use-package display-line-numbers
  :ensure nil ;; loaded from emacs built-ins

  :hook
  (prog-mode . display-line-numbers-mode))

(defun siren-display-line-numbers (&optional arg)
  "Activate or deactivate line numbers.
Optional ARG is passed directly to mode toggle function."
  (display-line-numbers-mode (or arg t)))

;; Fix issue were the left fringe's is cut off by one pixel on the left side.
;; from: https://github.com/dgutov/diff-hl/issues/94#issuecomment-334168416
(use-package frame
  :ensure nil ;; loaded from emacs built-ins
  :defer t
  :config
  (progn
    (setq window-divider-default-places 'right-only) ;Default 'right-only
    ;; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=27830#20
    ;; Workaround on emacs 26+ to prevent fringe truncation. You need to use
    ;; either scroll bars or window dividers to prevent that.
    ;; I dislike the default face of `window-divider', so I customize that in my
    ;; `smyx-theme`.
    (setq window-divider-default-right-width 1) ;Default 6
    (window-divider-mode 1)))

(provide 'siren-display-line-numbers)
;;; siren-display-line-numbers.el ends here
