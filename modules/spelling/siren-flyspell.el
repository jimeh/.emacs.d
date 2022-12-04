;;; siren-flyspell.el --- jimeh's Emacs Siren: flyspell configuration.

;;; Commentary:

;; Basic configuration for flyspell.

;;; Code:

(use-package flyspell
  :straight (:type built-in)
  :defer t
  :diminish flyspell-mode

  :hook
  (prog-mode . flyspell-prog-mode)
  ((git-commit-setup text-mode) . siren-flyspell-mode-enable)

  :custom
  (ispell-program-name "aspell") ;; use aspell instead of ispell
  (ispell-extra-args '("--lang=en" "--sug-mode=ultra"))

  :preface
  (defun siren-flyspell-mode-enable ()
    (flyspell-mode t))

  :config
  ;; Unbind keys used by siren-goto-chg module.
  (unbind-key "C-." flyspell-mode-map)
  (unbind-key "C-," flyspell-mode-map)
  ;; Unbind keys used by siren-resize-window module.
  (unbind-key "C-;" flyspell-mode-map))

(use-package flyspell-correct
  :general
  ("C-/" 'flyspell-correct-wrapper))

(provide 'siren-flyspell)
;;; siren-flyspell.el ends here
