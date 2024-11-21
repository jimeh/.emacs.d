;;; siren-core-compile.el --- jimeh's Emacs Siren: Compilation.

;;; Commentary:

;; Elisp byte compilation and native compilation.

;;; Code:

;; TODO: Investigate why vertico--exhibit triggers require calls that
;; compile-angel intercepts and slows down upto 2 seconds per keystroke when
;; filtering M-x commands.

;; Use compile-angel to automatically recompile Emacs Lisp files when
;; they are saved.
;; (use-package compile-angel
;;   :demand t
;;   ;; Do not enable compile-angel-on-save-local-mode by default, as it
;;   ;; byte-compiles all *.el files, which causes them to be native compiled too.
;;   ;; :hook
;;   ;; (emacs-lisp-mode . compile-angel-on-save-local-mode)

;;   :custom
;;   (compile-angel-enable-byte-compile t)
;;   (compile-angel-enable-native-compile t)
;;   (compile-angel-excluded-files-regexps '("/\\.dir-config\\.el$"))
;;   (compile-angel-predicate-function 'siren-compile-angel-predicate-function)
;;   (compile-angel-verbose nil)

;;   :preface
;;   (defun siren-compile-angel-predicate-function (el-file)
;;     "Determine if compile-angel should compile EL-FILE."
;;     (let ((file-name (file-name-nondirectory el-file))
;;           (abs-emacs-dir (expand-file-name user-emacs-directory)))
;;       ;; TODO: Investigate loading errors when *.el files from my config are
;;       ;; native compiled.
;;       (and (not (string-equal "init.el" file-name))
;;            (not (string-match-p "\\`siren-.*\\.el\\'" file-name))
;;            (not (string-equal (file-name-directory el-file) abs-emacs-dir)))))

;;   :config
;;   (compile-angel-on-load-mode))

(provide 'siren-core-compile)
;;; siren-core-compile.el ends here
