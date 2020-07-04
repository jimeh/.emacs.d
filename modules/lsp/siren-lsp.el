;;; siren-lsp.el --- jimeh's Emacs Siren: lsp-mode configuration.

;;; Commentary:

;; Basic configuration for lsp-mode.

;;; Code:

(use-package lsp-mode
  :defer t
  :bind (:map lsp-mode-map
              ("C-c C-." . lsp-rename)
              ("C-c C-f" . lsp-format-buffer))

  :hook
  (lsp-mode . siren-lsp-mode-setup)

  :custom
  (lsp-eldoc-render-all nil)
  (lsp-enable-xref t)
  (lsp-enable-file-watchers t)
  (lsp-enable-imenu t)
  (lsp-keymap-prefix "M-;")
  (lsp-prefer-capf t)

  ;; Set read process output to 1MB, instead of default 4KB. As many language
  ;; servers produce output ranging from 800KB to 3MB, leaving it at 4KB affects
  ;; performance. More info here:
  ;; https://emacs-lsp.github.io/lsp-mode/page/performance/
  (read-process-output-max (* 1024 1024))

  :init
  (defun siren-lsp-mode-setup ()
    (setq-local company-idle-delay 0.0
                company-minimum-prefix-length 1)))

(provide 'siren-lsp)
;;; siren-lsp.el ends here
