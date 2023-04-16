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
  (gptel-temperature 1)
  (gptel-use-curl (and (executable-find "curl") t))

  :config
  ;; Dynamically load the API key after package has loaded.
  (setq gptel-api-key (siren-openai-api-key))

  ;; Set default mode to org-mode, must be done after package load.
  (setq gptel-default-mode 'org-mode)

  ;; Set model via `siren-chatgpt-model'.
  (siren-chatgpt-register-model-var 'gptel-model))

(provide 'siren-gptel)
;;; siren-gptel.el ends here
