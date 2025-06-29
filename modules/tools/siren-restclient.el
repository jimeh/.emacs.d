;;; siren-restclient.el --- jimeh's Emacs Siren: restclient configuration.  -*- lexical-binding: nil; -*-

;;; Commentary:

;; Basic configuration for restclient.

;;; Code:

(require 'siren-json)
(require 'siren-web-mode)
(require 'siren-xml)
(require 'siren-yaml)

(use-package restclient
  :mode
  ("\\.restclient\\'" . restclient-mode)
  ("\\.rest\\'" . restclient-mode)

  :custom
  (restclient-content-type-modes
   '(("application/json" . json-mode)
     ("application/x-yaml" . yaml-mode)
     ("application/xml" . nxml-mode)
     ("application/yaml" . yaml-mode)
     ("image/gif" . image-mode)
     ("image/jpeg" . image-mode)
     ("image/jpg" . image-mode)
     ("image/png" . image-mode)
     ("text/html" . web-mode)
     ("text/plain" . text-mode)
     ("text/xml" . nxml-mode)
     ("text/yaml" . yaml-mode))))

(use-package restclient-helm
  :after restclient)

(provide 'siren-restclient)
;;; siren-restclient.el ends here
