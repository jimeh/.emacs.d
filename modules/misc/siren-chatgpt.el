;;; siren-chatgpt.el --- jimeh's Emacs Siren: chatgpt configuration.

;;; Commentary:

;; Basic configuration for chatgpt.

;;; Code:

(defvar siren-openai-api-key nil
  "OpenAI API key.")

(defun siren-openai-api-key ()
  "Return OpenAI API key.
If the key is not already set, try to retrieve it from the auth-source."
  (unless siren-openai-api-key
    (setq siren-openai-api-key
          (or (auth-source-pick-first-password :host "openai.com")
              (error "OpenAI API key not found in auth-source"))))
  siren-openai-api-key)

(use-package openai
  :straight (:host github :repo "emacs-openai/openai")

  :custom
  (openai-key (siren-openai-api-key)))

(use-package chatgpt
  :straight (:host github :repo "emacs-openai/chatgpt")
  :after openai)

(use-package codegpt
  :straight (:host github :repo "emacs-openai/codegpt")
  :after openai)

(use-package chat
  :straight (:host github :repo "iwahbe/chat.el")

  :bind
  ("C-c C-q" . chat)

  :custom
  (chat-api-key (siren-openai-api-key))
  (chat-max-tokens 2000)
  (chat-temperature 0.13))

(provide 'siren-chatgpt)
;;; siren-chatgpt.el ends here
