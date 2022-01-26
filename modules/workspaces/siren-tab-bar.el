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
        ("C-n" . tab-next)
        ("C-p" . tab-previous)
        ("c" . tab-new)
        ("C-c" . tab-new)
        ("k" . tab-close)
        ("C-k" . tab-close)
        ("l" . tab-recent)
        ("C-l" . tab-recent)
        ("r" . tab-rename)
        ("C-r" . tab-rename)
        ("n" . siren-tab-bar-move-tab-right)
        ("p" . siren-tab-bar-move-tab-left)
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
        ("9" . siren-tab-bar-switch-to-index)
        ("b" . tab-bar-history-back)
        ("C-b" . tab-bar-history-back)
        ("f" . tab-bar-history-forward)
        ("C-f" . tab-bar-history-forward))

  :custom
  (tab-bar-close-button-show nil)
  (tab-bar-format '(tab-bar-format-tabs-groups tab-bar-separator))
  (tab-bar-history-limit 25)
  (tab-bar-new-tab-choice "*scratch*")
  (tab-bar-show t)
  (tab-bar-tab-group-format-function #'siren-tab-bar-tab-group-format-default)
  (tab-bar-tab-hints t)
  (tab-bar-tab-name-format-function #'siren-tab-bar-tab-name-format-default)

  :config
  (siren-tab-bar-setup)

  :init
  (defun siren-tab-bar-setup ()
    (tab-bar-mode)
    (tab-bar-history-mode))

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

  (defface siren-tab-bar-tab
    `((t :inherit 'tab-bar-tab
         :foreground ,(face-attribute 'font-lock-keyword-face :foreground nil t)))
    "Face for active tab in tab-bar."
    :group 'siren-tab-bar)

  (defface siren-tab-bar-tab-hint
    `((t :inherit 'siren-tab-bar-tab
         :foreground ,(face-attribute 'tab-bar-tab-inactive :foreground nil t)))
    "Face for active tab hint in tab-bar."
    :group 'siren-tab-bar)

  (defface siren-tab-bar-tab-inactive
    `((t :inherit 'tab-bar-tab-inactive
         :foreground ,(face-attribute 'font-lock-comment-face :foreground nil t)))
    "Face for inactive tab in tab-bar."
    :group 'siren-tab-bar)

  (defface siren-tab-bar-tab-hint-inactive
    `((t :inherit 'siren-tab-bar-tab-inactive
         :foreground ,(face-attribute 'tab-bar-tab-inactive :foreground nil t)))
    "Face for inactive tab hint in tab-bar."
    :group 'siren-tab-bar)

  (defun siren-tab-bar-tab-name-format-default (tab i)
    (let* ((current-p (eq (car tab) 'current-tab))
           (tab-face (if current-p
                         'siren-tab-bar-tab
                       'siren-tab-bar-tab-inactive))
           (hint-face (if current-p
                          'siren-tab-bar-tab-hint
                        'siren-tab-bar-tab-hint-inactive)))
      (concat (propertize (if tab-bar-tab-hints (format "  %d:" (- i 1)) "  ")
                          'face hint-face)
              (propertize
               (concat
                (alist-get 'name tab)
                (or (and tab-bar-close-button-show
                         (not (eq tab-bar-close-button-show
                                  (if current-p 'non-selected 'selected)))
                         tab-bar-close-button)
                    "")
                "  ")
               'face tab-face))))

  (defun siren-tab-bar-tab-group-format-default (tab i)
    (propertize
     (concat (if tab-bar-tab-hints (format "%d:" (- i 1)) "")
             (funcall tab-bar-tab-group-function tab))
     'face 'tab-bar-tab-group-inactive))

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
           (output '())
           (index 0))
      (dolist (tab tabs)
        (add-to-list 'output
                     (concat (propertize (format "%d:" index)
                                         'face 'siren-tab-bar-echo-index)
                             (propertize (alist-get 'name tab)
                                         'face (if (eq index current-index)
                                                   'siren-tab-bar-echo-current
                                                 'siren-tab-bar-echo-default)))
                     t)
        (setq index (1+ index)))

      (message "tabs: %s" (string-join output " "))))

  (defun siren-tab-bar-echo-tab-list-advice (&rest _)
    (when siren-tab-bar-echo-tab-list
      (siren-tab-bar-echo-tab-list)))

  (advice-add 'tab-bar-close-tab :after #'siren-tab-bar-echo-tab-list-advice)
  (advice-add 'tab-bar-move-tab-to :after #'siren-tab-bar-echo-tab-list-advice)
  (advice-add 'tab-bar-new-tab-to :after #'siren-tab-bar-echo-tab-list-advice)
  (advice-add 'tab-bar-rename-tab :after #'siren-tab-bar-echo-tab-list-advice)
  (advice-add 'tab-bar-select-tab :after #'siren-tab-bar-echo-tab-list-advice)
  (advice-add 'tab-switcher-select :after #'siren-tab-bar-echo-tab-list-advice)
  (advice-add 'display-buffer-in-new-tab :after #'siren-tab-bar-echo-tab-list-advice)
  (advice-add 'tab-bar-change-tab-group :after #'siren-tab-bar-echo-tab-list-advice))

(provide 'siren-tab-bar)
;;; siren-tab-bar.el ends here
