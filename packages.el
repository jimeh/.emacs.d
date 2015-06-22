;;
;; Load package managers
;;

;; Load Package
(require 'cl)
(require 'package)

;; Add MELPA.
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

;; Load el-get
(add-to-list 'load-path (get-config-path "el-get/el-get"))
(require 'el-get)


;;
;; Define packages to install
;;

;; Packages to install from MELPA
(defvar my-melpa-packages
  '(
    ace-jump-buffer
    ace-jump-mode
    ack-and-a-half
    auto-complete
    browse-kill-ring
    buffer-move
    coffee-mode
    dash-at-point
    diminish
    dired+
    ecb
    exec-path-from-shell
    expand-region
    feature-mode
    fill-column-indicator
    flycheck
    flymake-css
    flymake-cursor
    flymake-php
    fringe-helper
    full-ack
    git-gutter
    git-gutter-fringe
    git-timemachine
    gitconfig-mode
    github-browse-file
    go-autocomplete
    go-mode
    ;; go-projectile
    go-snippets
    grizzl
    haml-mode
    helm
    helm-ack
    helm-ag
    helm-github-stars
    helm-open-github
    helm-projectile
    highlight-indentation
    ido-vertical-mode
    inf-ruby
    jade-mode
    less-css-mode
    magit
    markdown-mode
    minimap
    move-text
    multiple-cursors
    neotree
    nvm
    phi-search
    php-mode
    project-explorer
    projectile
    pt
    puppet-mode
    rainbow-mode
    rbenv
    restclient
    rhtml-mode
    rubocop
    ruby-compilation
    ruby-interpolation
    sass-mode
    scss-mode
    smartparens
    smex
    smooth-scrolling
    string-inflection
    stylus-mode
    textmate
    twilight-anti-bright-theme
    twilight-bright-theme
    undo-tree
    ;; workgroups2
    writegood-mode
    writeroom-mode
    yaml-mode
    yasnippet
    zencoding-mode
    )
  "A list of packages to install from MELPA at launch.")

;; Packages to install from el-get
(defvar my-el-get-packages
  '(
    tomorrow-night-paradise-theme
    )
  "A list of packages to install from el-get at launch.")

;; Custom packages to install with el-get
(setq el-get-sources
      '(
        ;; (:name eproject
        ;;        :type git
        ;;        :url "https://github.com/jrockway/eproject.git"
        ;;        :post-init (progn
        ;;                     (require 'eproject)
        ;;                     (require 'eproject-extras)))
        (:name escreen
               :description "Emacs window session manager"
               :type github
               :pkgname "renard/escreen-el"
               :post-init (progn
                            (autoload 'escreen-install "escreen" nil t)))
        (:name hackertype
               :type git
               :url "https://github.com/bitemyapp/hacker-type-emacs.git"
               :load "hackertype.el")
        (:name linum+
               :type http
               :url "http://dea.googlecode.com/svn/trunk/my-lisps/linum+.el")
        (:name ruby-mode
               :type http
               :url "https://raw.github.com/ruby/ruby/trunk/misc/ruby-mode.el")
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
        ;; (:name tiling
        ;;        :type emacswiki
        ;;        :features tiling)
        (:name tree-mode
               :type http
               :url "http://www.emacswiki.org/emacs/download/tree-mode.el")
        (:name windata
               :type http
               :url "http://www.emacswiki.org/emacs/download/windata.el")
        (:name dirtree
               :type github
               :pkgname "zk/emacs-dirtree"
               :load "dirtree.el")
      )
    )



;;
;; Initialize Packages function (called by init.el)
;;

(defun initialize-my-packages ()
  ;; Activate ECB if window-system
  (when (require 'ecb nil 'noerror)
    (setq stack-trace-on-error t) ;; hack to fix a load-error
    (if window-system (ecb-activate)))

  (when (require 'exec-path-from-shell)
    (when (memq window-system '(mac ns))
      (exec-path-from-shell-initialize)))

  ;; Load Auto-Complete
  (when (require 'auto-complete nil 'noerror)
    (require 'auto-complete-config)
    (ac-config-default)
    (ac-flyspell-workaround)

    ;; load go-autocomplete
    (require 'go-autocomplete nil 'noerror))

  ;; Load browse-kill-ring
  (require 'browse-kill-ring)

  ;; Load and setup Escreen
  (when (require 'escreen nil 'noerror)
    (escreen-install))

  ;; magit setup
  (setq magit-last-seen-setup-instructions "1.4.0")

  ;; Load and setup Workgroups2
  (when (require 'workgroups2 nil 'noerror)
    (workgroups-mode 1))

  ;; smartparens
  (when (require 'smartparens nil 'noerror)
    (require 'smartparens-config)
    (smartparens-global-mode))

  ;; Load Undo-Tree
  (require 'undo-tree)

  ;; Load Linum+
  (require 'linum+)

  ;; Load full-ack
  (require 'full-ack)

  ;; load go-projectile
  (require 'go-projectile nil 'noerror)

  ;; Load yasnippet
  (when (require 'yasnippet nil 'noerror)
    (yas/global-mode t))

  ;; Load zencoding-mode in any markup modes
  (when (require 'zencoding-mode nil 'noerror)
    (add-hook 'sgml-mode-hook 'zencoding-mode)))


;;
;; Package helpers (borrowed from Emacs Prelude)
;;

(defun my-melpa-packages-installed-p ()
  "Check if all packages in `my-melpa-packages' are installed."
  (every #'package-installed-p my-melpa-packages))

(defun require-my-melpa-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package my-melpa-packages)
    (add-to-list 'my-melpa-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun require-my-melpa-packages (packages)
  "Ensure PACKAGES are installed.
Missing packages are installed automatically."
  (mapc #'require-my-melpa-package packages))

(defun install-my-melpa-packages ()
  "Install all packages listed in `my-melpa-packages'."
  (unless (my-melpa-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (require-my-melpa-packages my-melpa-packages)))


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
