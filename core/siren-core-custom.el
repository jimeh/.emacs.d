;;; siren-core-custom.el --- jimeh's Emacs Siren: Siren's customizable variables.

;;; Commentary:

;; Refinements of the core editing experience in Emacs.
;;
;; Shamelessly ripped from Emacs Prelude.

;;; Code:

(defgroup siren nil
  "Basic settings for Siren."
  :group 'tools)

(defcustom siren-transparency-level 99
  "The default frame transparency level for Emacs frames."
  :type 'number
  :group 'siren)

(provide 'siren-core-custom)
;;; siren-core-custom.el ends here
