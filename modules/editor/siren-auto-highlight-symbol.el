;;; siren-auto-highlight-symbol.el --- jimeh's Emacs Siren: auto-highlight-symbol configuration.

;;; Commentary:

;; Basic configuration for auto-highlight-symbol.

;;; Code:

(require 'siren-doom-themes)

(use-package auto-highlight-symbol
  :diminish auto-highlight-symbol-mode

  :general
  (:keymaps 'auto-highlight-symbol-mode-map
            "C-c C-p" 'ahs-backward
            "C-c C-n" 'ahs-forward
            "C-c C-r" 'ahs-edit-mode)

  :hook
  (prog-mode . auto-highlight-symbol-mode)

  :custom
  (ahs-default-range 'ahs-range-whole-buffer)
  (ahs-idle-interval 1.0)
  (auto-highlight-symbol-mode-map (make-sparse-keymap))
  ;; TODO: Fix exclusions, they don't seem to work.
  (ahs-exclude '((ruby-mode . "\_<\(end\|def\|class\|module\)\_>"))))

(provide 'siren-auto-highlight-symbol)
;;; siren-auto-highlight-symbol.el ends here
