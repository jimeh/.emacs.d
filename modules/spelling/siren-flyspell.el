;;; siren-flyspell.el --- jimeh's Emacs Siren: flyspell configuration.

;;; Commentary:

;; Basic configuration for flyspell.

;;; Code:

(use-package flyspell
  :ensure nil ;; loaded from emacs built-ins
  :demand
  :diminish flyspell-mode
  :bind
  ("s-." . flyspell-correct-word-before-point)

  :hook
  (prog-mode . flyspell-prog-mode)

  :config
  ;; Ensure flyspell does not override keybindings of siren-goto-chg module.
  (unbind-key "C-." flyspell-mode-map)
  (unbind-key "C-," flyspell-mode-map)

  (setq ispell-program-name "aspell" ; use aspell instead of ispell
        ispell-extra-args '("--lang=en" "--sug-mode=ultra")))

(provide 'siren-flyspell)
;;; siren-flyspell.el ends here
