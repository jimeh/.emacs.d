;;; siren-chatgpt.el --- jimeh's Emacs Siren: chatgpt configuration.

;;; Commentary:

;; Basic configuration for chatgpt.

;;; Code:

(require 'auth-source)

(defgroup siren-chatgpt nil
  "Options for `siren-chatgpt'."
  :group 'siren)

(defcustom siren-chatgpt-model-variables nil
  "List of variable names to be updated when `siren-chatgpt-model' change.

Other packages should use `siren-chatgpt-register-model-var'
their model settings are kept in sync with `siren-chatgpt-model'."
  :type '(repeat symbol)
  :group 'siren-chatgpt)

(defcustom siren-chatgpt-model "gpt-4"
  "The model to use for chatgpt."
  :type '(choice (const "gpt-3.5-turbo")
                 (const "gpt-3.5-turbo-0301")
                 (const "gpt-4")
                 (const "gpt-4-0314")
                 (const "gpt-4-32k")
                 (const "gpt-4-32k-0314"))
  :set (lambda (symbol value)
         (set-default symbol value)
         (dolist (var siren-chatgpt-model-variables)
           (set-default var value)))
  :group 'siren-chatgpt)

(defun siren-chatgpt-register-model-var (var)
  "Register VAR to be updated on `siren-chatgpt-model' change.

VAR should be a symbol representing a variable. When the value of
`siren-chatgpt-model' changes, the value of VAR will be updated
to match it."
  (add-to-list 'siren-chatgpt-model-variables var)
  (set-default var siren-chatgpt-model))

(defvar siren-openai-api-key nil
  "OpenAI API key.")

(defun siren-openai-api-key ()
  "Return OpenAI API key.
If the key is not already set, try to retrieve it from the auth-source."
  (or siren-openai-api-key
      (let ((api-key (auth-source-pick-first-password :host "openai.com")))
        (if api-key
            (progn
              (setq siren-openai-api-key api-key)
              siren-openai-api-key)
          (error "OpenAI API key not found in auth-source")))))

(provide 'siren-chatgpt)
;;; siren-chatgpt.el ends here
