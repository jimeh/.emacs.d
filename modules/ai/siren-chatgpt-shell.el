;;; siren-chatgpt-shell.el --- jimeh's Emacs Siren: chatgpt-shell configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for chatgpt-shell.

;;; Code:

(require 'siren-chatgpt)

(use-package shell-maker
  :defer t)

(use-package chatgpt-shell
  :defer t

  :custom
  (chatgpt-shell-chatgpt-streaming t)
  (chatgpt-shell-model-temperature 1.0)

  :config
  ;; Set and manage API Key and Model via `siren-chatgpt' helpers.
  (siren-chatgpt-register-api-key-var 'chatgpt-shell-openai-key)
  (siren-chatgpt-register-model-var 'chatgpt-shell-model-version))

(use-package dall-e-shell
  :defer t

  :config
  ;; Set and manage API Key and Model via `siren-chatgpt' helpers.
  (siren-chatgpt-register-api-key-var 'dall-e-shell-openai-key))

(provide 'siren-chatgpt-shell)
;;; siren-chatgpt-shell.el ends here
