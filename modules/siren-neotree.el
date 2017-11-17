;;; siren-neotree.el --- jimeh's Emacs Siren: neotree configuration.

;;; Commentary:

;; Basic configuration for neotree.

;;; Code:

(use-package neotree
  :bind
  ("C-x C-p" . neotree-toggle)
  ("C-x p" . neotree-project-dir-toggle)

  :init
  (defun neotree-project-dir-toggle ()
    "Open NeoTree using the project root, using find-file-in-project,
or the current buffer directory."
    (interactive)
    (let ((project-dir (ignore-errors (projectile-project-root)))
          (file-name (buffer-file-name))
          (neo-smart-open nil))
      (if (and (fboundp 'neo-global--window-exists-p)
               (neo-global--window-exists-p))
          (neotree-hide)
        (progn
          (neotree-show)
          (if project-dir
              (neotree-dir project-dir))
          (if file-name
              (neotree-find file-name))))))

  :config
  (require 'siren-projectile)
  (setq neo-autorefresh t
        neo-force-change-root t
        neo-mode-line-type 'default
        neo-show-hidden-files t
        neo-show-updir-line nil
        neo-smart-open nil
        neo-theme 'ascii
        neo-toggle-window-keep-p t
        neo-vc-integration '(face char)
        neo-window-width 54))

(provide 'siren-neotree)
;;; siren-neotree.el ends here
