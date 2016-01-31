;;; siren-core.el --- jimeh's Emacs Siren: Core Siren functions.

;;; Commentary:

;; Core Siren functions used a bit all over the place. Some of them shamelessly
;; ripped from Emacs Prelude.

;;; Code:

(defun siren-smart-open-line-above ()
  "Insert an empty line above the current line.
Position the cursor at it's beginning, according to the current mode."
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))

(defun siren-wrap-with (s)
  "Create a wrapper function for smartparens using S."
  `(lambda (&optional arg)
     (interactive "P")
     (sp-wrap-with-pair ,s)))


(provide 'siren-core)
;;; siren-core.el ends here
