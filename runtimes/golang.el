;;
;; Go setup
;;

(setq my-gopath (file-truename "~/.go"))
(setq my-gopath-bin (concat my-gopath "/bin"))

(setenv "GOPATH" my-gopath)
(setenv "PATH" (concat my-gopath-bin ":" (getenv "PATH")))
(setq exec-path (cons my-gopath-bin exec-path))
