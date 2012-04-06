;;
;; Load Package
;;

(require 'package)
(setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") package-archives))
(package-initialize)


;;
;; Load el-get
;;

(add-to-list 'load-path (config-path "el-get/el-get"))
(require 'el-get)

;;; Uses 2.stable branch, doesn't work with some of my stuff
;; (unless (require 'el-get nil t)
;;   (url-retrieve
;;    "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
;;    (lambda (s)
;;      (end-of-buffer)
;;      (eval-print-last-sexp))))


;;
;; el-get Sources
;;

(setq el-get-sources
      '((:name birds-of-paradise-plus-theme
               :type git
               :url "git://github.com/jimeh/birds-of-paradise-plus-theme.el.git"
               :post-init (lambda ()
                            (push (config-path "el-get/birds-of-paradise-plus-theme")
                                  custom-theme-load-path)))
        ;; (:name birds-of-paradise-theme
        ;;        :type git
        ;;        :url "https://gist.github.com/1130343.git"
        ;;        :load    "birds-of-paradise-theme.el")
        (:name eproject
               :type git
               :url "https://github.com/jrockway/eproject.git"
               :post-init (lambda ()
                            (require 'eproject)
                            (require 'eproject-extras)))
        (:name escreen
               :description "Emacs window session manager"
               :type git
               :url "git://github.com/renard/escreen-el.git"
               :post-init (lambda ()
                            (autoload 'escreen-install "escreen" nil t)))

        (:name feature-mode
               :type git
               :url "git://github.com/michaelklishin/cucumber.el.git")
        (:name flymake-cursor
               :type emacswiki
               :features flymake-cursor)
        (:name flymake-elisp
               :type git
               :url "git://gist.github.com/1130849.git")
        (:name flymake-ruby
               :type git
               :url "git://github.com/purcell/flymake-ruby.git"
               :features flymake-ruby
               :post-init (lambda ()
                            (add-hook 'ruby-mode-hook 'flymake-ruby-load)))
        ;; (:name flymake-coffee
        ;;        :type git
        ;;        :url "git://github.com/purcell/flymake-coffee.git"
        ;;        :features flymake-coffee
        ;;        :post-init (lambda ()
        ;;                     (add-hook 'coffee-mode-hook 'flymake-coffee-load)))
        (:name fill-column-indicator
               :type git
               :url "git://github.com/alpaker/Fill-Column-Indicator.git"
               :features fill-column-indicator)
        (:name fuzzy
               :website "https://github.com/m2ym/fuzzy-el"
               :description "Fuzzy matching utilities for GNU Emacs"
               :type git
               :url "https://github.com/m2ym/fuzzy-el.git"
               :features fuzzy)
        (:name hackertype
               :type git
               :url "https://github.com/bitemyapp/hacker-type-emacs.git"
               :load "hackertype.el")
        (:name linum+
               :type http
               :url "http://dea.googlecode.com/svn/trunk/my-lisps/linum+.el")
        (:name rsense
               :type git
               :url "https://github.com/m2ym/rsense.git"
               :build ("ant" "chmod +x bin/rsense")
               :post-init (lambda ()
                            (setq rsense-home (expand-file-name (config-path "el-get/rsense")))
                            (add-to-list 'load-path (concat rsense-home "/etc"))
                            (require 'rsense)))
        (:name ruby-mode
               :type svn
               :url "http://svn.ruby-lang.org/repos/ruby/trunk/misc/")
        (:name tiling
               :type emacswiki
               :features tiling)
        (:name tomorrow-theme
               :description "Emacs highlighting using Chris Charles's Tomorrow color scheme"
               :type git
               :url "https://github.com/chriskempson/tomorrow-theme.git"
               :load-path "GNU Emacs"
               :post-init (lambda ()
                            (push (config-path "el-get/tomorrow-theme/GNU Emacs")
                                  custom-theme-load-path)))
        (:name tomorrow-night-paradise-theme
               :description "My customized version of Chris Kempson's Tomorrow Night Bright theme."
               :type git
               :url "git://github.com/jimeh/tomorrow-night-paradise-theme.el.git"
               :post-init (lambda ()
                            (push (config-path "el-get/tomorrow-night-paradise-theme")
                                  custom-theme-load-path)))
        (:name yasnippet
               :type git
               :url "https://github.com/capitaomorte/yasnippet.git")))


;;
;; My Packages
;;

(setq my-packages
      (append
       '(auto-complete
         auto-complete-emacs-lisp
         autopair
         coffee-mode
         ecb
         full-ack
         git-blame
         highlight-indentation
         inf-ruby
         magit
         magithub
         markdown-mode
         php-mode-improved
         ruby-mode
         ruby-compilation
         smart-tab
         textmate
         undo-tree
         yaml-mode
         yasnippet)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)

;;
;; Initialize Packages
;;

(defun initialize-packages ()
  ;; Activate ECB if window-system
  (when (require 'ecb nil 'noerror)
    (setq stack-trace-on-error t) ;; hack to fix a load-error
    (if window-system
        (ecb-activate)))

  ;; Load Auto-Complete and addons
  (when (require 'auto-complete nil 'noerror)
    (require 'auto-complete-emacs-lisp))

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
