(when (require 'eproject nil 'noerror)
  (define-project-type ruby (generic)
    (or (look-for "Rakefile") (look-for "Gemfile") (look-for "config.ru")
        (look-for "\.gemspec$") (look-for "Capfile"))
    :irrelevant-files ("^[#]" ".git/" "vendor/" "coverage/" "doc/" "docs/"
                       "\.DS_Store"))

  (define-project-type node-js (generic)
    (or (look-for "package.json") (look-for "Cakefile"))
    :irrelevant-files ("^[#]" ".git/" "node_modules"))
)
