;;; siren-custom.el --- jimeh's Emacs Siren: Siren's customizable variables.

;;; Commentary:

;; Refinements of the core editing experience in Emacs.
;;
;; Shamelessly ripped from Emacs Prelude.

;;; Code:

(defcustom siren-yank-indent-threshold 1000
  "Threshold (# chars) over which indentation does not automatically occur."
  :type 'number
  :group 'siren)

(defcustom siren-indent-sensitive-modes
  '(conf-mode coffee-mode haml-mode python-mode slim-mode yaml-mode)
  "Modes for which auto-indenting is suppressed."
  :type 'list
  :group 'siren)

(defcustom siren-yank-indent-modes '(LaTeX-mode TeX-mode)
  "Modes in which to indent regions that are yanked (or yank-popped).
Only modes that don't derive from `prog-mode' should be listed here."
  :type 'list
  :group 'siren)

(defcustom siren-transparency-level 99
  "The default frame transparency level for Emacs frames."
  :type 'number
  :group 'siren)

(provide 'siren-custom)
;;; siren-custom.el ends here
