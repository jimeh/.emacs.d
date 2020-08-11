;;; siren-tab-bar.el --- jimeh's Emacs Siren: tab-bar configuration.

;;; Commentary:

;; Basic configuration for tab-bar.

;;; Code:

(require 'siren-workspace-map)

(use-package tab-bar
  :straight (:type built-in)

  :bind
  ("s-}" . tab-next)
  ("s-{" . tab-previous)
  (:map siren-workspace-map
        ("n" . tab-next)
        ("C-n" . tab-next)
        ("p" . tab-previous)
        ("C-p" . tab-previous)
        ("b" . siren-tab-bar-move-tab-left)
        ("C-b" . siren-tab-bar-move-tab-left)
        ("f" . siren-tab-bar-move-tab-right)
        ("C-f" . siren-tab-bar-move-tab-right)
        ("c" . tab-new)
        ("C-c" . tab-new)
        ("k" . tab-close)
        ("C-k" . tab-close)
        ("l" . tab-recent)
        ("C-l" . tab-recent)
        ("r" . tab-rename)
        ("C-r" . tab-rename)
        ("s" . siren-tab-bar-switch-to-or-create-tab)
        ("C-s" . siren-tab-bar-switch-to-or-create-tab)
        ("e" . tab-switcher)
        ("C-e" . tab-switcher)
        ("u" . tab-undo)
        ("C-u" . tab-undo)
        (";" . siren-tab-bar-echo-tab-list)
        ("C-;" . siren-tab-bar-echo-tab-list)
        ("0" . siren-tab-bar-switch-to-index)
        ("1" . siren-tab-bar-switch-to-index)
        ("2" . siren-tab-bar-switch-to-index)
        ("3" . siren-tab-bar-switch-to-index)
        ("4" . siren-tab-bar-switch-to-index)
        ("5" . siren-tab-bar-switch-to-index)
        ("6" . siren-tab-bar-switch-to-index)
        ("7" . siren-tab-bar-switch-to-index)
        ("8" . siren-tab-bar-switch-to-index)
        ("9" . siren-tab-bar-switch-to-index))

  :custom
  (tab-bar-new-tab-choice "*scratch*")
  (tab-bar-tab-hints nil)

  :init
  (defgroup siren-tab-bar nil
    "Siren specific tweaks to tar-bar-mode."
    :group 'tab-bar)

  (defcustom siren-tab-bar-echo-tab-list t
    "When t and print list of tabs in echo area when changing tabs."
    :type 'boolean
    :group 'siren-tab-bar)

  (defface siren-tab-bar-echo-default
    '((t :inherit default))
    "Face for tab names in echo area."
    :group 'siren-tab-bar)

  (defface siren-tab-bar-echo-current
    '((t :inherit font-lock-keyword-face))
    "Face for current tab name in echo area."
    :group 'siren-tab-bar)

  (defface siren-tab-bar-echo-index
    '((t :inherit font-lock-comment-face))
    "Face for index numbers in echo area."
    :group 'siren-tab-bar)

  (defun siren-tab-bar-switch-to-or-create-tab (name)
    "Switch to or create a tab by NAME."
    (interactive
     (let* ((recent-tabs (mapcar (lambda (tab) (alist-get 'name tab))
                                 (tab-bar--tabs-recent))))
       (list (completing-read "Switch to tab by name (default recent): "
                              recent-tabs nil nil nil nil recent-tabs))))
    (let ((tab-names (mapcar (lambda (tab) (alist-get 'name tab))
                              (funcall tab-bar-tabs-function))))
      (if (member name tab-names)
          (tab-bar-switch-to-tab name)
        (siren-tab-bar-new-named-tab name)))
    (tab-bar-select-tab (1+ (or (tab-bar--tab-index-by-name name) 0))))

  (defun siren-tab-bar-new-named-tab (name)
    "Create a new tab named NAME."
    (interactive "MName for new tab (leave blank for automatic naming): ")
    (tab-new 99999)
    (if (not (string= name ""))
        (tab-rename name)))

  (defun siren-tab-bar-switch-to-index (&optional arg)
    "Switch to tab with index ARG.
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

    (tab-bar-select-tab (1+ arg)))

  (defun siren-tab-bar-move-tab-left ()
    "Move current tab to the left."
    (interactive)
    (tab-move -1))

  (defun siren-tab-bar-move-tab-right ()
    "Move current tab to the right."
    (interactive)
    (tab-move 1))

  (defun siren-tab-bar-echo-tab-list ()
    "Echo list of tabs"
    (interactive)
    (let* ((tabs (funcall tab-bar-tabs-function))
           (current-index (or (tab-bar--current-tab-index tabs) 0))
           (output "")
           (index 0))
      (dolist (tab tabs)
        (setq output
              (concat output
                      (propertize (format "%d:" index)
                                  'face 'siren-tab-bar-echo-index)
                      (propertize (alist-get 'name tab)
                                  'face (if (eq index current-index)
                                            'siren-tab-bar-echo-current
                                          'siren-tab-bar-echo-default))
                      " ")
              index (1+ index)))

      (message "tabs: %s" output)))

  (defun siren-tab-bar-echo-tab-list-advice (&rest _)
    (when siren-tab-bar-echo-tab-list
      (siren-tab-bar-echo-tab-list)))

  (advice-add 'tab-bar-close-tab :after #'siren-tab-bar-echo-tab-list-advice)
  (advice-add 'tab-bar-move-tab-to :after #'siren-tab-bar-echo-tab-list-advice)
  (advice-add 'tab-bar-new-tab-to :after #'siren-tab-bar-echo-tab-list-advice)
  (advice-add 'tab-bar-rename-tab :after #'siren-tab-bar-echo-tab-list-advice)
  (advice-add 'tab-bar-select-tab :after #'siren-tab-bar-echo-tab-list-advice)
  (advice-add 'tab-switcher-select :after #'siren-tab-bar-echo-tab-list-advice))

(provide 'siren-tab-bar)
;;; siren-tab-bar.el ends here
