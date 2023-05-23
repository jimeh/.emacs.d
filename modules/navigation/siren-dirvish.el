;;; siren-dirvish.el --- jimeh's Emacs Siren: dirvish configuration.

;;; Commentary:

;; Basic configuration for dirvish.

;;; Code:

(use-package dirvish
  :custom
  (dirvish-cache-dir (siren-cache-dir "dirvish"))
  (dirvish-quick-access-entries
   '(("h" "~/"                  "Home")
     ("s" "~/src/"              "src")
     ("t" "~/Temp/"             "Temp")
     ("d" "~/Downloads/"        "Downloads")
     ("D" "~/Desktop/"          "Desktop")
     ("p" "~/Projects/"         "Projects")
     ("k" "~/Projects/krystal/" "krystal")))
  (dirvish-mode-line-format '(:left (sort file-time " " file-size symlink)
                                    :right (omit yank index)))
  (dirvish-attributes '(subtree-state all-the-icons collapse file-size))
  (dirvish-reuse-session t)
  (dirvish-side-auto-expand t)

  :general
  (:keymaps 'dirvish-mode-map
            "TAB" 'dirvish-subtree-toggle
            "*" 'dirvish-mark-menu
            "f" 'dirvish-file-info-menu
            "b" 'dirvish-quick-access
            "s" 'dirvish-quicksort
            "C-b" 'dirvish-subtree-up)

  :init
  ;; Let Dirvish take over Dired globally.
  (with-eval-after-load 'dired
    (with-eval-after-load 'dired+
      (dirvish-override-dired-mode t))))

(provide 'siren-dirvish)
;;; siren-dirvish.el ends here
