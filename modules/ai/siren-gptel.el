;;; siren-gptel.el --- jimeh's Emacs Siren: gptel configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for gptel.

;;; Code:

(require 'siren-chatgpt)

(use-package gptel
  :hook
  (gptel-mode . siren-gptel-setup-auto-save)

  :general
  ("C-c C-q" 'siren-gptel)
  (:keymaps 'gptel-mode-map
            "C-c C-<return>" 'gptel-send)

  :preface
  (defgroup siren-gptel nil
    "jimeh's Emacs Siren: gptel configuration."

    :group 'gptel)

  (defcustom siren-gptel-history-dir (expand-file-name "gptel-history" user-emacs-directory)
      "Directory to save GPTel chat sessions upon buffer close."
      :type 'string
      :group 'siren-gptel)

  (defun siren-gptel--generate-filename ()
    "Generate a filename with the buffer creation date, time."
    (let* ((time (or (buffer-local-value 'siren-gptel-buffer-create-time (current-buffer))
                     (current-time)))
           (timestamp (format-time-string "%Y%m%d_%H%M%S" time)))
      (concat (file-name-as-directory siren-gptel-history-dir) "gptel_" timestamp ".org")))

  (defun siren-gptel-save-session ()
    "Save the current GPTel chat session to a file."
    (interactive)
    (when (bound-and-true-p gptel-mode)
      (let* ((filename (siren-gptel--generate-filename))
             (dirname (file-name-directory filename))
             (content (buffer-string)))
        (unless (file-directory-p dirname)
          (make-directory dirname t))
        (with-temp-buffer
          (insert content)
          (write-file filename))
        (message "Session saved to %s" filename))))

  (defun siren-gptel-setup-auto-save ()
    "Setup auto-save for GPTel chat sessions."
    (unless (and buffer-file-name
                 (string-prefix-p siren-gptel-history-dir (file-name-directory buffer-file-name)))
      (setq-local siren-gptel-buffer-create-time (current-time))
      (add-hook 'kill-buffer-hook 'siren-gptel-save-session nil t)))

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
