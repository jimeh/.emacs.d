;;; siren-yasnippet.el --- jimeh's Emacs Siren: yasnippet configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for yasnippet.

;;; Code:

(require 'cl-lib)

(use-package yasnippet
  :diminish yas-minor-mode
  :hook (emacs-startup . yas-reload-all)

  :config
  (yas-global-mode))

(use-package yasnippet-snippets
  :after yasnippet

  :config
  (let ((skip-file (expand-file-name "prog-mode/.yas-skip"
                                     yasnippet-snippets-dir)))
    (when (not (file-exists-p skip-file))
      (make-empty-file skip-file t))))

(use-package yasnippet-capf
  :preface
  (defgroup siren-yasnippet-capf nil
    "Siren specific tweaks to yasnippet-capf."
    :group 'yasnippet-capf)

  (defcustom siren-yasnippet-capf-exact-match t
    "Only return exact matches.

When non-nil, only exact matches will be returned by `yasnippet-capf'.
When nil, all matches will be returned.

Annoyingly, when enabled this seems to hide all completion results for
yasnippet, cause the capf function is run twice, once with the given
prefix, and once without any at all.

It seems like the first call is used to determine if the next capf function
should be used or not, and the second call is what company-mode uses to render
completions.

For my use-case, this is fine, as I only want `yasnippet-capf' triggered
for exact matches, and for everything else move on to the lsp-mode's
`lsp-completion-at-point' function."
    :type 'boolean
    :group 'siren-yasnippet-capf)

  (defun siren-yasnippet-capf--advice-exact-match-only (orig-fun &rest args)
    "Advice to filter out non-exact matches."
    (let ((candidates (apply orig-fun args))
          (prefix (nth 0 args)))
      (if siren-yasnippet-capf-exact-match
          (cl-remove-if-not (lambda (candidate)
                              (string= prefix (substring-no-properties candidate)))
                            candidates)
        candidates)))

  :config
  (advice-add 'yasnippet-capf-candidates
              :around #'siren-yasnippet-capf--advice-exact-match-only))

(provide 'siren-yasnippet)
;;; siren-yasnippet.el ends here
