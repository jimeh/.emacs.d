;;; early-init.el --- jimeh's Emacs Siren: early init file.

;;; Commentary:

;; The file before the file that starts it all.

;;; Code:

;; Native-Comp
(setq comp-speed 2
      comp-deferred-compilation t)

(when (boundp 'comp-eln-load-path)
  (add-to-list 'comp-eln-load-path
               (expand-file-name "cache/eln-cache/" user-emacs-directory)))

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
