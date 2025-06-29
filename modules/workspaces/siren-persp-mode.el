;;; siren-persp-mode.el --- jimeh's Emacs Siren: persp-mode configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for persp-mode.

;;; Code:

(require 'siren-refine)
(require 'siren-workspace-map)

(use-package persp-mode
  :general
  ("s-}" 'persp-next)
  ("s-{" 'persp-prev)
  (:keymaps 'siren-workspace-map
            "n" 'persp-next
            "C-n" 'persp-next
            "p" 'persp-prev
            "C-p" 'persp-prev
            "s" 'persp-frame-switch
            "C-s" 'persp-frame-switch
            "S" 'persp-window-switch
            "r" 'persp-rename
            "C-r" 'persp-rename
            "c" 'persp-copy
            "C-c" 'persp-copy
            "C" 'persp-kill
            "z" 'persp-save-and-kill
            "a" 'persp-add-buffer
            "C-a" 'persp-add-buffer
            "b" 'persp-switch-to-buffer
            "C-b" 'siren-persp-mode-ibuffer
            "t" 'persp-temporarily-display-buffer
            "i" 'persp-import-buffers
            "I" 'persp-import-win-conf
            "k" 'persp-remove-buffer
            "C-k" 'persp-remove-buffer
            "K" 'persp-kill-buffer
            "w" 'persp-save-state-to-file
            "W" 'persp-save-to-file-by-names
            "C-l" 'siren-persp-mode-switch-to-most-recent
            "l" 'persp-load-state-from-file
            "L" 'persp-load-from-file-by-names
            ";" 'siren-persp-mode-show-current-perspective-name
            "C-;" 'siren-persp-mode-show-current-perspective-name
            "e" 'siren-persp-mode-edit-names-cache
            "C-e" 'siren-persp-mode-edit-names-cache
            "0" 'siren-persp-switch-to-index
            "1" 'siren-persp-switch-to-index
            "2" 'siren-persp-switch-to-index
            "3" 'siren-persp-switch-to-index
            "4" 'siren-persp-switch-to-index
            "5" 'siren-persp-switch-to-index
            "6" 'siren-persp-switch-to-index
            "7" 'siren-persp-switch-to-index
            "8" 'siren-persp-switch-to-index
            "9" 'siren-persp-switch-to-index)

  :custom
  (persp-auto-save-num-of-backups 10)
  (persp-autokill-buffer-on-remove 'kill-weak)
  (persp-keymap-prefix "")
  (persp-nil-name "nil")

  :preface
  (defun siren-persp-mode-filter-magit-buffers (buf)
    (string-prefix-p "magit" (buffer-name buf)))

  (defun siren-persp-mode-ibuffer (arg)
    (interactive "P")
    (with-persp-buffer-list () (ibuffer arg)))

  (defun siren-persp-mode-edit-names-cache ()
    "Use refine package to edit persp-names-cache variable."
    (interactive)
    (refine 'persp-names-cache))

  (defun siren-persp-before-kill-hook (persp)
    "Remove the killed perspective's name from persp-recent-persps."
    (let* ((frame (selected-frame))
           (recent-list (frame-parameter frame 'persp-recent-persps))
           (most-recent (nth 1 recent-list))
           (persp-name (safe-persp-name persp))
           (current-persp (safe-persp-name (get-current-persp))))

      (set-frame-parameter frame 'persp-recent-persps
                           (delete persp-name recent-list))
      (set-frame-parameter frame 'persp-recent-just-killed persp-name)

      (if (and most-recent (equal persp-name current-persp))
          (persp-frame-switch most-recent frame))))

  (defun siren-persp-activated-hook (type)
    "Remove any persp names from recent list that no longer exist."
    (let* ((frame (selected-frame))
           (recent-list (frame-parameter frame 'persp-recent-persps))
           (perspectives (persp-names-current-frame-fast-ordered))
           (current-persp (safe-persp-name (get-current-persp))))

      ;; And/move current persp name to beginning of recent list.
      (setq recent-list (append (list current-persp)
                                (delete current-persp recent-list)))

      ;; Perform safetly clean-up of recent list.
      (dolist (persp-name recent-list)
        (when (not (member persp-name perspectives))
          (message "WARNING: perspective %s in recent list does not exist."
                   persp-name)
          (setq recent-list (delete persp-name recent-list))))

      (set-frame-parameter frame 'persp-recent-persps recent-list)))

  (defun siren-persp-renamed-hook (persp old-name new-name)
    (let* ((frame (selected-frame))
           (recent-list (frame-parameter frame 'persp-recent-persps))
           (index (cl-position old-name recent-list)))
      (when index
        (setcar (nthcdr index recent-list) new-name)
        (set-frame-parameter frame 'persp-recent-persps recent-list))))

  (defun siren-persp-mode-switch-to-most-recent ()
    "Switch to the most recently active persp."
    (interactive)
    (let* ((frame (selected-frame))
           (most-recent (nth 1 (frame-parameter frame 'persp-recent-persps))))

      (if most-recent
          (if (member most-recent (persp-names-current-frame-fast-ordered))
              (persp-frame-switch most-recent frame)
            (message "perspective %s is no longer available" most-recent)))))

  (defun siren-persp-mode-show-current-perspective-name (&rest _)
    "Show current perspectives, highlighting the active one."
    (interactive)
    (let* ((frame (selected-frame))
           (just-killed (frame-parameter frame 'persp-recent-just-killed))
           (perspectives (persp-names-current-frame-fast-ordered))
           (current-persp-name (safe-persp-name (get-current-persp)))
           (output "")
           (index 0))
      (dolist (persp-name perspectives)
        (when (not (equal persp-name just-killed))
          (setq output
                (concat output
                        (propertize (format "%d:" index) 'face
                                    'persp-face-lighter-nil-persp)
                        (if (string= current-persp-name persp-name)
                            (propertize persp-name
                                        'face 'persp-face-lighter-default)
                          persp-name)
                        " ")
                index (1+ index))))
      (set-frame-parameter frame 'persp-recent-just-killed nil)
      (message "perspectives: %s" output)))

  (defun siren-persp-switch-to-index (&optional arg)
    "Switch to perspective with index ARG.
When this command is bound to a numeric key, calling it without
an argument will translate its bound numeric key to the numeric
argument.
ARG counts from 1."
    (interactive "P")
    (unless (integerp arg)
      (let ((key (event-basic-type last-command-event)))
        (setq arg (if (and (characterp key) (>= key ?0) (<= key ?9))
                      (- key ?0)
                    0))))

    (let ((name (nth arg (persp-names-current-frame-fast-ordered))))
      (if name (persp-switch name))))

  :init
  ;; Do not auto save/load in terminal. My main instance of Emacs runs in GUI,
  ;; terminal based instances are for smaller random things.
  (when (not window-system)
    (setq persp-auto-resume-time -1
          persp-auto-save-opt 0))

  :config
  (persp-mode)

  (add-hook 'persp-common-buffer-filter-functions
            'siren-persp-mode-filter-magit-buffers)

  (add-hook 'persp-before-kill-functions 'siren-persp-before-kill-hook)
  (add-hook 'persp-activated-functions 'siren-persp-activated-hook)
  (add-hook 'persp-renamed-functions 'siren-persp-renamed-hook)

  (add-hook 'persp-activated-functions
            'siren-persp-mode-show-current-perspective-name))

(provide 'siren-persp-mode)
;;; siren-persp-mode.el ends here
