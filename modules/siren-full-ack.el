;;; siren-full-ack.el --- jimeh's Emacs Siren: full-ack configuration.

;;; Commentary:

;; Basic configuration for full-ack.

;;; Code:

(use-package full-ack
  :bind
  ("C-c C-a" . ack)

  :config
  (setq ack-arguments
        '("--sort-files"
          "--ignore-dir=vendor/ruby"
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
          "--type-set=cucumber=.feature"))
  (setq ack-project-root-file-patterns
        '(".project\\'"
          ".xcodeproj\\'"
          ".sln\\'"
          "\\`Project.ede\\'"
          "\\`.git\\'"
          "\\`.bzr\\'"
          "\\`_darcs\\'"
          "\\`.hg\\'"
          "\\`Gemfile\\'"
          "\\`Rakefile\\'"
          "\\`Makefile\\'"))
  (setq ack-prompt-for-directory 'unless-guessed))

(provide 'siren-full-ack)
;;; siren-full-ack.el ends here
