;; Load-path
(add-to-list 'load-path "~/.emacs.d/vendor")

;; Directory Sidebar
(require 'dirtree)
(autoload 'imenu-tree "imenu-tree" "Imenu tree" t)
(autoload 'tags-tree "tags-tree" "TAGS tree" t)