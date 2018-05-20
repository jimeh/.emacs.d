;;; siren-git-timemachine.el --- jimeh's Emacs Siren: git-timemachine configuration.

;;; Commentary:

;; Basic configuration for git-timemachine.

;;; Code:

(use-package git-timemachine
  :defer t
  :init
  (defalias 'gt 'git-timemachine))

(provide 'siren-git-timemachine)
;;; siren-git-timemachine.el ends here
