;;
;; Load package managers
;;

;; Load Package
(require 'package)

;; Add MELPA.
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

;; Load el-get
(add-to-list 'load-path (config-path "el-get/el-get"))
(require 'el-get)


;;
;; Define packages to install
;;

;; Packages to install from MELPA
(defvar my-melpa-packages
  '(melpa
    ack-and-a-half
    auto-complete
    autopair
    browse-kill-ring
    coffee-mode
    flymake-coffee
    flymake-css
    flymake-cursor
    flymake-haml
    flymake-php
    flymake-ruby
    flymake-sass
    flymake-shell
    full-ack
    haml-mode
    inf-ruby
    magit
    magithub
    markdown-mode
    minimap
    php+-mode
    rainbow-mode
    ruby-mode
    ruby-compilation
    ruby-interpolation
    sass-mode
    scss-mode
    textmate
    undo-tree
    yaml-mode
    yasnippet
    writegood-mode)
  "A list of packages to install from MELPA at launch.")

;; Packages to install from el-get
(defvar my-el-get-packages
  '(ecb
    highlight-indentation
    rhtml-mode
    tomorrow-night-paradise-theme)
  "A list of packages to install from el-get at launch.")

;; Custom packages to install with el-get
(setq el-get-sources
      '((:name eproject
               :type git
               :url "https://github.com/jrockway/eproject.git"
               :post-init (progn
                            (require 'eproject)
                            (require 'eproject-extras)))
        (:name escreen
               :description "Emacs window session manager"
               :type github
               :pkgname "renard/escreen-el"
               :post-init (progn
                            (autoload 'escreen-install "escreen" nil t)))
        (:name feature-mode
               :type git
               :url "git://github.com/michaelklishin/cucumber.el.git")
        ;; (:name flymake-elisp
        ;;        :type git
        ;;        :url "git://gist.github.com/1130849.git")
        (:name fill-column-indicator
               :type git
               :url "git://github.com/alpaker/Fill-Column-Indicator.git"
               :features fill-column-indicator)
        (:name hackertype
               :type git
               :url "https://github.com/bitemyapp/hacker-type-emacs.git"
               :load "hackertype.el")
        (:name linum+
               :type http
               :url "http://dea.googlecode.com/svn/trunk/my-lisps/linum+.el")
        ;; (:name rsense
        ;;        :description "Intelligent Ruby code-completion"
        ;;        :website "http://cx4a.org/software/rsense/"
        ;;        :type git
        ;;        :url "https://github.com/m2ym/rsense.git"
        ;;        :build ("ant" "chmod +x bin/rsense")
        ;;        :post-init (progn
        ;;                     (setq rsense-home (expand-file-name default-directory))
        ;;                     (add-to-list 'load-path (concat rsense-home "/etc"))
        ;;                     (require 'rsense)))
        (:name ruby-electric
               :type http
               :url "http://svn.ruby-lang.org/repos/ruby/trunk/misc/ruby-electric.el")
        (:name tiling
               :type emacswiki
               :features tiling)
        (:name twilight-anti-bright-theme
               :description "A light-on-dark Emacs theme inspired by the dark-on-light Twilight Bright TextMate theme."
               :website "https://github.com/jimeh/twilight-anti-bright-theme"
               :type github
               :pkgname "jimeh/twilight-anti-bright-theme"
               :minimum-emacs-version 24
               :post-init (add-to-list 'custom-theme-load-path
                                       default-directory))
        ;; (:name twilight-bright-theme
        ;;        :description "A Emacs port of the TextMate theme by the same name by Florian Pichler with some minor tweaks and additions."
        ;;        :website "https://github.com/jimeh/twilight-bright-theme.el"
        ;;        :type github
        ;;        :pkgname "jimeh/twilight-bright-theme.el"
        ;;        :minimum-emacs-version 24
        ;;        :post-init (add-to-list 'custom-theme-load-path
        ;;                                default-directory))
        ))


;;
;; Initialize Packages function (called by init.el)
;;

(defun initialize-my-packages ()
  ;; Activate ECB if window-system
  (when (require 'ecb nil 'noerror)
    (setq stack-trace-on-error t) ;; hack to fix a load-error
    (if window-system
        (ecb-activate)))

  ;; Load Auto-Complete and addons
  (when (require 'auto-complete nil 'noerror)
    )

  ;; Load and setup Escreen
  (when (require 'escreen nil 'noerror)
    (escreen-install))

  ;; Load Undo-Tree
  (require 'undo-tree)

  ;; Load Linum+
  (require 'linum+)

  ;; Load full-ack
  (require 'full-ack)
  )


;;
;; Package helpers (borrowed from Emacs Prelude)
;;

(defun my-melpa-packages-installed-p ()
  (loop for p in my-melpa-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(defun install-my-melpa-packages ()
  (unless (my-melpa-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (dolist (p my-melpa-packages)
      (unless (package-installed-p p)
        (package-install p)))))


;;
;; Install packages
;;

;; Required because of a package.el bug
(setq url-http-attempt-keepalives nil)

;; Install Melpa packages
(install-my-melpa-packages)

;; Install el-get packages
(setq el-get-packages
      (append my-el-get-packages (mapcar 'el-get-source-name el-get-sources)))
(el-get 'sync el-get-packages)
