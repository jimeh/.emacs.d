;;; siren-ido.el --- jimeh's Emacs Siren: ido configuration.

;;; Commentary:

;; Basic configuration for ido.

;;; Code:

(siren-require-packages '(ido-completing-read+ ido-vertical-mode smex))

(require 'ido)
(require 'ido-completing-read+)
(require 'ido-vertical-mode)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-case-fold t
      ido-use-filename-at-point nil
      ido-max-prospects 10
      ido-save-directory-list-file (expand-file-name "ido.hist" siren-savefile-dir)
      ido-default-file-method 'selected-window
      ido-auto-merge-work-directories-length -1
      ido-vertical-define-keys "C-n-C-p-up-down-left-right")

(ido-mode 1)
(ido-ubiquitous-mode 1)
(ido-vertical-mode 1)

;; disable ido faces to see flx highlights
(setq ido-use-faces nil)

;;; smex, remember recently and most frequently used commands
(require 'smex)
(setq smex-save-file (expand-file-name ".smex-items" siren-savefile-dir))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(provide 'siren-ido)
;;; siren-ido.el ends here
