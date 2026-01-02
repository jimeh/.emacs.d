;;; siren-hideshow.el --- jimeh's Emacs Siren: folding configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for hideshow code.

;;; Code:

(use-package hideshow
  :ensure nil
  :general
  (:keymaps 'hs-minor-mode-map
            "C-=" 'siren-hideshow-toggle
            "C-c C-h" 'siren-hideshow-toggle)

  :preface
  (defun siren-hideshow-toggle (column)
    "Toggle hiding/showing blocks via hs-mode.

Borrowed from: http://www.emacswiki.org/emacs/HideShow"
    (interactive "P")
    (condition-case nil
        (hs-toggle-hiding)
      (error (hs-show-all)))))

(provide 'siren-hideshow)
;;; siren-hideshow.el ends here
