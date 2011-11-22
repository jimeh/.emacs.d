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
      '((:name color-theme-birds-of-paradise-plus
               :type git
               :url "git://github.com/jimeh/birds-of-paradise-plus-theme.el.git")
        ;; (:name color-theme-birds-of-paradise
        ;;        :type git
        ;;        :url "https://gist.github.com/1130343.git"
        ;;        :load    "birds-of-paradise-theme.el")
        (:name dirtree
               :description "Directory tree views in Emacs"
               :type git
               :url "https://github.com/zkim/emacs-dirtree.git"
               :depends (tree-mode windata)
               :features dirtree)
        (:name eproject
               :type git
               :url "https://github.com/jrockway/eproject.git")
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
        (:name hackertype
               :type git
               :url "https://github.com/bitemyapp/hacker-type-emacs.git"
               :load "hackertype.el")
        (:name linum+
               :type http
               :url "http://dea.googlecode.com/svn/trunk/my-lisps/linum+.el")
        (:name ruby-mode
               :type svn
               :url "http://svn.ruby-lang.org/repos/ruby/trunk/misc/")
        (:name tree-mode
               :type emacswiki
               :features tree-mode)
        (:name yasnippet
               :type git
               :url "https://github.com/capitaomorte/yasnippet.git")
        (:name windata
               :type emacswiki
               :features windata)))


;;
;; My Packages
;;

(setq my-packages
      (append
       '(auto-complete
         auto-complete-emacs-lisp
         autopair
         coffee-mode
         color-theme-tomorrow
         ;; ecb
         escreen
         full-ack
         git-blame
         inf-ruby
         markdown-mode
         php-mode-improved
         ruby-mode
         ruby-compilation
         ;; smooth-scrolling
         ;; smooth-scroll
         textmate
         undo-tree
         yaml-mode
         yasnippet)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)


;;
;; Initialize Packages
;;

;; Activate ECB
;; (when (require 'ecb nil 'noerror)
;;   (setq stack-trace-on-error t)
;;   (ecb-activate))

;; Load and setup Escreen
(when (require 'escreen nil 'noerror)
  (escreen-install))

;; Load Undo-Tree
(require 'undo-tree)

;; Load Linum+
(if window-system ()
  (require 'linum+))

;; Load full-ack
(require 'full-ack)
