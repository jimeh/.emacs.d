;;; siren-ediff.el --- jimeh's Emacs Siren: ediff configuration.

;;; Commentary:

;; Basic configuration for ediff.

;;; Code:

(defun ediff-copy-both-to-C ()
  "Copy both A and B variants to C."
  (interactive)
  (ediff-copy-diff
   ediff-current-difference nil 'C nil
   (concat
    (ediff-get-region-contents ediff-current-difference 'A ediff-control-buffer)
    (ediff-get-region-contents ediff-current-difference 'B ediff-control-buffer))))

(defun add-B-to-ediff-mode-map ()
  "Assign B key to copy both A and B variants to C."
  (define-key ediff-mode-map "B" 'ediff-copy-both-to-C))

(add-hook 'ediff-keymap-setup-hook 'add-B-to-ediff-mode-map)

(provide 'siren-ediff)
;;; siren-ediff.el ends here
