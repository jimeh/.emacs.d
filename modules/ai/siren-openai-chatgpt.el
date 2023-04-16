;;; siren-openai-chatgpt.el --- jimeh's Emacs Siren: openai-chatgpt configuration.

;;; Commentary:

;; Basic configuration for openai-chatgpt.

;;; Code:

(require 'siren-chatgpt)

(use-package openai
  :straight (:host github :repo "emacs-openai/openai")

  :config
  (setq openai-key (siren-openai-api-key)))

(use-package chatgpt
  :straight (:host github :repo "emacs-openai/chatgpt")
  :after openai

  :custom
  (chatgpt-max-tokens 2000)
  (chatgpt-temperature 1.0)

  :config
  (siren-chatgpt-register-model-var 'chatgpt-model))

(use-package codegpt
  :straight (:host github :repo "emacs-openai/codegpt")
  :after openai)

(provide 'siren-openai-chatgpt)
;;; siren-openai-chatgpt.el ends here
