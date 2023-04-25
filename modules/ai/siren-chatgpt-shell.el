;;; siren-chatgpt-shell.el --- jimeh's Emacs Siren: chatgpt-shell configuration.

;;; Commentary:

;; Basic configuration for chatgpt-shell.

;;; Code:

(require 'siren-chatgpt)

(use-package shell-maker
  :straight (:host github :repo "xenodium/chatgpt-shell"
                   :files ("shell-maker.el"))
  :defer t)

(use-package chatgpt-shell
  :straight (:host github :repo "xenodium/chatgpt-shell"
                   :files ("chatgpt-shell.el" "*-chatgpt-shell.el"))
  :defer t

  :custom
  (chatgpt-shell-chatgpt-streaming t)
  (chatgpt-shell-model-temperature 1.0)

  :config
  ;; Set and manage API Key and Model via `siren-chatgpt' helpers.
  (siren-chatgpt-register-api-key-var 'chatgpt-shell-openai-key)
  (siren-chatgpt-register-model-var 'chatgpt-shell-model-version)

  ;; (require 'ob-chatgpt-shell)
  ;; (ob-chatgpt-shell-setup)
  )

(use-package dall-e-shell
  :straight (:host github :repo "xenodium/chatgpt-shell"
                   :files ("dall-e-shell.el" "*-dall-e-shell.el"))
  :defer t

  :config
  ;; Set and manage API Key and Model via `siren-chatgpt' helpers.
  (siren-chatgpt-register-api-key-var 'dall-e-shell-openai-key)

  ;; (require 'ob-dall-e-shell)
  ;; (ob-dall-e-shell-setup)
  )

(provide 'siren-chatgpt-shell)
;;; siren-chatgpt-shell.el ends here
