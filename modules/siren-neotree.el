;;; siren-neotree.el --- jimeh's Emacs Siren: neotree configuration.

;;; Commentary:

;; Basic configuration for neotree.

;;; Code:

(require 'siren-projectile)

(siren-require-packages '(neotree all-the-icons))

(require 'neotree)

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

(setq neo-autorefresh t)
(setq neo-force-change-root t)
(setq neo-mode-line-type 'default)
(setq neo-show-hidden-files t)
(setq neo-show-updir-line nil)
(setq neo-smart-open nil)
(setq neo-theme 'ascii)
(setq neo-toggle-window-keep-p t)
(setq neo-vc-integration '(face char))
(setq neo-window-width 54)

(global-set-key (kbd "C-x C-p") 'neotree-project-dir-toggle)

(provide 'siren-neotree)
;;; siren-neotree.el ends here
