(when (require 'eproject nil 'noerror)
  (define-project-type ruby (generic)
    (or (look-for "Rakefile") (look-for "Gemfile") (look-for "config.ru")
        (look-for "\.gemspec$") (look-for "Capfile"))
    :irrelevant-files ("^[#]" ".git/" "vendor/bundle/" "coverage/"
                       "\.DS_Store"))

  (define-project-type node-js (generic)
    (look-for "package.json")
    :irrelevant-files ("^[#]" ".git/" "node_modules"))

  (define-project-type coffeescript (node-js)
    (look-for "Cakefile"))
)
