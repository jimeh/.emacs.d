;; erlang-mode is part of the Erlang source, and I found
;; no simple way to create a el-get package. So it's one
;; more thing thats not installed through el-get.

(add-to-list 'load-path (get-config-path "mode-customizations/erlang"))
(setq erlang-root-dir "/usr/local")
(setq exec-path (cons "/usr/local/bin" exec-path))
(require 'erlang-start)
(require 'erlang-flymake)

(defun customizations-for-erlang-mode ()
  (interactive)
  (flyspell-prog-mode)
  (linum-mode t)
  (fci-mode)
  (hs-minor-mode 1)
  (auto-complete-mode)
  (setq highlight-indentation-offset 2)
  (highlight-indentation-mode)
  (highlight-indentation-current-column-mode))

(add-hook 'erlang-mode-hook 'customizations-for-erlang-mode)
