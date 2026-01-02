;;; siren-openai-chatgpt.el --- jimeh's Emacs Siren: openai-chatgpt configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for openai-chatgpt.

;;; Code:

(require 'siren-chatgpt)

(use-package openai
  :ensure (:host github :repo "emacs-openai/openai")
  :defer t

  :config
  (siren-chatgpt-register-api-key-var 'openai-key))

(use-package chatgpt
  :ensure (:host github :repo "emacs-openai/chatgpt")
  :defer t
  :after openai
  :custom
  (chatgpt-max-tokens 2000)
  (chatgpt-temperature 1.0)

  :config
  (siren-chatgpt-register-model-var 'chatgpt-model))

(use-package codegpt
  :ensure (:host github :repo "emacs-openai/codegpt")
  :defer t
  :after openai)

(provide 'siren-openai-chatgpt)
;;; siren-openai-chatgpt.el ends here
