;;; early-init.el --- jimeh's Emacs Siren: early init file.

;;; Commentary:

;; The file before the file that starts it all.

;;; Code:

;; Native-Comp
(if (boundp 'native-comp-speed)
    (setq native-comp-speed 2)
  (setq comp-speed 2))

(if (boundp 'native-comp-async-report-warnings-errors)
    (setq native-comp-async-report-warnings-errors nil)
  (setq comp-async-report-warnings-errors 2))

(if (boundp 'native-comp-async-query-on-exit)
    (setq native-comp-async-query-on-exit t)
  (setq comp-async-query-on-exit t))

(let ((deny-list '("\\(?:[/\\\\]\\.dir-locals\\.el$\\)"
                   ;; Don't native-compile *-authloads.el and *-pkg.el files as they
                   ;; seem to produce errors during native-compile.
                   "\\(?:[^z-a]*-autoloads\\.el$\\)"
                   "\\(?:[^z-a]*-pkg\\.el$\\)")))
  (if (boundp 'native-comp-deferred-compilation-deny-list)
      (setq native-comp-deferred-compilation-deny-list deny-list)
    (setq comp-deferred-compilation-deny-list deny-list)))

(when (or (boundp 'comp-eln-load-path) (boundp 'native-comp-eln-load-path))
  (let ((eln-cache-dir (expand-file-name "cache/eln-cache/"
                                         user-emacs-directory))
        (find-exec (executable-find "find")))

    (if (boundp 'native-comp-eln-load-path)
        (setcar native-comp-eln-load-path eln-cache-dir)
      (setcar comp-eln-load-path eln-cache-dir))
    ;; Quitting emacs while native compilation in progress can leave zero byte
    ;; sized *.eln files behind. Hence delete such files during startup.
    (when find-exec
      (call-process find-exec nil nil nil eln-cache-dir
                    "-name" "*.eln" "-size" "0" "-delete" "-or"
                    "-name" "*.eln.tmp" "-size" "0" "-delete"))))

;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold most-positive-fixnum)

;; Disable Emacs 27's automatic package.el initialization before the init.el
;; file is loaded. I use straight.el instead of package.el.
(setq package-enable-at-startup nil)

;; Prevent the glimpse of un-styled Emacs by disabling these UI elements early.
(setq tool-bar-mode nil
      menu-bar-mode nil)
(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

;; Resizing the Emacs frame can be a terribly expensive part of changing the
;; font. By inhibiting this, we easily halve startup times with fonts that are
;; larger than the system default.
(setq frame-inhibit-implied-resize t)

;;; early-init.el ends here
