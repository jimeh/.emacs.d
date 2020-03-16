;;; siren-flyspell.el --- jimeh's Emacs Siren: flyspell configuration.

;;; Commentary:

;; Basic configuration for flyspell.

;;; Code:

(require 'siren-ido)

(use-package flyspell
  :straight (:type built-in)
  :defer t
  :diminish flyspell-mode

  :hook
  (prog-mode . flyspell-prog-mode)

  :custom
  (ispell-program-name "aspell") ;; use aspell instead of ispell
  (ispell-extra-args '("--lang=en" "--sug-mode=ultra"))

  :config
  ;; Unbind keys used by siren-goto-chg module.
  (unbind-key "C-." flyspell-mode-map)
  (unbind-key "C-," flyspell-mode-map)
  ;; Unbind keys used by siren-resize-window module.
  (unbind-key "C-;" flyspell-mode-map))

(use-package flyspell-correct
  :bind ("C-/" . flyspell-correct-wrapper)
  :custom
  (flyspell-correct-interface #'flyspell-correct-ido))

(provide 'siren-flyspell)
;;; siren-flyspell.el ends here
