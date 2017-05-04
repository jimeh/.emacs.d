;;; siren-toggle-quotes.el --- jimeh's Emacs Siren: toggle-quotes.

;;; Commentary:

;; Various text manipulation functions and keybindings. Some of them shamelessly
;; ripped from textmate.el: https://github.com/defunkt/textmate.el

;;; Code:

(siren-require-packages '(toggle-quotes))

(require 'toggle-quotes)

(global-set-key (kbd "C-'") 'toggle-quotes)

(provide 'siren-toggle-quotes)
;;; siren-toggle-quotes.el ends here
