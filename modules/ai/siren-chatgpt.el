;;; siren-chatgpt.el --- jimeh's Emacs Siren: chatgpt configuration.

;;; Commentary:

;; Basic configuration for chatgpt.

;;; Code:

(require 'auth-source)

(defgroup siren-chatgpt nil
  "Options for `siren-chatgpt'."
  :group 'siren)

(defvar siren-chatgpt--api-key-login nil
  "The login value used to retrieve the current API key.")

(defun siren-chatgpt--set-api-key ()
  "Set `siren-chatgpt-api-key' based on provided LOGIN.

If the key is not already set, try to retrieve it from the
auth-source. If LOGIN is non-nil, use that value to retrieve the"
  (let ((login (siren-chatgpt--login-user)))
    (or (and siren-chatgpt--api-key-login
             (string= siren-chatgpt--api-key-login login))
        (let ((api-key (auth-source-pick-first-password :host "api.openai.com"
                                                        :user login)))
          (if api-key
              (progn
                (setq siren-chatgpt--api-key-login login)
                (customize-set-variable 'siren-chatgpt-api-key api-key))
            (error (format "OpenAI key for login \"%s\" not found in auth-source."
                           login)))))))

(defvar siren-chatgpt--api-key-variables nil
  "List of variable names to be updated on `siren-chatgpt-api-key' change.

Other packages should use `siren-chatgpt-register-api-key-var' to register
their API key settings to be kept in sync with `siren-chatgpt-api-key'.")

(defcustom siren-chatgpt-api-key nil
  "OpenAI API key."
  :type 'string
  :set (lambda (symbol value)
         (set-default symbol value)
         (dolist (var siren-chatgpt--api-key-variables)
           (set-default var value)))
  :group 'siren-chatgpt)

(defvar siren-chatgpt--model-variables nil
  "List of variable names to be updated on `siren-chatgpt-model' change.

Other packages should use `siren-chatgpt-register-model-var'
their model settings are kept in sync with `siren-chatgpt-model'.")

(defvar siren-chatgpt-models '("gpt-3.5-turbo"
                               "gpt-3.5-turbo-16k"
                               "gpt-4"
                               "gpt-4-32k"
                               "gpt-4-turbo"
                               "gpt-4-turbo-preview"
                               "gpt-4o"
                               "gpt-4o-2024-05-13")
  "List of supported models.")

(defcustom siren-chatgpt-model "gpt-4o"
  "The model to use for chatgpt."
  :type '(choice (mapcar (lambda (model) (list 'const model))
                         siren-chatgpt-models))
  :set (lambda (symbol value)
         (set-default symbol value)
         (dolist (var siren-chatgpt--model-variables)
           (set-default var value))
         (if siren-chatgpt-api-key
             (siren-chatgpt--set-api-key)))
  :group 'siren-chatgpt)

(defun siren-chatgpt--login-user ()
  "Return the login name of the current user.

Used to allow different API keys for different models."
  (cond ;; ((string-prefix-p "gpt-4" siren-chatgpt-model) "gpt-4")
        (t "apikey")))

(defun siren-chatgpt-select-model ()
  "Select a model to use for chatgpt."
  (interactive)
  (let ((model (completing-read "Select model: " siren-chatgpt-models)))
    (customize-set-variable 'siren-chatgpt-model model)))

(defun siren-chatgpt-register-model-var (var)
  "Register VAR to be updated on `siren-chatgpt-model' change.

VAR should be a symbol representing a variable. When the value of
`siren-chatgpt-model' changes, VAR will be updated accordingly."
  (add-to-list 'siren-chatgpt--model-variables var)
  (set-default var siren-chatgpt-model))

(defun siren-chatgpt-register-api-key-var (var)
  "Register VAR to be updated on `siren-chatgpt-api-key' change.

VAR should be a symbol representing a variable. When the value of
`siren-chatgpt-api-key' changes, the VAR will be updated
accordingly."
  (add-to-list 'siren-chatgpt--api-key-variables var)
  (siren-chatgpt--set-api-key))

(provide 'siren-chatgpt)
;;; siren-chatgpt.el ends here
