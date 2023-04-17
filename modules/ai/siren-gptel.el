;;; siren-gptel.el --- jimeh's Emacs Siren: gptel configuration.

;;; Commentary:

;; Basic configuration for gptel.

;;; Code:

(require 'siren-chatgpt)

(use-package gptel
  :general
  ("C-c C-q" 'siren-gptel)

  :preface
  (defun siren-gptel ()
    "Interactively call gptel, or gptel-send with prefix if region is active."
    (interactive)
    (if (use-region-p)
        (gptel-send t)
      (call-interactively 'gptel)))

  :custom
  (gptel-stream t) ;; Requires curl.
  (gptel-temperature 1.0)
  (gptel-use-curl (and (executable-find "curl") t))

  :config
  ;; Set and manage API Key and Model via `siren-chatgpt' helpers.
  (siren-chatgpt-register-api-key-var 'gptel-api-key)
  (siren-chatgpt-register-model-var 'gptel-model)

  ;; Set default mode to org-mode, must be done after package load.
  (setq gptel-default-mode 'org-mode))

(provide 'siren-gptel)
;;; siren-gptel.el ends here
