;;; siren-uniquify.el --- jimeh's Emacs Siren: uniquify configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for uniquify.

;;; Code:

(use-package uniquify
  :ensure nil
  :demand t

  :custom
  (uniquify-buffer-name-style 'post-forward-angle-brackets)
  (uniquify-separator "/")
  ;; rename after killing uniquified
  (uniquify-after-kill-buffer-p t)
  ;; don't muck with special buffers
  (uniquify-ignore-buffers-re "^\\*"))

(provide 'siren-uniquify)
;;; siren-uniquify.el ends here
