;;
;; full-ack
;;

(siren-require-packages '(full-ack))

(require 'full-ack)
(setq ack-arguments
      (quote ("--ignore-dir=vendor/ruby"
              "--ignore-dir=vendor/bundle"
              "--ignore-dir=coverage"
              "--ignore-dir=savefile"
              "--ignore-dir=Godeps"
              "--ignore-dir=elpa"
              "--ignore-dir=docs"
              "--ignore-dir=doc"
              "--type-add=js=.js,.js.erb"
              "--type-add=ruby=.jbuilder,.rabl"
              "--type-add=html=.haml,.hamlc,.jade"
              "--type-add=css=.sass,.scss,.styl"
              "--type-set=coffee=.coffee"
              "--type-set=cucumber=.feature")))
(setq ack-project-root-file-patterns
      (quote (".project\\'"
              ".xcodeproj\\'"
              ".sln\\'"
              "\\`Project.ede\\'"
              "\\`.git\\'"
              "\\`.bzr\\'"
              "\\`_darcs\\'"
              "\\`.hg\\'"
              "\\`Gemfile\\'"
              "\\`Rakefile\\'"
              "\\`Makefile\\'")))
(setq ack-prompt-for-directory 'unless-guessed)


(provide 'siren-full-ack)
