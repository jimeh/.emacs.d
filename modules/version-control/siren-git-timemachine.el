;;; siren-git-timemachine.el --- jimeh's Emacs Siren: git-timemachine configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for git-timemachine.

;;; Code:

(use-package git-timemachine
  :defer t
  :preface
  (defalias 'gt 'git-timemachine))

(provide 'siren-git-timemachine)
;;; siren-git-timemachine.el ends here
