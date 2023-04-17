;;; siren-chatgpt-shell.el --- jimeh's Emacs Siren: chatgpt-shell configuration.

;;; Commentary:

;; Basic configuration for chatgpt-shell.

;;; Code:

(require 'siren-chatgpt)

(use-package chatgpt-shell
  :straight (:host github :repo "xenodium/chatgpt-shell")
  :defer t

  :custom
  (chatgpt-shell-chatgpt-streaming t)
  (chatgpt-shell-model-temperature 1.0)

  :config
  ;; Set and manage API Key and Model via `siren-chatgpt' helpers.
  (siren-chatgpt-register-api-key-var 'chatgpt-shell-openai-key)
  (siren-chatgpt-register-api-key-var 'dall-e-shell-openai-key)
  (siren-chatgpt-register-model-var 'chatgpt-shell-model-version)

  (require 'ob-chatgpt-shell)
  (ob-chatgpt-shell-setup)

  (require 'ob-dall-e-shell)
  (ob-dall-e-shell-setup))

(provide 'siren-chatgpt-shell)
;;; siren-chatgpt-shell.el ends here
