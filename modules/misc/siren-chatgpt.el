;;; siren-chatgpt.el --- jimeh's Emacs Siren: chatgpt configuration.

;;; Commentary:

;; Basic configuration for chatgpt.

;;; Code:

(use-package chatgpt
  :straight (:host github :repo "joshcho/ChatGPT.el"
                   :files ("dist" "*.el" "*.py"))
  :bind
  ("C-c C-q" . chatgpt-query)

  :custom
  (chatgpt-query-format-string-map
   '(("doc" . "Please write the documentation for the following code:\n\n%s")
     ("bug" . "There is a bug in the following code, please help me fix it:\n\n%s")
     ("understand" . "What is the following?\n\n%s")
     ("explain" . "Explain the following in detail:\n\n%s")
     ("improve" . "Please improve the following:\n\n%s")))

  :init
  (require 'python)
  (setq chatgpt-repo-path
        (expand-file-name "straight/repos/ChatGPT.el/" straight-base-dir)))

(provide 'siren-chatgpt)
;;; siren-chatgpt.el ends here
