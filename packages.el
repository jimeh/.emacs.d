;;
;; Load Package
;;

(require 'package)
(setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") package-archives))
(package-initialize)


;;
;; Load el-get
;;

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
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
      '((:name column-marker
               :type emacswiki
               :features column-marker)
        ;; (:name color-theme-birds-of-paradise
        ;;        :type git
        ;;        :url "https://gist.github.com/1130343.git"
        ;;        :load    "birds-of-paradise-theme.el")
        (:name color-theme-birds-of-paradise-plus
               :type git
               :url "git://github.com/jimeh/birds-of-paradise-plus-theme.el.git"
               :load "birds-of-paradise-plus-theme.el")
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
        (:name flymake-coffee
               :type git
               :url "git://github.com/purcell/flymake-coffee.git"
               :features flymake-coffee
               :post-init (lambda ()
                            (add-hook 'coffee-mode-hook 'flymake-coffee-load)))
        (:name fill-column-indicator
               :type git
               :url "git://github.com/alpaker/Fill-Column-Indicator.git"
               :features fill-column-indicator)
        (:name ruby-mode
               :type svn
               :url "http://svn.ruby-lang.org/repos/ruby/trunk/misc/")))


;;
;; My Packages
;;

(setq my-packages
      (append
       '(autopair
         coffee-mode
         egg
         elscreen
         full-ack
         git-blame
         inf-ruby
         markdown-mode
         php-mode-improved
         ruby-mode
         ruby-compilation
         rvm
         textmate
         undo-tree
         yaml-mode
         yasnippet)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)


;;
;; Initialize Packages
;;

;; Configure Yasnippet
(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")

;; Configure RVM
(rvm-use-default)

;; Load ElScreen
(require 'elscreen)

;; Load Undo-Tree
(require 'undo-tree)
