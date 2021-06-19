;;; siren-marginalia.el --- jimeh's Emacs Siren: marginalia configuration.

;;; Commentary:

;; Basic configuration for marginalia.

;;; Code:

(use-package marginalia
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode +1)

  (defun siren-marginalia-setup ()
    (interactive)
    (mapc
     (lambda (x)
       (pcase (car x)
         ;; Default command category to 'marginalia-annotate-binding instead of
         ;; 'marginalia-annotate-command which has a slight performance impact
         ;; when filtering M-x candidates.
         ('command (setcdr x (cons 'marginalia-annotate-binding
                                   (remq 'marginalia-annotate-binding (cdr x)))))))
     marginalia-annotator-registry))

  :config
  (siren-marginalia-setup))

(provide 'siren-marginalia)
;;; siren-marginalia.el ends here
