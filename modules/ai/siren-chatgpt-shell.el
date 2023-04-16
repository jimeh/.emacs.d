;;; siren-chatgpt-shell.el --- jimeh's Emacs Siren: chatgpt-shell configuration.

;;; Commentary:

;; Basic configuration for chatgpt-shell.

;;; Code:

(require 'siren-chatgpt)

(use-package chatgpt-shell
  :straight (:host github :repo "xenodium/chatgpt-shell")

  :custom
  (chatgpt-shell-chatgpt-streaming t)
  (chatgpt-shell-model-temperature 0.13)

  :config
  ;; Dynamically load the API key after package has loaded.
  (setq chatgpt-shell-openai-key (siren-openai-api-key))
  (setq dall-e-shell-openai-key (siren-openai-api-key))

  ;; Set model via `siren-chatgpt-model'.
  (siren-chatgpt-register-model-var 'chatgpt-shell-model-version)

  (require 'ob-chatgpt-shell)
  (ob-chatgpt-shell-setup)

  (require 'ob-dall-e-shell)
  (ob-dall-e-shell-setup))

(provide 'siren-chatgpt-shell)
;;; siren-chatgpt-shell.el ends here
