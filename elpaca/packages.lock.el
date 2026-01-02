((a :source "elpaca-menu-lock-file" :recipe
    (:package "a" :repo "plexus/a.el" :fetcher github :files
              ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
               "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
               "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
               "docs/*.texinfo"
               (:exclude ".dir-locals.el" "test.el" "tests.el"
                         "*-test.el" "*-tests.el" "LICENSE" "README*"
                         "*-pkg.el"))
              :source "elpaca-menu-lock-file" :protocol https :inherit
              t :depth treeless :ref
              "93e5ed8c495794d1ba3c04b43041b95ce01079b1"))
 (ace-window :source "elpaca-menu-lock-file" :recipe
             (:package "ace-window" :repo "abo-abo/ace-window"
                       :fetcher github :files
                       ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                        "*.texinfo" "doc/dir" "doc/*.info"
                        "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                        "docs/dir" "docs/*.info" "docs/*.texi"
                        "docs/*.texinfo"
                        (:exclude ".dir-locals.el" "test.el"
                                  "tests.el" "*-test.el" "*-tests.el"
                                  "LICENSE" "README*" "*-pkg.el"))
                       :source "elpaca-menu-lock-file" :protocol https
                       :inherit t :depth treeless :ref
                       "77115afc1b0b9f633084cf7479c767988106c196"))
 (aio :source "elpaca-menu-lock-file" :recipe
      (:package "aio" :fetcher github :repo "skeeto/emacs-aio" :files
                ("aio.el" "README.md" "UNLICENSE") :source
                "elpaca-menu-lock-file" :protocol https :inherit t
                :depth treeless :ref
                "58157e51e7eb7a4b954894ee4182564c507a2f01"))
 (anzu :source "elpaca-menu-lock-file" :recipe
       (:package "anzu" :fetcher github :repo "emacsorphanage/anzu"
                 :files
                 ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
                  "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
                  "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
                  "docs/*.texinfo"
                  (:exclude ".dir-locals.el" "test.el" "tests.el"
                            "*-test.el" "*-tests.el" "LICENSE"
                            "README*" "*-pkg.el"))
                 :source "elpaca-menu-lock-file" :protocol https
                 :inherit t :depth treeless :ref
                 "21cb5ab2295614372cb9f1a21429381e49a6255f"))
 (applescript-mode :source "elpaca-menu-lock-file" :recipe
                   (:package "applescript-mode" :fetcher github :repo
                             "emacsorphanage/applescript-mode" :files
                             ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                              "*.texinfo" "doc/dir" "doc/*.info"
                              "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                              "docs/dir" "docs/*.info" "docs/*.texi"
                              "docs/*.texinfo"
                              (:exclude ".dir-locals.el" "test.el"
                                        "tests.el" "*-test.el"
                                        "*-tests.el" "LICENSE"
                                        "README*" "*-pkg.el"))
                             :source "elpaca-menu-lock-file" :protocol
                             https :inherit t :depth treeless :ref
                             "82e5c35d0de9c8db6281aed21105f09acbb69eba"))
 (async :source "elpaca-menu-lock-file" :recipe
        (:package "async" :repo "jwiegley/emacs-async" :fetcher github
                  :files
                  ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                   "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                   "doc/*.texinfo" "lisp/*.el" "docs/dir"
                   "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                   (:exclude ".dir-locals.el" "test.el" "tests.el"
                             "*-test.el" "*-tests.el" "LICENSE"
                             "README*" "*-pkg.el"))
                  :source "elpaca-menu-lock-file" :protocol https
                  :inherit t :depth treeless :ref
                  "31cb2fea8f4bc7a593acd76187a89075d8075500"))
 (avy :source "elpaca-menu-lock-file" :recipe
      (:package "avy" :repo "abo-abo/avy" :fetcher github :files
                ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
                 "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
                 "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
                 "docs/*.texinfo"
                 (:exclude ".dir-locals.el" "test.el" "tests.el"
                           "*-test.el" "*-tests.el" "LICENSE"
                           "README*" "*-pkg.el"))
                :source "elpaca-menu-lock-file" :protocol https
                :inherit t :depth treeless :ref
                "933d1f36cca0f71e4acb5fac707e9ae26c536264"))
 (beginend :source "elpaca-menu-lock-file" :recipe
           (:package "beginend" :fetcher github :repo
                     "DamienCassou/beginend" :files
                     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                      "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                      "doc/*.texinfo" "lisp/*.el" "docs/dir"
                      "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                      (:exclude ".dir-locals.el" "test.el" "tests.el"
                                "*-test.el" "*-tests.el" "LICENSE"
                                "README*" "*-pkg.el"))
                     :source "elpaca-menu-lock-file" :protocol https
                     :inherit t :depth treeless :ref
                     "26d6142ceaf7c58705281852410b61ddc0d780ee"))
 (better-jumper :source "elpaca-menu-lock-file" :recipe
                (:package "better-jumper" :repo
                          "gilbertw1/better-jumper" :fetcher github
                          :files
                          ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                           "*.texinfo" "doc/dir" "doc/*.info"
                           "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                           "docs/dir" "docs/*.info" "docs/*.texi"
                           "docs/*.texinfo"
                           (:exclude ".dir-locals.el" "test.el"
                                     "tests.el" "*-test.el"
                                     "*-tests.el" "LICENSE" "README*"
                                     "*-pkg.el"))
                          :source "elpaca-menu-lock-file" :protocol
                          https :inherit t :depth treeless :ref
                          "b1bf7a3c8cb820d942a0305e0e6412ef369f819c"))
 (bui :source "elpaca-menu-lock-file" :recipe
      (:package "bui" :repo "alezost/bui.el" :fetcher github :files
                ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
                 "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
                 "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
                 "docs/*.texinfo"
                 (:exclude ".dir-locals.el" "test.el" "tests.el"
                           "*-test.el" "*-tests.el" "LICENSE"
                           "README*" "*-pkg.el"))
                :source "elpaca-menu-lock-file" :protocol https
                :inherit t :depth treeless :ref
                "f3a137628e112a91910fd33c0cff0948fa58d470"))
 (bundler :source "elpaca-menu-lock-file" :recipe
          (:source "elpaca-menu-lock-file" :protocol https :inherit t
                   :depth treeless :host github :repo
                   "tobiassvn/bundler.el" :package "bundler" :ref
                   "43efb6be4ed118b06d787ce7fbcffd68a31732a7"))
 (caddyfile-mode :source "elpaca-menu-lock-file" :recipe
                 (:package "caddyfile-mode" :fetcher github :repo
                           "Schnouki/caddyfile-mode" :files
                           ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                            "*.texinfo" "doc/dir" "doc/*.info"
                            "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                            "docs/dir" "docs/*.info" "docs/*.texi"
                            "docs/*.texinfo"
                            (:exclude ".dir-locals.el" "test.el"
                                      "tests.el" "*-test.el"
                                      "*-tests.el" "LICENSE" "README*"
                                      "*-pkg.el"))
                           :source "elpaca-menu-lock-file" :protocol
                           https :inherit t :depth treeless :ref
                           "fc41148f5a7eb320f070666f046fb9d88cf17680"))
 (cape :source "elpaca-menu-lock-file" :recipe
       (:package "cape" :repo "minad/cape" :fetcher github :files
                 ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
                  "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
                  "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
                  "docs/*.texinfo"
                  (:exclude ".dir-locals.el" "test.el" "tests.el"
                            "*-test.el" "*-tests.el" "LICENSE"
                            "README*" "*-pkg.el"))
                 :source "elpaca-menu-lock-file" :protocol https
                 :inherit t :depth treeless :ref
                 "93694ae3c1862bd835195669a55a3c817a8e7c58"))
 (cargo :source "elpaca-menu-lock-file" :recipe
        (:package "cargo" :repo "kwrooijen/cargo.el" :fetcher github
                  :files
                  ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                   "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                   "doc/*.texinfo" "lisp/*.el" "docs/dir"
                   "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                   (:exclude ".dir-locals.el" "test.el" "tests.el"
                             "*-test.el" "*-tests.el" "LICENSE"
                             "README*" "*-pkg.el"))
                  :source "elpaca-menu-lock-file" :protocol https
                  :inherit t :depth treeless :ref
                  "7f8466063381eed05d4e222ce822b1dd44e3bf17"))
 (cargo-transient :source "elpaca-menu-lock-file" :recipe
                  (:package "cargo-transient" :repo
                            "peterstuart/cargo-transient" :fetcher
                            github :files
                            ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                             "*.texinfo" "doc/dir" "doc/*.info"
                             "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                             "docs/dir" "docs/*.info" "docs/*.texi"
                             "docs/*.texinfo"
                             (:exclude ".dir-locals.el" "test.el"
                                       "tests.el" "*-test.el"
                                       "*-tests.el" "LICENSE"
                                       "README*" "*-pkg.el"))
                            :source "elpaca-menu-lock-file" :protocol
                            https :inherit t :depth treeless :ref
                            "6110489e8ea22f2f85976260f8ded201c00c01e3"))
 (centaur-tabs :source "elpaca-menu-lock-file" :recipe
               (:package "centaur-tabs" :repo "ema2159/centaur-tabs"
                         :fetcher github :files
                         ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                          "*.texinfo" "doc/dir" "doc/*.info"
                          "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                          "docs/dir" "docs/*.info" "docs/*.texi"
                          "docs/*.texinfo"
                          (:exclude ".dir-locals.el" "test.el"
                                    "tests.el" "*-test.el"
                                    "*-tests.el" "LICENSE" "README*"
                                    "*-pkg.el"))
                         :source "elpaca-menu-lock-file" :protocol
                         https :inherit t :depth treeless :ref
                         "7e8fe031a49eec56decb0af8cd160f5acef42da9"))
 (cfrs :source "elpaca-menu-lock-file" :recipe
       (:package "cfrs" :repo "Alexander-Miller/cfrs" :fetcher github
                 :files
                 ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
                  "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
                  "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
                  "docs/*.texinfo"
                  (:exclude ".dir-locals.el" "test.el" "tests.el"
                            "*-test.el" "*-tests.el" "LICENSE"
                            "README*" "*-pkg.el"))
                 :source "elpaca-menu-lock-file" :protocol https
                 :inherit t :depth treeless :ref
                 "981bddb3fb9fd9c58aed182e352975bd10ad74c8"))
 (chatgpt-shell :source "elpaca-menu-lock-file" :recipe
                (:package "chatgpt-shell" :fetcher github :repo
                          "xenodium/chatgpt-shell" :files
                          ("*.el"
                           (:exclude "test_chatgpt-shell.el"
                                     "shell-maker.el"
                                     "ob-chatgpt-shell.el"
                                     "dall-e-shell.el"
                                     "ob-dall-e-shell.el"))
                          :source "elpaca-menu-lock-file" :protocol
                          https :inherit t :depth treeless :ref
                          "e240b1a9004c1452b8bcb5279b4fa79d9f60def7"))
 (closql :source "elpaca-menu-lock-file" :recipe
         (:package "closql" :fetcher github :repo "magit/closql"
                   :files
                   ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                    "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                    "doc/*.texinfo" "lisp/*.el" "docs/dir"
                    "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                    (:exclude ".dir-locals.el" "test.el" "tests.el"
                              "*-test.el" "*-tests.el" "LICENSE"
                              "README*" "*-pkg.el"))
                   :source "elpaca-menu-lock-file" :protocol https
                   :inherit t :depth treeless :ref
                   "26fe3a53e675c6d7d9d3ddd751a3eec603f25681"))
 (code-review :source "elpaca-menu-lock-file" :recipe
              (:package "code-review" :repo
                        "wandersoncferreira/code-review" :fetcher
                        github :files
                        ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                         "*.texinfo" "doc/dir" "doc/*.info"
                         "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                         "docs/dir" "docs/*.info" "docs/*.texi"
                         "docs/*.texinfo"
                         (:exclude ".dir-locals.el" "test.el"
                                   "tests.el" "*-test.el" "*-tests.el"
                                   "LICENSE" "README*" "*-pkg.el"))
                        :source "elpaca-menu-lock-file" :protocol
                        https :inherit t :depth treeless :ref
                        "26f426e99221a1f9356aabf874513e9105b68140"))
 (coffee-mode :source "elpaca-menu-lock-file" :recipe
              (:package "coffee-mode" :repo "defunkt/coffee-mode"
                        :fetcher github :files
                        ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                         "*.texinfo" "doc/dir" "doc/*.info"
                         "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                         "docs/dir" "docs/*.info" "docs/*.texi"
                         "docs/*.texinfo"
                         (:exclude ".dir-locals.el" "test.el"
                                   "tests.el" "*-test.el" "*-tests.el"
                                   "LICENSE" "README*" "*-pkg.el"))
                        :source "elpaca-menu-lock-file" :protocol
                        https :inherit t :depth treeless :ref
                        "1c6adeae14f3795d3b1e44321189ed7c2c93c967"))
 (company :source "elpaca-menu-lock-file" :recipe
          (:package "company" :fetcher github :repo
                    "company-mode/company-mode" :files
                    (:defaults "icons"
                               ("images/small"
                                "doc/images/small/*.png"))
                    :source "elpaca-menu-lock-file" :protocol https
                    :inherit t :depth treeless :ref
                    "4ff89f7369227fbb89fe721d1db707f1af74cd0f"))
 (company-box :source "elpaca-menu-lock-file" :recipe
              (:package "company-box" :fetcher github :repo
                        "sebastiencs/company-box" :files
                        (:defaults "images") :source
                        "elpaca-menu-lock-file" :protocol https
                        :inherit t :depth treeless :ref
                        "c4f2e243fba03c11e46b1600b124e036f2be7691"))
 (cond-let :source "elpaca-menu-lock-file" :recipe
           (:package "cond-let" :fetcher github :repo
                     "tarsius/cond-let" :files
                     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                      "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                      "doc/*.texinfo" "lisp/*.el" "docs/dir"
                      "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                      (:exclude ".dir-locals.el" "test.el" "tests.el"
                                "*-test.el" "*-tests.el" "LICENSE"
                                "README*" "*-pkg.el"))
                     :source "elpaca-menu-lock-file" :protocol https
                     :inherit t :depth treeless :ref
                     "8f1661fc9f49cae699948992411d921216ddd4c0"))
 (consult :source "elpaca-menu-lock-file" :recipe
          (:package "consult" :repo "minad/consult" :fetcher github
                    :files
                    ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                     "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                     "doc/*.texinfo" "lisp/*.el" "docs/dir"
                     "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                     (:exclude ".dir-locals.el" "test.el" "tests.el"
                               "*-test.el" "*-tests.el" "LICENSE"
                               "README*" "*-pkg.el"))
                    :source "elpaca-menu-lock-file" :protocol https
                    :inherit t :depth treeless :ref
                    "1de751087e348b24c05e0b1dca16ced752e8f505"))
 (consult-dir :source "elpaca-menu-lock-file" :recipe
              (:package "consult-dir" :fetcher github :repo
                        "karthink/consult-dir" :files
                        ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                         "*.texinfo" "doc/dir" "doc/*.info"
                         "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                         "docs/dir" "docs/*.info" "docs/*.texi"
                         "docs/*.texinfo"
                         (:exclude ".dir-locals.el" "test.el"
                                   "tests.el" "*-test.el" "*-tests.el"
                                   "LICENSE" "README*" "*-pkg.el"))
                        :source "elpaca-menu-lock-file" :protocol
                        https :inherit t :depth treeless :ref
                        "1497b46d6f48da2d884296a1297e5ace1e050eb5"))
 (consult-lsp :source "elpaca-menu-lock-file" :recipe
              (:package "consult-lsp" :fetcher github :repo
                        "gagbo/consult-lsp" :files
                        ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                         "*.texinfo" "doc/dir" "doc/*.info"
                         "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                         "docs/dir" "docs/*.info" "docs/*.texi"
                         "docs/*.texinfo"
                         (:exclude ".dir-locals.el" "test.el"
                                   "tests.el" "*-test.el" "*-tests.el"
                                   "LICENSE" "README*" "*-pkg.el"))
                        :source "elpaca-menu-lock-file" :protocol
                        https :inherit t :depth treeless :ref
                        "d11102c9db33c4ca7817296a2edafc3e26a61117"))
 (conventional-commit :source "elpaca-menu-lock-file" :recipe
                      (:source "elpaca-menu-lock-file" :protocol https
                               :inherit t :depth treeless :host github
                               :repo "akirak/conventional-commit.el"
                               :package "conventional-commit" :ref
                               "0742ca982567b1180d28d0f1e196bdf53a632fd0"))
 (copilot :source "elpaca-menu-lock-file" :recipe
          (:package "copilot" :fetcher github :repo
                    "copilot-emacs/copilot.el" :files ("dist" "*.el")
                    :source "elpaca-menu-lock-file" :protocol https
                    :inherit t :depth treeless :host github :ref
                    "7ee4758bb748beac7d29e62de5d2e752ebafb858"))
 (csv-mode :source "elpaca-menu-lock-file" :recipe
           (:package "csv-mode" :repo
                     ("https://github.com/emacsmirror/gnu_elpa"
                      . "csv-mode")
                     :branch "externals/csv-mode" :files
                     ("*" (:exclude ".git")) :source
                     "elpaca-menu-lock-file" :protocol https :inherit
                     t :depth treeless :ref
                     "ba5dc934b9dbdc2b57ab1917a669cdfd7d1838d3"))
 (cycle-quotes :source "elpaca-menu-lock-file" :recipe
               (:package "cycle-quotes" :repo
                         ("https://github.com/emacsmirror/gnu_elpa"
                          . "cycle-quotes")
                         :branch "externals/cycle-quotes" :files
                         ("*" (:exclude ".git")) :source
                         "elpaca-menu-lock-file" :protocol https
                         :inherit t :depth treeless :ref
                         "c1ef993f8c66fec71b10d70eb7a2cd0c416aaa12"))
 (dall-e-shell :source "elpaca-menu-lock-file" :recipe
               (:package "dall-e-shell" :fetcher github :repo
                         "xenodium/dall-e-shell" :files
                         ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                          "*.texinfo" "doc/dir" "doc/*.info"
                          "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                          "docs/dir" "docs/*.info" "docs/*.texi"
                          "docs/*.texinfo"
                          (:exclude ".dir-locals.el" "test.el"
                                    "tests.el" "*-test.el"
                                    "*-tests.el" "LICENSE" "README*"
                                    "*-pkg.el"))
                         :source "elpaca-menu-lock-file" :protocol
                         https :inherit t :depth treeless :ref
                         "428125f9fa8578703a9ca85d173b2cc9a3eb16b9"))
 (dap-mode :source "elpaca-menu-lock-file" :recipe
           (:package "dap-mode" :repo "emacs-lsp/dap-mode" :fetcher
                     github :files (:defaults "icons") :source
                     "elpaca-menu-lock-file" :protocol https :inherit
                     t :depth treeless :ref
                     "f63a301f585bcf0ab334551fc323ce06178673d0"))
 (dart-mode :source "elpaca-menu-lock-file" :recipe
            (:package "dart-mode" :fetcher github :repo
                      "emacsorphanage/dart-mode" :files
                      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                       "doc/*.texinfo" "lisp/*.el" "docs/dir"
                       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                       (:exclude ".dir-locals.el" "test.el" "tests.el"
                                 "*-test.el" "*-tests.el" "LICENSE"
                                 "README*" "*-pkg.el"))
                      :source "elpaca-menu-lock-file" :protocol https
                      :inherit t :depth treeless :ref
                      "773e9ebc74a258af2db395b01febfb652a42f3ab"))
 (dash :source "elpaca-menu-lock-file" :recipe
       (:package "dash" :fetcher github :repo "magnars/dash.el" :files
                 ("dash.el" "dash.texi") :source
                 "elpaca-menu-lock-file" :protocol https :inherit t
                 :depth treeless :ref
                 "fb443e7a6e660ba849cafcd01021d9aac3ac6764"))
 (dash-at-point :source "elpaca-menu-lock-file" :recipe
                (:package "dash-at-point" :fetcher github :repo
                          "stanaka/dash-at-point" :files
                          ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                           "*.texinfo" "doc/dir" "doc/*.info"
                           "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                           "docs/dir" "docs/*.info" "docs/*.texi"
                           "docs/*.texinfo"
                           (:exclude ".dir-locals.el" "test.el"
                                     "tests.el" "*-test.el"
                                     "*-tests.el" "LICENSE" "README*"
                                     "*-pkg.el"))
                          :source "elpaca-menu-lock-file" :protocol
                          https :inherit t :depth treeless :ref
                          "fba1a6f42ea51d05110e12c62bdced664059eb55"))
 (deferred :source "elpaca-menu-lock-file" :recipe
           (:package "deferred" :repo "kiwanami/emacs-deferred"
                     :fetcher github :files ("deferred.el") :source
                     "elpaca-menu-lock-file" :protocol https :inherit
                     t :depth treeless :ref
                     "2239671d94b38d92e9b28d4e12fd79814cfb9c16"))
 (deflate :source "elpaca-menu-lock-file" :recipe
          (:package "deflate" :fetcher github :repo "skuro/deflate"
                    :files
                    ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                     "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                     "doc/*.texinfo" "lisp/*.el" "docs/dir"
                     "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                     (:exclude ".dir-locals.el" "test.el" "tests.el"
                               "*-test.el" "*-tests.el" "LICENSE"
                               "README*" "*-pkg.el"))
                    :source "elpaca-menu-lock-file" :protocol https
                    :inherit t :depth treeless :ref
                    "d3863855d213f73dc7a1a54736d94a75f8f7e9c5"))
 (diff-hl :source "elpaca-menu-lock-file" :recipe
          (:package "diff-hl" :fetcher github :repo "dgutov/diff-hl"
                    :files
                    ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                     "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                     "doc/*.texinfo" "lisp/*.el" "docs/dir"
                     "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                     (:exclude ".dir-locals.el" "test.el" "tests.el"
                               "*-test.el" "*-tests.el" "LICENSE"
                               "README*" "*-pkg.el"))
                    :source "elpaca-menu-lock-file" :protocol https
                    :inherit t :depth treeless :ref
                    "e79aa49ad3cbbe85379cf6646db3aaacd3b04708"))
 (dired+ :source "elpaca-menu-lock-file" :recipe
         (:source "elpaca-menu-lock-file" :protocol https :inherit t
                  :depth treeless :host github :repo
                  "emacsmirror/dired-plus" :package "dired+" :ref
                  "bc49d6283f89b80d32bdb47d52ff6c3302b61564"))
 (dired-hacks-utils :source "elpaca-menu-lock-file" :recipe
                    (:package "dired-hacks-utils" :fetcher github
                              :repo "Fuco1/dired-hacks" :files
                              ("dired-hacks-utils.el") :source
                              "elpaca-menu-lock-file" :protocol https
                              :inherit t :depth treeless :ref
                              "de9336f4b47ef901799fe95315fa080fa6d77b48"))
 (dired-narrow :source "elpaca-menu-lock-file" :recipe
               (:package "dired-narrow" :fetcher github :repo
                         "Fuco1/dired-hacks" :files
                         ("dired-narrow.el") :source
                         "elpaca-menu-lock-file" :protocol https
                         :inherit t :depth treeless :ref
                         "de9336f4b47ef901799fe95315fa080fa6d77b48"))
 (dired-subtree :source "elpaca-menu-lock-file" :recipe
                (:package "dired-subtree" :fetcher github :repo
                          "Fuco1/dired-hacks" :files
                          ("dired-subtree.el") :source
                          "elpaca-menu-lock-file" :protocol https
                          :inherit t :depth treeless :ref
                          "de9336f4b47ef901799fe95315fa080fa6d77b48"))
 (dirvish :source "elpaca-menu-lock-file" :recipe
          (:package "dirvish" :fetcher github :repo
                    "alexluigit/dirvish" :files
                    (:defaults "extensions/*.el") :source
                    "elpaca-menu-lock-file" :protocol https :inherit t
                    :depth treeless :ref
                    "d877433f957a363ad78b228e13a8e5215f2d6593"))
 (docker :source "elpaca-menu-lock-file" :recipe
         (:package "docker" :fetcher github :repo "Silex/docker.el"
                   :files
                   ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                    "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                    "doc/*.texinfo" "lisp/*.el" "docs/dir"
                    "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                    (:exclude ".dir-locals.el" "test.el" "tests.el"
                              "*-test.el" "*-tests.el" "LICENSE"
                              "README*" "*-pkg.el"))
                   :source "elpaca-menu-lock-file" :protocol https
                   :inherit t :depth treeless :ref
                   "375e0ed45bb1edc655d9ae2943a09864bec1fcba"))
 (dockerfile-mode :source "elpaca-menu-lock-file" :recipe
                  (:package "dockerfile-mode" :fetcher github :repo
                            "spotify/dockerfile-mode" :files
                            ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                             "*.texinfo" "doc/dir" "doc/*.info"
                             "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                             "docs/dir" "docs/*.info" "docs/*.texi"
                             "docs/*.texinfo"
                             (:exclude ".dir-locals.el" "test.el"
                                       "tests.el" "*-test.el"
                                       "*-tests.el" "LICENSE"
                                       "README*" "*-pkg.el"))
                            :source "elpaca-menu-lock-file" :protocol
                            https :inherit t :depth treeless :ref
                            "97733ce074b1252c1270fd5e8a53d178b66668ed"))
 (doom-modeline :source "elpaca-menu-lock-file" :recipe
                (:package "doom-modeline" :repo
                          "seagle0128/doom-modeline" :fetcher github
                          :files
                          ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                           "*.texinfo" "doc/dir" "doc/*.info"
                           "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                           "docs/dir" "docs/*.info" "docs/*.texi"
                           "docs/*.texinfo"
                           (:exclude ".dir-locals.el" "test.el"
                                     "tests.el" "*-test.el"
                                     "*-tests.el" "LICENSE" "README*"
                                     "*-pkg.el"))
                          :source "elpaca-menu-lock-file" :protocol
                          https :inherit t :depth treeless :ref
                          "be2b402856ea6717b2c74b140ce55f638d398ee7"))
 (doom-themes :source "elpaca-menu-lock-file" :recipe
              (:package "doom-themes" :fetcher github :repo
                        "doomemacs/themes" :files
                        (:defaults "themes/*.el" "themes/*/*.el"
                                   "extensions/*.el")
                        :source "elpaca-menu-lock-file" :protocol
                        https :inherit t :depth treeless :ref
                        "ad9b1bd1c21e25f044a4d2c3db41734666b00d16"))
 (dumb-jump :source "elpaca-menu-lock-file" :recipe
            (:package "dumb-jump" :repo "jacktasia/dumb-jump" :fetcher
                      github :files
                      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                       "doc/*.texinfo" "lisp/*.el" "docs/dir"
                       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                       (:exclude ".dir-locals.el" "test.el" "tests.el"
                                 "*-test.el" "*-tests.el" "LICENSE"
                                 "README*" "*-pkg.el"))
                      :source "elpaca-menu-lock-file" :protocol https
                      :inherit t :depth treeless :ref
                      "0632bdb4186cb0b58199679bfa5e64a5b409be22"))
 (easysession :source "elpaca-menu-lock-file" :recipe
              (:package "easysession" :fetcher github :repo
                        "jamescherti/easysession.el" :files
                        (:defaults "extensions/easysession*.el")
                        :source "elpaca-menu-lock-file" :protocol
                        https :inherit t :depth treeless :ref
                        "0638156ef0c19892e07f2e41fc827077d0cea3f4"))
 (edit-indirect :source "elpaca-menu-lock-file" :recipe
                (:package "edit-indirect" :fetcher github :repo
                          "Fanael/edit-indirect" :files
                          ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                           "*.texinfo" "doc/dir" "doc/*.info"
                           "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                           "docs/dir" "docs/*.info" "docs/*.texi"
                           "docs/*.texinfo"
                           (:exclude ".dir-locals.el" "test.el"
                                     "tests.el" "*-test.el"
                                     "*-tests.el" "LICENSE" "README*"
                                     "*-pkg.el"))
                          :source "elpaca-menu-lock-file" :protocol
                          https :inherit t :depth treeless :ref
                          "82a28d8a85277cfe453af464603ea330eae41c05"))
 (editorconfig :source "elpaca-menu-lock-file" :recipe
               (:package "editorconfig" :fetcher github :repo
                         "editorconfig/editorconfig-emacs" :old-names
                         (editorconfig-core editorconfig-fnmatch)
                         :files
                         ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                          "*.texinfo" "doc/dir" "doc/*.info"
                          "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                          "docs/dir" "docs/*.info" "docs/*.texi"
                          "docs/*.texinfo"
                          (:exclude ".dir-locals.el" "test.el"
                                    "tests.el" "*-test.el"
                                    "*-tests.el" "LICENSE" "README*"
                                    "*-pkg.el"))
                         :source "elpaca-menu-lock-file" :protocol
                         https :inherit t :depth treeless :ref
                         "646c31b4b7b0bd8805cf2914239ac9aa1cd6d962"))
 (elisp-refs :source "elpaca-menu-lock-file" :recipe
             (:package "elisp-refs" :repo "Wilfred/elisp-refs"
                       :fetcher github :files
                       (:defaults (:exclude "elisp-refs-bench.el"))
                       :source "elpaca-menu-lock-file" :protocol https
                       :inherit t :depth treeless :ref
                       "541a064c3ce27867872cf708354a65d83baf2a6d"))
 (elpaca :source
   "elpaca-menu-lock-file" :recipe
   (:source nil :protocol https :inherit ignore :depth 1 :repo
            "https://github.com/progfolio/elpaca.git" :ref
            "1508298c1ed19c81fa4ebc5d22d945322e9e4c52" :files
            (:defaults "elpaca-test.el" (:exclude "extensions"))
            :build (:not elpaca--activate-package) :package "elpaca"))
 (elpaca-use-package :source "elpaca-menu-lock-file" :recipe
                     (:package "elpaca-use-package" :wait t :repo
                               "https://github.com/progfolio/elpaca.git"
                               :files
                               ("extensions/elpaca-use-package.el")
                               :main
                               "extensions/elpaca-use-package.el"
                               :build (:not elpaca--compile-info)
                               :source "elpaca-menu-lock-file"
                               :protocol https :inherit t :depth
                               treeless :ref
                               "1508298c1ed19c81fa4ebc5d22d945322e9e4c52"))
 (emacsql :source "elpaca-menu-lock-file" :recipe
          (:package "emacsql" :fetcher github :repo "magit/emacsql"
                    :files (:defaults "README.md" "sqlite") :source
                    "elpaca-menu-lock-file" :protocol https :inherit t
                    :depth treeless :ref
                    "f6864fa3510e40e078df924a71d6cdfdfa23283c"))
 (embark :source "elpaca-menu-lock-file" :recipe
         (:package "embark" :repo "oantolin/embark" :fetcher github
                   :files ("embark.el" "embark-org.el" "embark.texi")
                   :source "elpaca-menu-lock-file" :protocol https
                   :inherit t :depth treeless :ref
                   "7b3b2fa239c34c2e304eab4367a4f5924c047e2b"))
 (embark-consult :source "elpaca-menu-lock-file" :recipe
                 (:package "embark-consult" :repo "oantolin/embark"
                           :fetcher github :files
                           ("embark-consult.el") :source
                           "elpaca-menu-lock-file" :protocol https
                           :inherit t :depth treeless :ref
                           "7b3b2fa239c34c2e304eab4367a4f5924c047e2b"))
 (emojify :source "elpaca-menu-lock-file" :recipe
          (:package "emojify" :fetcher github :repo
                    "iqbalansari/emacs-emojify" :files
                    (:defaults "data" "images") :source
                    "elpaca-menu-lock-file" :protocol https :inherit t
                    :depth treeless :ref
                    "1b726412f19896abf5e4857d4c32220e33400b55"))
 (envrc :source "elpaca-menu-lock-file" :recipe
        (:package "envrc" :fetcher github :repo "purcell/envrc" :files
                  ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                   "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                   "doc/*.texinfo" "lisp/*.el" "docs/dir"
                   "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                   (:exclude ".dir-locals.el" "test.el" "tests.el"
                             "*-test.el" "*-tests.el" "LICENSE"
                             "README*" "*-pkg.el"))
                  :source "elpaca-menu-lock-file" :protocol https
                  :inherit t :depth treeless :ref
                  "06d72d141ac2e2990d80cdb8bb84f6cb54c628a5"))
 (esxml :source "elpaca-menu-lock-file" :recipe
        (:package "esxml" :fetcher github :repo "tali713/esxml" :files
                  ("esxml.el" "esxml-query.el") :source
                  "elpaca-menu-lock-file" :protocol https :inherit t
                  :depth treeless :ref
                  "affada143fed7e2da08f2b3d927a027f26ad4a8f"))
 (exec-path-from-shell :source "elpaca-menu-lock-file" :recipe
                       (:package "exec-path-from-shell" :fetcher
                                 github :repo
                                 "purcell/exec-path-from-shell" :files
                                 ("*.el" "*.el.in" "dir" "*.info"
                                  "*.texi" "*.texinfo" "doc/dir"
                                  "doc/*.info" "doc/*.texi"
                                  "doc/*.texinfo" "lisp/*.el"
                                  "docs/dir" "docs/*.info"
                                  "docs/*.texi" "docs/*.texinfo"
                                  (:exclude ".dir-locals.el" "test.el"
                                            "tests.el" "*-test.el"
                                            "*-tests.el" "LICENSE"
                                            "README*" "*-pkg.el"))
                                 :source "elpaca-menu-lock-file"
                                 :protocol https :inherit t :depth
                                 treeless :ref
                                 "7552abf032a383ff761e7d90e6b5cbb4658a728a"))
 (expand-region :source "elpaca-menu-lock-file" :recipe
                (:package "expand-region" :repo
                          "magnars/expand-region.el" :fetcher github
                          :files
                          ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                           "*.texinfo" "doc/dir" "doc/*.info"
                           "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                           "docs/dir" "docs/*.info" "docs/*.texi"
                           "docs/*.texinfo"
                           (:exclude ".dir-locals.el" "test.el"
                                     "tests.el" "*-test.el"
                                     "*-tests.el" "LICENSE" "README*"
                                     "*-pkg.el"))
                          :source "elpaca-menu-lock-file" :protocol
                          https :inherit t :depth treeless :ref
                          "351279272330cae6cecea941b0033a8dd8bcc4e8"))
 (explain-pause-mode :source "elpaca-menu-lock-file" :recipe
                     (:source "elpaca-menu-lock-file" :protocol https
                              :inherit t :depth treeless :host github
                              :repo "lastquestion/explain-pause-mode"
                              :package "explain-pause-mode" :ref
                              "ac3eb69f36f345506aad05a6d9bc3ef80d26914b"))
 (f :source "elpaca-menu-lock-file" :recipe
    (:package "f" :fetcher github :repo "rejeep/f.el" :files
              ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
               "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
               "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
               "docs/*.texinfo"
               (:exclude ".dir-locals.el" "test.el" "tests.el"
                         "*-test.el" "*-tests.el" "LICENSE" "README*"
                         "*-pkg.el"))
              :source "elpaca-menu-lock-file" :protocol https :inherit
              t :depth treeless :ref
              "931b6d0667fe03e7bf1c6c282d6d8d7006143c52"))
 (feature-mode :source "elpaca-menu-lock-file" :recipe
               (:package "feature-mode" :fetcher github :repo
                         "freesteph/cucumber.el" :files
                         (:defaults "gherkin-languages.json"
                                    "snippets" "support")
                         :source "elpaca-menu-lock-file" :protocol
                         https :inherit t :depth treeless :ref
                         "8d43c37ddf986af769870da27c31c1911f35b205"))
 (flutter :source "elpaca-menu-lock-file" :recipe
          (:package "flutter" :repo "amake/flutter.el" :fetcher github
                    :files
                    ("flutter.el" "flutter-project.el"
                     "flutter-l10n.el")
                    :source "elpaca-menu-lock-file" :protocol https
                    :inherit t :depth treeless :ref
                    "e71235d400787d977da7ed792709437899c2a03c"))
 (flx :source "elpaca-menu-lock-file" :recipe
      (:package "flx" :repo "lewang/flx" :fetcher github :files
                ("flx.el") :source "elpaca-menu-lock-file" :protocol
                https :inherit t :depth treeless :ref
                "4b1346eb9a8a76ee9c9dede69738c63ad97ac5b6"))
 (flx-rs :source "elpaca-menu-lock-file" :recipe
         (:source "elpaca-menu-lock-file" :protocol https :inherit t
                  :depth treeless :repo "jcs-elpa/flx-rs" :fetcher
                  github :files (:defaults "bin") :package "flx-rs"
                  :ref "d11fd085aa98ab8a2bef554e23fe7449bb581d15"))
 (flycheck :source "elpaca-menu-lock-file" :recipe
           (:package "flycheck" :repo "flycheck/flycheck" :fetcher
                     github :files
                     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                      "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                      "doc/*.texinfo" "lisp/*.el" "docs/dir"
                      "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                      (:exclude ".dir-locals.el" "test.el" "tests.el"
                                "*-test.el" "*-tests.el" "LICENSE"
                                "README*" "*-pkg.el"))
                     :source "elpaca-menu-lock-file" :protocol https
                     :inherit t :depth treeless :ref
                     "5c24d1b732e86433f34ebf5ec7ca3c985edbc744"))
 (flycheck-package :source "elpaca-menu-lock-file" :recipe
                   (:package "flycheck-package" :fetcher github :repo
                             "purcell/flycheck-package" :files
                             ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                              "*.texinfo" "doc/dir" "doc/*.info"
                              "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                              "docs/dir" "docs/*.info" "docs/*.texi"
                              "docs/*.texinfo"
                              (:exclude ".dir-locals.el" "test.el"
                                        "tests.el" "*-test.el"
                                        "*-tests.el" "LICENSE"
                                        "README*" "*-pkg.el"))
                             :source "elpaca-menu-lock-file" :protocol
                             https :inherit t :depth treeless :ref
                             "a52e4e95f3151898b36739dfdb4a98b368626fc0"))
 (flycheck-rust :source "elpaca-menu-lock-file" :recipe
                (:package "flycheck-rust" :repo
                          "flycheck/flycheck-rust" :fetcher github
                          :files
                          ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                           "*.texinfo" "doc/dir" "doc/*.info"
                           "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                           "docs/dir" "docs/*.info" "docs/*.texi"
                           "docs/*.texinfo"
                           (:exclude ".dir-locals.el" "test.el"
                                     "tests.el" "*-test.el"
                                     "*-tests.el" "LICENSE" "README*"
                                     "*-pkg.el"))
                          :source "elpaca-menu-lock-file" :protocol
                          https :inherit t :depth treeless :ref
                          "b9db73a7a5980ca884d5dd0cbe79b3291a185972"))
 (flyspell-correct :source "elpaca-menu-lock-file" :recipe
                   (:package "flyspell-correct" :repo
                             "d12frosted/flyspell-correct" :fetcher
                             github :files
                             ("flyspell-correct.el"
                              "flyspell-correct-ido.el")
                             :source "elpaca-menu-lock-file" :protocol
                             https :inherit t :depth treeless :ref
                             "a5cc88cdee20624fb0989ae227d4499178bb2820"))
 (forge :source "elpaca-menu-lock-file" :recipe
        (:package "forge" :fetcher github :repo "magit/forge" :files
                  ("lisp/*.el" "docs/*.texi" ".dir-locals.el") :source
                  "elpaca-menu-lock-file" :protocol https :inherit t
                  :depth treeless :ref
                  "b66bb21f6ecfca132f29d9ac833561f6faf3b242"))
 (frame-local :source "elpaca-menu-lock-file" :recipe
              (:package "frame-local" :fetcher github :repo
                        "sebastiencs/frame-local" :files
                        ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                         "*.texinfo" "doc/dir" "doc/*.info"
                         "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                         "docs/dir" "docs/*.info" "docs/*.texi"
                         "docs/*.texinfo"
                         (:exclude ".dir-locals.el" "test.el"
                                   "tests.el" "*-test.el" "*-tests.el"
                                   "LICENSE" "README*" "*-pkg.el"))
                        :source "elpaca-menu-lock-file" :protocol
                        https :inherit t :depth treeless :ref
                        "7ee1106c3bcd4022f48421f8cb1ef4f995da816e"))
 (fussy :source "elpaca-menu-lock-file" :recipe
        (:package "fussy" :fetcher github :repo "jojojames/fussy"
                  :files
                  ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                   "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                   "doc/*.texinfo" "lisp/*.el" "docs/dir"
                   "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                   (:exclude ".dir-locals.el" "test.el" "tests.el"
                             "*-test.el" "*-tests.el" "LICENSE"
                             "README*" "*-pkg.el"))
                  :source "elpaca-menu-lock-file" :protocol https
                  :inherit t :depth treeless :ref
                  "163ded34be3e9230702201d0abe1e7b85e815c2d"))
 (gcmh :source "elpaca-menu-lock-file" :recipe
       (:package "gcmh" :repo "koral/gcmh" :fetcher gitlab :files
                 ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
                  "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
                  "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
                  "docs/*.texinfo"
                  (:exclude ".dir-locals.el" "test.el" "tests.el"
                            "*-test.el" "*-tests.el" "LICENSE"
                            "README*" "*-pkg.el"))
                 :source "elpaca-menu-lock-file" :protocol https
                 :inherit t :depth treeless :wait t :ref
                 "0089f9c3a6d4e9a310d0791cf6fa8f35642ecfd9"))
 (general :source "elpaca-menu-lock-file" :recipe
          (:package "general" :fetcher github :repo
                    "noctuid/general.el" :files
                    ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                     "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                     "doc/*.texinfo" "lisp/*.el" "docs/dir"
                     "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                     (:exclude ".dir-locals.el" "test.el" "tests.el"
                               "*-test.el" "*-tests.el" "LICENSE"
                               "README*" "*-pkg.el"))
                    :source "elpaca-menu-lock-file" :protocol https
                    :inherit t :depth treeless :wait t :ref
                    "a48768f85a655fe77b5f45c2880b420da1b1b9c3"))
 (gh-notify :source "elpaca-menu-lock-file" :recipe
            (:package "gh-notify" :fetcher github :repo
                      "anticomputer/gh-notify" :files
                      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                       "doc/*.texinfo" "lisp/*.el" "docs/dir"
                       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                       (:exclude ".dir-locals.el" "test.el" "tests.el"
                                 "*-test.el" "*-tests.el" "LICENSE"
                                 "README*" "*-pkg.el"))
                      :source "elpaca-menu-lock-file" :protocol https
                      :inherit t :depth treeless :ref
                      "d606d1390778cb104c28dbc5220e685293e1e687"))
 (ghub :source "elpaca-menu-lock-file" :recipe
       (:package "ghub" :fetcher github :repo "magit/ghub" :files
                 ("lisp/*.el" "docs/*.texi" ".dir-locals.el") :source
                 "elpaca-menu-lock-file" :protocol https :inherit t
                 :depth treeless :ref
                 "f9c2cc024faa095baf8b840f63cd6fd13a3117ac"))
 (git-commit-ts-mode :source "elpaca-menu-lock-file" :recipe
                     (:package "git-commit-ts-mode" :repo
                               "danilshvalov/git-commit-ts-mode"
                               :fetcher github :files
                               ("*.el" "*.el.in" "dir" "*.info"
                                "*.texi" "*.texinfo" "doc/dir"
                                "doc/*.info" "doc/*.texi"
                                "doc/*.texinfo" "lisp/*.el" "docs/dir"
                                "docs/*.info" "docs/*.texi"
                                "docs/*.texinfo"
                                (:exclude ".dir-locals.el" "test.el"
                                          "tests.el" "*-test.el"
                                          "*-tests.el" "LICENSE"
                                          "README*" "*-pkg.el"))
                               :source "elpaca-menu-lock-file"
                               :protocol https :inherit t :depth
                               treeless :ref
                               "6eb42a3c08c5c6a1a610d433b93590b88a71f63e"))
 (git-link :source "elpaca-menu-lock-file" :recipe
           (:package "git-link" :fetcher github :repo "sshaw/git-link"
                     :files
                     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                      "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                      "doc/*.texinfo" "lisp/*.el" "docs/dir"
                      "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                      (:exclude ".dir-locals.el" "test.el" "tests.el"
                                "*-test.el" "*-tests.el" "LICENSE"
                                "README*" "*-pkg.el"))
                     :source "elpaca-menu-lock-file" :protocol https
                     :inherit t :depth treeless :ref
                     "12caebc0982d3401a0b74ccddc2d5a651122de8a"))
 (git-modes :source "elpaca-menu-lock-file" :recipe
            (:package "git-modes" :fetcher github :repo
                      "magit/git-modes" :old-names
                      (gitattributes-mode gitconfig-mode
                                          gitignore-mode)
                      :files
                      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                       "doc/*.texinfo" "lisp/*.el" "docs/dir"
                       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                       (:exclude ".dir-locals.el" "test.el" "tests.el"
                                 "*-test.el" "*-tests.el" "LICENSE"
                                 "README*" "*-pkg.el"))
                      :source "elpaca-menu-lock-file" :protocol https
                      :inherit t :depth treeless :ref
                      "34b83f341464eb0fb53eecbc6199246623aab473"))
 (git-timemachine :source "elpaca-menu-lock-file" :recipe
                  (:package "git-timemachine" :fetcher codeberg :repo
                            "pidu/git-timemachine" :files
                            ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                             "*.texinfo" "doc/dir" "doc/*.info"
                             "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                             "docs/dir" "docs/*.info" "docs/*.texi"
                             "docs/*.texinfo"
                             (:exclude ".dir-locals.el" "test.el"
                                       "tests.el" "*-test.el"
                                       "*-tests.el" "LICENSE"
                                       "README*" "*-pkg.el"))
                            :source "elpaca-menu-lock-file" :protocol
                            https :inherit t :depth treeless :ref
                            "d1346a76122595aeeb7ebb292765841c6cfd417b"))
 (github-browse-file :source "elpaca-menu-lock-file" :recipe
                     (:package "github-browse-file" :fetcher github
                               :repo "emacsattic/github-browse-file"
                               :files
                               ("*.el" "*.el.in" "dir" "*.info"
                                "*.texi" "*.texinfo" "doc/dir"
                                "doc/*.info" "doc/*.texi"
                                "doc/*.texinfo" "lisp/*.el" "docs/dir"
                                "docs/*.info" "docs/*.texi"
                                "docs/*.texinfo"
                                (:exclude ".dir-locals.el" "test.el"
                                          "tests.el" "*-test.el"
                                          "*-tests.el" "LICENSE"
                                          "README*" "*-pkg.el"))
                               :source "elpaca-menu-lock-file"
                               :protocol https :inherit t :depth
                               treeless :ref
                               "9742a5183af853788c6ecb83fb7ee0b00d1675ac"))
 (github-review :source "elpaca-menu-lock-file" :recipe
                (:package "github-review" :repo
                          "charignon/github-review" :fetcher github
                          :files
                          ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                           "*.texinfo" "doc/dir" "doc/*.info"
                           "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                           "docs/dir" "docs/*.info" "docs/*.texi"
                           "docs/*.texinfo"
                           (:exclude ".dir-locals.el" "test.el"
                                     "tests.el" "*-test.el"
                                     "*-tests.el" "LICENSE" "README*"
                                     "*-pkg.el"))
                          :source "elpaca-menu-lock-file" :protocol
                          https :inherit t :depth treeless :ref
                          "725fbc7b385228f53a7ddc46a92c1276bab4aea8"))
 (go-dlv :source "elpaca-menu-lock-file" :recipe
         (:package "go-dlv" :repo "benma/go-dlv.el" :fetcher github
                   :files
                   ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                    "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                    "doc/*.texinfo" "lisp/*.el" "docs/dir"
                    "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                    (:exclude ".dir-locals.el" "test.el" "tests.el"
                              "*-test.el" "*-tests.el" "LICENSE"
                              "README*" "*-pkg.el"))
                   :source "elpaca-menu-lock-file" :protocol https
                   :inherit t :depth treeless :ref
                   "0a296bc3b7b4dcf0c140a78c5ca3e1a8c6b7ea1a"))
 (go-eldoc :source "elpaca-menu-lock-file" :recipe
           (:package "go-eldoc" :repo "emacsorphanage/go-eldoc"
                     :fetcher github :files
                     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                      "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                      "doc/*.texinfo" "lisp/*.el" "docs/dir"
                      "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                      (:exclude ".dir-locals.el" "test.el" "tests.el"
                                "*-test.el" "*-tests.el" "LICENSE"
                                "README*" "*-pkg.el"))
                     :source "elpaca-menu-lock-file" :protocol https
                     :inherit t :depth treeless :ref
                     "cbbd2ea1e94a36004432a9ac61414cb5a95a39bd"))
 (go-gen-test :source "elpaca-menu-lock-file" :recipe
              (:package "go-gen-test" :fetcher github :repo
                        "s-kostyaev/go-gen-test" :files
                        ("go-gen-test.el") :source
                        "elpaca-menu-lock-file" :protocol https
                        :inherit t :depth treeless :ref
                        "af00a9abbaba2068502327ecdef574fd894a884b"))
 (go-guru :source "elpaca-menu-lock-file" :recipe
          (:package "go-guru" :repo "dominikh/go-mode.el" :fetcher
                    github :files ("go-guru.el") :source
                    "elpaca-menu-lock-file" :protocol https :inherit t
                    :depth treeless :ref
                    "0ed3c5227e7f622589f1411b4939c3ee34711ebd"))
 (go-mode :source "elpaca-menu-lock-file" :recipe
          (:package "go-mode" :repo "dominikh/go-mode.el" :fetcher
                    github :files ("go-mode.el") :source
                    "elpaca-menu-lock-file" :protocol https :inherit t
                    :depth treeless :ref
                    "0ed3c5227e7f622589f1411b4939c3ee34711ebd"))
 (go-playground :source "elpaca-menu-lock-file" :recipe
                (:package "go-playground" :repo "grafov/go-playground"
                          :fetcher github :files
                          ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                           "*.texinfo" "doc/dir" "doc/*.info"
                           "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                           "docs/dir" "docs/*.info" "docs/*.texi"
                           "docs/*.texinfo"
                           (:exclude ".dir-locals.el" "test.el"
                                     "tests.el" "*-test.el"
                                     "*-tests.el" "LICENSE" "README*"
                                     "*-pkg.el"))
                          :source "elpaca-menu-lock-file" :protocol
                          https :inherit t :depth treeless :ref
                          "5726251414d3d7cc05fd54566ee9149808501574"))
 (go-projectile :source "elpaca-menu-lock-file" :recipe
                (:package "go-projectile" :repo "dougm/go-projectile"
                          :fetcher github :files
                          ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                           "*.texinfo" "doc/dir" "doc/*.info"
                           "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                           "docs/dir" "docs/*.info" "docs/*.texi"
                           "docs/*.texinfo"
                           (:exclude ".dir-locals.el" "test.el"
                                     "tests.el" "*-test.el"
                                     "*-tests.el" "LICENSE" "README*"
                                     "*-pkg.el"))
                          :source "elpaca-menu-lock-file" :protocol
                          https :inherit t :depth treeless :ref
                          "ad4ca3b5695a0e31e95e3cc4ccab498f87d68303"))
 (go-rename :source "elpaca-menu-lock-file" :recipe
            (:package "go-rename" :repo "dominikh/go-mode.el" :fetcher
                      github :files ("go-rename.el") :source
                      "elpaca-menu-lock-file" :protocol https :inherit
                      t :depth treeless :ref
                      "0ed3c5227e7f622589f1411b4939c3ee34711ebd"))
 (gotest :source "elpaca-menu-lock-file" :recipe
         (:package "gotest" :fetcher github :repo
                   "nlamirault/gotest.el" :files
                   ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                    "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                    "doc/*.texinfo" "lisp/*.el" "docs/dir"
                    "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                    (:exclude ".dir-locals.el" "test.el" "tests.el"
                              "*-test.el" "*-tests.el" "LICENSE"
                              "README*" "*-pkg.el"))
                   :source "elpaca-menu-lock-file" :protocol https
                   :inherit t :depth treeless :ref
                   "490189e68d743a851bfb42d0017428a7550e8615"))
 (gptel :source "elpaca-menu-lock-file" :recipe
        (:package "gptel" :repo "karthink/gptel" :fetcher github
                  :files
                  ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                   "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                   "doc/*.texinfo" "lisp/*.el" "docs/dir"
                   "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                   (:exclude ".dir-locals.el" "test.el" "tests.el"
                             "*-test.el" "*-tests.el" "LICENSE"
                             "README*" "*-pkg.el"))
                  :source "elpaca-menu-lock-file" :protocol https
                  :inherit t :depth treeless :ref
                  "850c20689fe00e18b13047c784c77f0df8ab6ca9"))
 (groovy-mode :source "elpaca-menu-lock-file" :recipe
              (:package "groovy-mode" :fetcher github :repo
                        "Groovy-Emacs-Modes/groovy-emacs-modes" :files
                        ("*groovy*.el") :source
                        "elpaca-menu-lock-file" :protocol https
                        :inherit t :depth treeless :ref
                        "7b8520b2e2d3ab1d62b35c426e17ac25ed0120bb"))
 (haml-mode :source "elpaca-menu-lock-file" :recipe
            (:package "haml-mode" :repo "nex3/haml-mode" :fetcher
                      github :files
                      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                       "doc/*.texinfo" "lisp/*.el" "docs/dir"
                       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                       (:exclude ".dir-locals.el" "test.el" "tests.el"
                                 "*-test.el" "*-tests.el" "LICENSE"
                                 "README*" "*-pkg.el"))
                      :source "elpaca-menu-lock-file" :protocol https
                      :inherit t :depth treeless :ref
                      "3bb4a96535eb5c81dbe6a43bfa8d67a778d449c0"))
 (haskell-mode :source "elpaca-menu-lock-file" :recipe
               (:package "haskell-mode" :repo "haskell/haskell-mode"
                         :fetcher github :files
                         (:defaults "NEWS" "logo.svg") :source
                         "elpaca-menu-lock-file" :protocol https
                         :inherit t :depth treeless :ref
                         "383b4b77753ef83420c7a755f86e1ec4770f551b"))
 (hcl-mode :source "elpaca-menu-lock-file" :recipe
           (:package "hcl-mode" :repo "hcl-emacs/hcl-mode" :fetcher
                     github :files
                     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                      "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                      "doc/*.texinfo" "lisp/*.el" "docs/dir"
                      "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                      (:exclude ".dir-locals.el" "test.el" "tests.el"
                                "*-test.el" "*-tests.el" "LICENSE"
                                "README*" "*-pkg.el"))
                     :source "elpaca-menu-lock-file" :protocol https
                     :inherit t :depth treeless :ref
                     "1da895ed75d28d9f87cbf9b74f075d90ba31c0ed"))
 (helm :source "elpaca-menu-lock-file" :recipe
       (:package "helm" :fetcher github :repo "emacs-helm/helm" :files
                 (:defaults "emacs-helm.sh"
                            (:exclude "helm-lib.el" "helm-source.el"
                                      "helm-multi-match.el"
                                      "helm-core.el"))
                 :source "elpaca-menu-lock-file" :protocol https
                 :inherit t :depth treeless :ref
                 "5f8ba191b01c3a113acfe5df003fdd3152f1770f"))
 (helm-ag :source "elpaca-menu-lock-file" :recipe
          (:source "elpaca-menu-lock-file" :protocol https :inherit t
                   :depth treeless :host github :repo
                   "emacsattic/helm-ag" :package "helm-ag" :ref
                   "a7b43d9622ea5dcff3e3e0bb0b7dcc342b272171"))
 (helm-core :source "elpaca-menu-lock-file" :recipe
            (:package "helm-core" :repo "emacs-helm/helm" :fetcher
                      github :files
                      ("helm-core.el" "helm-lib.el" "helm-source.el"
                       "helm-multi-match.el")
                      :source "elpaca-menu-lock-file" :protocol https
                      :inherit t :depth treeless :ref
                      "5f8ba191b01c3a113acfe5df003fdd3152f1770f"))
 (helm-descbinds :source "elpaca-menu-lock-file" :recipe
                 (:package "helm-descbinds" :repo
                           "emacs-helm/helm-descbinds" :fetcher github
                           :files
                           ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                            "*.texinfo" "doc/dir" "doc/*.info"
                            "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                            "docs/dir" "docs/*.info" "docs/*.texi"
                            "docs/*.texinfo"
                            (:exclude ".dir-locals.el" "test.el"
                                      "tests.el" "*-test.el"
                                      "*-tests.el" "LICENSE" "README*"
                                      "*-pkg.el"))
                           :source "elpaca-menu-lock-file" :protocol
                           https :inherit t :depth treeless :ref
                           "0aff44badad976ebf2666a7e9b6ddf4db53e59e5"))
 (helm-describe-modes :source "elpaca-menu-lock-file" :recipe
                      (:package "helm-describe-modes" :fetcher github
                                :repo "emacs-helm/helm-describe-modes"
                                :files
                                ("*.el" "*.el.in" "dir" "*.info"
                                 "*.texi" "*.texinfo" "doc/dir"
                                 "doc/*.info" "doc/*.texi"
                                 "doc/*.texinfo" "lisp/*.el"
                                 "docs/dir" "docs/*.info"
                                 "docs/*.texi" "docs/*.texinfo"
                                 (:exclude ".dir-locals.el" "test.el"
                                           "tests.el" "*-test.el"
                                           "*-tests.el" "LICENSE"
                                           "README*" "*-pkg.el"))
                                :source "elpaca-menu-lock-file"
                                :protocol https :inherit t :depth
                                treeless :ref
                                "11fb36af119b784539d31c6160002de1957408aa"))
 (helm-lsp :source "elpaca-menu-lock-file" :recipe
           (:package "helm-lsp" :repo "emacs-lsp/helm-lsp" :fetcher
                     github :files
                     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                      "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                      "doc/*.texinfo" "lisp/*.el" "docs/dir"
                      "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                      (:exclude ".dir-locals.el" "test.el" "tests.el"
                                "*-test.el" "*-tests.el" "LICENSE"
                                "README*" "*-pkg.el"))
                     :source "elpaca-menu-lock-file" :protocol https
                     :inherit t :depth treeless :ref
                     "027897a957032e8752780600b21d2c0ea0cf3201"))
 (helm-make :source "elpaca-menu-lock-file" :recipe
            (:package "helm-make" :repo "abo-abo/helm-make" :fetcher
                      github :files
                      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                       "doc/*.texinfo" "lisp/*.el" "docs/dir"
                       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                       (:exclude ".dir-locals.el" "test.el" "tests.el"
                                 "*-test.el" "*-tests.el" "LICENSE"
                                 "README*" "*-pkg.el"))
                      :source "elpaca-menu-lock-file" :protocol https
                      :inherit t :depth treeless :ref
                      "ebd71e85046d59b37f6a96535e01993b6962c559"))
 (helm-posframe :source "elpaca-menu-lock-file" :recipe
                (:source "elpaca-menu-lock-file" :protocol https
                         :inherit t :depth treeless :host github :repo
                         "emacsattic/helm-posframe" :package
                         "helm-posframe" :ref
                         "0b6bb016f0ff4980860a9d00574de311748c40b0"))
 (helm-swoop :source "elpaca-menu-lock-file" :recipe
             (:source "elpaca-menu-lock-file" :protocol https :inherit
                      t :depth treeless :host github :repo
                      "emacsattic/helm-swoop" :package "helm-swoop"
                      :ref "df90efd4476dec61186d80cace69276a95b834d2"))
 (helm-xref :source "elpaca-menu-lock-file" :recipe
            (:package "helm-xref" :repo "brotzeit/helm-xref" :fetcher
                      github :files
                      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                       "doc/*.texinfo" "lisp/*.el" "docs/dir"
                       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                       (:exclude ".dir-locals.el" "test.el" "tests.el"
                                 "*-test.el" "*-tests.el" "LICENSE"
                                 "README*" "*-pkg.el"))
                      :source "elpaca-menu-lock-file" :protocol https
                      :inherit t :depth treeless :ref
                      "ea0e4ed8a9baf236e4085cbc7178241f109a53fa"))
 (helpful :source "elpaca-menu-lock-file" :recipe
          (:package "helpful" :repo "Wilfred/helpful" :fetcher github
                    :files
                    ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                     "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                     "doc/*.texinfo" "lisp/*.el" "docs/dir"
                     "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                     (:exclude ".dir-locals.el" "test.el" "tests.el"
                               "*-test.el" "*-tests.el" "LICENSE"
                               "README*" "*-pkg.el"))
                    :source "elpaca-menu-lock-file" :protocol https
                    :inherit t :depth treeless :ref
                    "03756fa6ad4dcca5e0920622b1ee3f70abfc4e39"))
 (highlight-indent-guides :source "elpaca-menu-lock-file" :recipe
                          (:package "highlight-indent-guides" :fetcher
                                    github :repo
                                    "DarthFennec/highlight-indent-guides"
                                    :files
                                    ("*.el" "*.el.in" "dir" "*.info"
                                     "*.texi" "*.texinfo" "doc/dir"
                                     "doc/*.info" "doc/*.texi"
                                     "doc/*.texinfo" "lisp/*.el"
                                     "docs/dir" "docs/*.info"
                                     "docs/*.texi" "docs/*.texinfo"
                                     (:exclude ".dir-locals.el"
                                               "test.el" "tests.el"
                                               "*-test.el"
                                               "*-tests.el" "LICENSE"
                                               "README*" "*-pkg.el"))
                                    :source "elpaca-menu-lock-file"
                                    :protocol https :inherit t :depth
                                    treeless :ref
                                    "2182caa942f88e4080f5dee49df334ebea52aed0"))
 (ht :source "elpaca-menu-lock-file" :recipe
     (:package "ht" :fetcher github :repo "Wilfred/ht.el" :files
               ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
                "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
                "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
                "docs/*.texinfo"
                (:exclude ".dir-locals.el" "test.el" "tests.el"
                          "*-test.el" "*-tests.el" "LICENSE" "README*"
                          "*-pkg.el"))
               :source "elpaca-menu-lock-file" :protocol https
               :inherit t :depth treeless :ref
               "1c49aad1c820c86f7ee35bf9fff8429502f60fef"))
 (htmlize :source "elpaca-menu-lock-file" :recipe
          (:package "htmlize" :fetcher github :repo
                    "emacsorphanage/htmlize" :files
                    ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                     "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                     "doc/*.texinfo" "lisp/*.el" "docs/dir"
                     "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                     (:exclude ".dir-locals.el" "test.el" "tests.el"
                               "*-test.el" "*-tests.el" "LICENSE"
                               "README*" "*-pkg.el"))
                    :source "elpaca-menu-lock-file" :protocol https
                    :inherit t :depth treeless :ref
                    "fa644880699adea3770504f913e6dddbec90c076"))
 (httprepl :source "elpaca-menu-lock-file" :recipe
           (:package "httprepl" :fetcher github :repo
                     "gregsexton/httprepl.el" :files
                     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                      "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                      "doc/*.texinfo" "lisp/*.el" "docs/dir"
                      "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                      (:exclude ".dir-locals.el" "test.el" "tests.el"
                                "*-test.el" "*-tests.el" "LICENSE"
                                "README*" "*-pkg.el"))
                     :source "elpaca-menu-lock-file" :protocol https
                     :inherit t :depth treeless :ref
                     "cfa3693267a8ed1c96a86a126823f37dbfe077d8"))
 (hydra :source "elpaca-menu-lock-file" :recipe
        (:package "hydra" :repo "abo-abo/hydra" :fetcher github :files
                  (:defaults (:exclude "lv.el")) :source
                  "elpaca-menu-lock-file" :protocol https :inherit t
                  :depth treeless :ref
                  "59a2a45a35027948476d1d7751b0f0215b1e61aa"))
 (imenu-anywhere :source "elpaca-menu-lock-file" :recipe
                 (:package "imenu-anywhere" :repo
                           "vspinu/imenu-anywhere" :fetcher github
                           :files
                           ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                            "*.texinfo" "doc/dir" "doc/*.info"
                            "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                            "docs/dir" "docs/*.info" "docs/*.texi"
                            "docs/*.texinfo"
                            (:exclude ".dir-locals.el" "test.el"
                                      "tests.el" "*-test.el"
                                      "*-tests.el" "LICENSE" "README*"
                                      "*-pkg.el"))
                           :source "elpaca-menu-lock-file" :protocol
                           https :inherit t :depth treeless :ref
                           "06ec33d79e33edf01b9118aead1eabeae8ee08b1"))
 (inf-ruby :source "elpaca-menu-lock-file" :recipe
           (:package "inf-ruby" :repo "nonsequitur/inf-ruby" :fetcher
                     github :files
                     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                      "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                      "doc/*.texinfo" "lisp/*.el" "docs/dir"
                      "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                      (:exclude ".dir-locals.el" "test.el" "tests.el"
                                "*-test.el" "*-tests.el" "LICENSE"
                                "README*" "*-pkg.el"))
                     :source "elpaca-menu-lock-file" :protocol https
                     :inherit t :depth treeless :ref
                     "274398a24288a7db430a656b580ffbf889ca02aa"))
 (inheritenv :source "elpaca-menu-lock-file" :recipe
             (:package "inheritenv" :fetcher github :repo
                       "purcell/inheritenv" :files
                       ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                        "*.texinfo" "doc/dir" "doc/*.info"
                        "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                        "docs/dir" "docs/*.info" "docs/*.texi"
                        "docs/*.texinfo"
                        (:exclude ".dir-locals.el" "test.el"
                                  "tests.el" "*-test.el" "*-tests.el"
                                  "LICENSE" "README*" "*-pkg.el"))
                       :source "elpaca-menu-lock-file" :protocol https
                       :inherit t :depth treeless :ref
                       "b9e67cc20c069539698a9ac54d0e6cc11e616c6f"))
 (jinja2-mode :source "elpaca-menu-lock-file" :recipe
              (:package "jinja2-mode" :fetcher github :repo
                        "paradoxxxzero/jinja2-mode" :files
                        ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                         "*.texinfo" "doc/dir" "doc/*.info"
                         "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                         "docs/dir" "docs/*.info" "docs/*.texi"
                         "docs/*.texinfo"
                         (:exclude ".dir-locals.el" "test.el"
                                   "tests.el" "*-test.el" "*-tests.el"
                                   "LICENSE" "README*" "*-pkg.el"))
                        :source "elpaca-menu-lock-file" :protocol
                        https :inherit t :depth treeless :ref
                        "03e5430a7efe1d163a16beaf3c82c5fd2c2caee1"))
 (js2-mode :source "elpaca-menu-lock-file" :recipe
           (:package "js2-mode" :repo "mooz/js2-mode" :fetcher github
                     :files
                     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                      "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                      "doc/*.texinfo" "lisp/*.el" "docs/dir"
                      "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                      (:exclude ".dir-locals.el" "test.el" "tests.el"
                                "*-test.el" "*-tests.el" "LICENSE"
                                "README*" "*-pkg.el"))
                     :source "elpaca-menu-lock-file" :protocol https
                     :inherit t :depth treeless :ref
                     "e0c302872de4d26a9c1614fac8d6b94112b96307"))
 (jsonnet-mode :source "elpaca-menu-lock-file" :recipe
               (:package "jsonnet-mode" :fetcher github :repo
                         "tminor/jsonnet-mode" :files
                         ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                          "*.texinfo" "doc/dir" "doc/*.info"
                          "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                          "docs/dir" "docs/*.info" "docs/*.texi"
                          "docs/*.texinfo"
                          (:exclude ".dir-locals.el" "test.el"
                                    "tests.el" "*-test.el"
                                    "*-tests.el" "LICENSE" "README*"
                                    "*-pkg.el"))
                         :source "elpaca-menu-lock-file" :protocol
                         https :inherit t :depth treeless :ref
                         "00229c2f04bb4be26686eb325303865dac3cabf8"))
 (kubernetes :source "elpaca-menu-lock-file" :recipe
             (:package "kubernetes" :repo
                       "kubernetes-el/kubernetes-el" :fetcher github
                       :files
                       (:defaults (:exclude "kubernetes-evil.el"))
                       :source "elpaca-menu-lock-file" :protocol https
                       :inherit t :depth treeless :ref
                       "036583995bfceb0231738f65dd09c029ad812b02"))
 (list-utils :source "elpaca-menu-lock-file" :recipe
             (:package "list-utils" :repo "rolandwalker/list-utils"
                       :fetcher github :files
                       ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                        "*.texinfo" "doc/dir" "doc/*.info"
                        "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                        "docs/dir" "docs/*.info" "docs/*.texi"
                        "docs/*.texinfo"
                        (:exclude ".dir-locals.el" "test.el"
                                  "tests.el" "*-test.el" "*-tests.el"
                                  "LICENSE" "README*" "*-pkg.el"))
                       :source "elpaca-menu-lock-file" :protocol https
                       :inherit t :depth treeless :ref
                       "bbea0e7cc7ab7d96e7f062014bde438aa8ffcd43"))
 (llama :source "elpaca-menu-lock-file" :recipe
        (:package "llama" :fetcher github :repo "tarsius/llama" :files
                  ("llama.el" ".dir-locals.el") :source
                  "elpaca-menu-lock-file" :protocol https :inherit t
                  :depth treeless :ref
                  "472f5967f6684342d3c042d1ba12c3b3d6cefaba"))
 (loop :source "elpaca-menu-lock-file" :recipe
       (:package "loop" :repo "Wilfred/loop.el" :fetcher github :files
                 ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
                  "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
                  "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
                  "docs/*.texinfo"
                  (:exclude ".dir-locals.el" "test.el" "tests.el"
                            "*-test.el" "*-tests.el" "LICENSE"
                            "README*" "*-pkg.el"))
                 :source "elpaca-menu-lock-file" :protocol https
                 :inherit t :depth treeless :ref
                 "9db6372791bbd0cf3fa907ed0ae3e6b7bcf6cc57"))
 (lorem-ipsum :source "elpaca-menu-lock-file" :recipe
              (:package "lorem-ipsum" :fetcher github :repo
                        "jschaf/emacs-lorem-ipsum" :files
                        ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                         "*.texinfo" "doc/dir" "doc/*.info"
                         "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                         "docs/dir" "docs/*.info" "docs/*.texi"
                         "docs/*.texinfo"
                         (:exclude ".dir-locals.el" "test.el"
                                   "tests.el" "*-test.el" "*-tests.el"
                                   "LICENSE" "README*" "*-pkg.el"))
                        :source "elpaca-menu-lock-file" :protocol
                        https :inherit t :depth treeless :ref
                        "4e87a899868e908a7a9e1812831d76c8d072f885"))
 (lsp-docker :source "elpaca-menu-lock-file" :recipe
             (:package "lsp-docker" :repo "emacs-lsp/lsp-docker"
                       :fetcher github :files
                       ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                        "*.texinfo" "doc/dir" "doc/*.info"
                        "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                        "docs/dir" "docs/*.info" "docs/*.texi"
                        "docs/*.texinfo"
                        (:exclude ".dir-locals.el" "test.el"
                                  "tests.el" "*-test.el" "*-tests.el"
                                  "LICENSE" "README*" "*-pkg.el"))
                       :source "elpaca-menu-lock-file" :protocol https
                       :inherit t :depth treeless :ref
                       "ff41f4a76b640d39dc238bacba7f654c297827fa"))
 (lsp-mode :source "elpaca-menu-lock-file" :recipe
           (:package "lsp-mode" :repo "emacs-lsp/lsp-mode" :fetcher
                     github :files (:defaults "clients/*.*") :source
                     "elpaca-menu-lock-file" :protocol https :inherit
                     t :depth treeless :ref
                     "f7fca9db34d202a89da1670a3a0cdf326d42e630"))
 (lsp-origami :source "elpaca-menu-lock-file" :recipe
              (:package "lsp-origami" :repo "emacs-lsp/lsp-origami"
                        :fetcher github :files
                        ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                         "*.texinfo" "doc/dir" "doc/*.info"
                         "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                         "docs/dir" "docs/*.info" "docs/*.texi"
                         "docs/*.texinfo"
                         (:exclude ".dir-locals.el" "test.el"
                                   "tests.el" "*-test.el" "*-tests.el"
                                   "LICENSE" "README*" "*-pkg.el"))
                        :source "elpaca-menu-lock-file" :protocol
                        https :inherit t :depth treeless :ref
                        "a7bc08c61dd402ff9ef5d111beb133ddf5d6ca16"))
 (lsp-treemacs :source "elpaca-menu-lock-file" :recipe
               (:package "lsp-treemacs" :repo "emacs-lsp/lsp-treemacs"
                         :fetcher github :files (:defaults "icons")
                         :source "elpaca-menu-lock-file" :protocol
                         https :inherit t :depth treeless :ref
                         "49df7292c521b4bac058985ceeaf006607b497dd"))
 (lsp-ui :source "elpaca-menu-lock-file" :recipe
         (:package "lsp-ui" :repo "emacs-lsp/lsp-ui" :fetcher github
                   :files (:defaults "lsp-ui-doc.html" "resources")
                   :source "elpaca-menu-lock-file" :protocol https
                   :inherit t :depth treeless :ref
                   "e5e38f3058bc6c3a108742ffa1048eebda6e5055"))
 (lua-mode :source "elpaca-menu-lock-file" :recipe
           (:package "lua-mode" :repo "immerrr/lua-mode" :fetcher
                     github :files
                     (:defaults (:exclude "init-tryout.el")) :source
                     "elpaca-menu-lock-file" :protocol https :inherit
                     t :depth treeless :ref
                     "2f6b8d7a6317e42c953c5119b0119ddb337e0a5f"))
 (lv :source "elpaca-menu-lock-file" :recipe
     (:package "lv" :repo "abo-abo/hydra" :fetcher github :files
               ("lv.el") :source "elpaca-menu-lock-file" :protocol
               https :inherit t :depth treeless :ref
               "59a2a45a35027948476d1d7751b0f0215b1e61aa"))
 (magit :source "elpaca-menu-lock-file" :recipe
        (:package "magit" :fetcher github :repo "magit/magit" :files
                  ("lisp/magit*.el" "lisp/git-*.el" "docs/magit.texi"
                   "docs/AUTHORS.md" "LICENSE" ".dir-locals.el"
                   ("git-hooks" "git-hooks/*")
                   (:exclude "lisp/magit-section.el"))
                  :source "elpaca-menu-lock-file" :protocol https
                  :inherit t :depth treeless :ref
                  "c1448720eac5222beef827277c369fc5bab04a36"))
 (magit-delta :source "elpaca-menu-lock-file" :recipe
              (:package "magit-delta" :fetcher github :repo
                        "dandavison/magit-delta" :files
                        ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                         "*.texinfo" "doc/dir" "doc/*.info"
                         "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                         "docs/dir" "docs/*.info" "docs/*.texi"
                         "docs/*.texinfo"
                         (:exclude ".dir-locals.el" "test.el"
                                   "tests.el" "*-test.el" "*-tests.el"
                                   "LICENSE" "README*" "*-pkg.el"))
                        :source "elpaca-menu-lock-file" :protocol
                        https :inherit t :depth treeless :ref
                        "5fc7dbddcfacfe46d3fd876172ad02a9ab6ac616"))
 (magit-popup :source "elpaca-menu-lock-file" :recipe
              (:package "magit-popup" :fetcher github :repo
                        "magit/magit-popup" :files
                        ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                         "*.texinfo" "doc/dir" "doc/*.info"
                         "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                         "docs/dir" "docs/*.info" "docs/*.texi"
                         "docs/*.texinfo"
                         (:exclude ".dir-locals.el" "test.el"
                                   "tests.el" "*-test.el" "*-tests.el"
                                   "LICENSE" "README*" "*-pkg.el"))
                        :source "elpaca-menu-lock-file" :protocol
                        https :inherit t :depth treeless :ref
                        "d8585fa39f88956963d877b921322530257ba9f5"))
 (magit-section :source "elpaca-menu-lock-file" :recipe
                (:package "magit-section" :fetcher github :repo
                          "magit/magit" :files
                          ("lisp/magit-section.el"
                           "docs/magit-section.texi"
                           "magit-section-pkg.el")
                          :source "elpaca-menu-lock-file" :protocol
                          https :inherit t :depth treeless :ref
                          "c1448720eac5222beef827277c369fc5bab04a36"))
 (makefile-executor :source "elpaca-menu-lock-file" :recipe
                    (:package "makefile-executor" :repo
                              "Olivia5k/makefile-executor.el" :fetcher
                              github :files
                              ("*.el" "*.el.in" "dir" "*.info"
                               "*.texi" "*.texinfo" "doc/dir"
                               "doc/*.info" "doc/*.texi"
                               "doc/*.texinfo" "lisp/*.el" "docs/dir"
                               "docs/*.info" "docs/*.texi"
                               "docs/*.texinfo"
                               (:exclude ".dir-locals.el" "test.el"
                                         "tests.el" "*-test.el"
                                         "*-tests.el" "LICENSE"
                                         "README*" "*-pkg.el"))
                              :source "elpaca-menu-lock-file"
                              :protocol https :inherit t :depth
                              treeless :ref
                              "d1d98eaf522a767561f6c7cbd8d2526be58b3ec5"))
 (marginalia :source "elpaca-menu-lock-file" :recipe
             (:package "marginalia" :repo "minad/marginalia" :fetcher
                       github :files
                       ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                        "*.texinfo" "doc/dir" "doc/*.info"
                        "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                        "docs/dir" "docs/*.info" "docs/*.texi"
                        "docs/*.texinfo"
                        (:exclude ".dir-locals.el" "test.el"
                                  "tests.el" "*-test.el" "*-tests.el"
                                  "LICENSE" "README*" "*-pkg.el"))
                       :source "elpaca-menu-lock-file" :protocol https
                       :inherit t :depth treeless :ref
                       "76591cfdd2d07293db6866f3939759d5de8a955c"))
 (markdown-mode :source "elpaca-menu-lock-file" :recipe
                (:package "markdown-mode" :fetcher github :repo
                          "jrblevin/markdown-mode" :files
                          ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                           "*.texinfo" "doc/dir" "doc/*.info"
                           "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                           "docs/dir" "docs/*.info" "docs/*.texi"
                           "docs/*.texinfo"
                           (:exclude ".dir-locals.el" "test.el"
                                     "tests.el" "*-test.el"
                                     "*-tests.el" "LICENSE" "README*"
                                     "*-pkg.el"))
                          :source "elpaca-menu-lock-file" :protocol
                          https :inherit t :depth treeless :ref
                          "92802fae9ebbc8c2e4c281c06dcdbd74b8bca80e"))
 (mermaid-mode :source "elpaca-menu-lock-file" :recipe
               (:package "mermaid-mode" :repo "abrochard/mermaid-mode"
                         :fetcher github :files
                         ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                          "*.texinfo" "doc/dir" "doc/*.info"
                          "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                          "docs/dir" "docs/*.info" "docs/*.texi"
                          "docs/*.texinfo"
                          (:exclude ".dir-locals.el" "test.el"
                                    "tests.el" "*-test.el"
                                    "*-tests.el" "LICENSE" "README*"
                                    "*-pkg.el"))
                         :source "elpaca-menu-lock-file" :protocol
                         https :inherit t :depth treeless :ref
                         "9535d513b41ed11bcd91f644815e2db6430c1560"))
 (minions :source "elpaca-menu-lock-file" :recipe
          (:package "minions" :fetcher github :repo "tarsius/minions"
                    :files
                    ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                     "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                     "doc/*.texinfo" "lisp/*.el" "docs/dir"
                     "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                     (:exclude ".dir-locals.el" "test.el" "tests.el"
                               "*-test.el" "*-tests.el" "LICENSE"
                               "README*" "*-pkg.el"))
                    :source "elpaca-menu-lock-file" :protocol https
                    :inherit t :depth treeless :ref
                    "4e27da98ab8f6dc5b56a9e5e2b537f5230da7af7"))
 (mise :source "elpaca-menu-lock-file" :recipe
       (:package "mise" :fetcher github :repo "eki3z/mise.el" :files
                 ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
                  "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
                  "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
                  "docs/*.texinfo"
                  (:exclude ".dir-locals.el" "test.el" "tests.el"
                            "*-test.el" "*-tests.el" "LICENSE"
                            "README*" "*-pkg.el"))
                 :source "elpaca-menu-lock-file" :protocol https
                 :inherit t :depth treeless :ref
                 "849c44b36594c80c57a555c5671dd1a5a83d3184"))
 (mmm-mode :source "elpaca-menu-lock-file" :recipe
           (:package "mmm-mode" :repo "dgutov/mmm-mode" :fetcher
                     github :files
                     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                      "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                      "doc/*.texinfo" "lisp/*.el" "docs/dir"
                      "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                      (:exclude ".dir-locals.el" "test.el" "tests.el"
                                "*-test.el" "*-tests.el" "LICENSE"
                                "README*" "*-pkg.el"))
                     :source "elpaca-menu-lock-file" :protocol https
                     :inherit t :depth treeless :ref
                     "b1f5c7dbdc405e6e10d9ddd99a43a6b2ad61b176"))
 (move-dup :source "elpaca-menu-lock-file" :recipe
           (:package "move-dup" :fetcher github :repo
                     "wyuenho/move-dup" :files
                     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                      "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                      "doc/*.texinfo" "lisp/*.el" "docs/dir"
                      "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                      (:exclude ".dir-locals.el" "test.el" "tests.el"
                                "*-test.el" "*-tests.el" "LICENSE"
                                "README*" "*-pkg.el"))
                     :source "elpaca-menu-lock-file" :protocol https
                     :inherit t :depth treeless :ref
                     "5906503e0b9b832b1d5062c9cd27cf72a2ce4817"))
 (multiple-cursors :source "elpaca-menu-lock-file" :recipe
                   (:package "multiple-cursors" :fetcher github :repo
                             "magnars/multiple-cursors.el" :files
                             ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                              "*.texinfo" "doc/dir" "doc/*.info"
                              "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                              "docs/dir" "docs/*.info" "docs/*.texi"
                              "docs/*.texinfo"
                              (:exclude ".dir-locals.el" "test.el"
                                        "tests.el" "*-test.el"
                                        "*-tests.el" "LICENSE"
                                        "README*" "*-pkg.el"))
                             :source "elpaca-menu-lock-file" :protocol
                             https :inherit t :depth treeless :ref
                             "9017f3be6b00c1d82e33409db4a178133fb39d47"))
 (mwim :source "elpaca-menu-lock-file" :recipe
       (:package "mwim" :repo "alezost/mwim.el" :fetcher github :files
                 ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
                  "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
                  "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
                  "docs/*.texinfo"
                  (:exclude ".dir-locals.el" "test.el" "tests.el"
                            "*-test.el" "*-tests.el" "LICENSE"
                            "README*" "*-pkg.el"))
                 :source "elpaca-menu-lock-file" :protocol https
                 :inherit t :depth treeless :ref
                 "b4f3edb4c0fb8f8b71cecbf8095c2c25a8ffbf85"))
 (nerd-icons :source "elpaca-menu-lock-file" :recipe
             (:package "nerd-icons" :repo
                       "rainstormstudio/nerd-icons.el" :fetcher github
                       :files (:defaults "data") :source
                       "elpaca-menu-lock-file" :protocol https
                       :inherit t :depth treeless :ref
                       "d41902fe68a94fcf4394f25a89ba2d510bec4461"))
 (nerd-icons-completion :source "elpaca-menu-lock-file" :recipe
                        (:package "nerd-icons-completion" :repo
                                  "rainstormstudio/nerd-icons-completion"
                                  :fetcher github :files
                                  ("*.el" "*.el.in" "dir" "*.info"
                                   "*.texi" "*.texinfo" "doc/dir"
                                   "doc/*.info" "doc/*.texi"
                                   "doc/*.texinfo" "lisp/*.el"
                                   "docs/dir" "docs/*.info"
                                   "docs/*.texi" "docs/*.texinfo"
                                   (:exclude ".dir-locals.el"
                                             "test.el" "tests.el"
                                             "*-test.el" "*-tests.el"
                                             "LICENSE" "README*"
                                             "*-pkg.el"))
                                  :source "elpaca-menu-lock-file"
                                  :protocol https :inherit t :depth
                                  treeless :ref
                                  "d09ea987ed3d2cc64137234f27851594050e2b64"))
 (nerd-icons-ibuffer :source "elpaca-menu-lock-file" :recipe
                     (:package "nerd-icons-ibuffer" :repo
                               "seagle0128/nerd-icons-ibuffer"
                               :fetcher github :files
                               ("*.el" "*.el.in" "dir" "*.info"
                                "*.texi" "*.texinfo" "doc/dir"
                                "doc/*.info" "doc/*.texi"
                                "doc/*.texinfo" "lisp/*.el" "docs/dir"
                                "docs/*.info" "docs/*.texi"
                                "docs/*.texinfo"
                                (:exclude ".dir-locals.el" "test.el"
                                          "tests.el" "*-test.el"
                                          "*-tests.el" "LICENSE"
                                          "README*" "*-pkg.el"))
                               :source "elpaca-menu-lock-file"
                               :protocol https :inherit t :depth
                               treeless :ref
                               "0cf63e4fa666cc9f3717e182f72342dca9f31f67"))
 (nginx-mode :source "elpaca-menu-lock-file" :recipe
             (:package "nginx-mode" :fetcher github :repo
                       "ajc/nginx-mode" :files
                       ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                        "*.texinfo" "doc/dir" "doc/*.info"
                        "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                        "docs/dir" "docs/*.info" "docs/*.texi"
                        "docs/*.texinfo"
                        (:exclude ".dir-locals.el" "test.el"
                                  "tests.el" "*-test.el" "*-tests.el"
                                  "LICENSE" "README*" "*-pkg.el"))
                       :source "elpaca-menu-lock-file" :protocol https
                       :inherit t :depth treeless :ref
                       "c4ac5de975d65c84893a130a470af32a48b0b66c"))
 (nix-mode :source "elpaca-menu-lock-file" :recipe
           (:package "nix-mode" :fetcher github :repo "NixOS/nix-mode"
                     :files
                     (:defaults
                      (:exclude "nix-company.el" "nix-mode-mmm.el"))
                     :source "elpaca-menu-lock-file" :protocol https
                     :inherit t :depth treeless :ref
                     "719feb7868fb567ecfe5578f6119892c771ac5e5"))
 (ns-auto-titlebar :source "elpaca-menu-lock-file" :recipe
                   (:package "ns-auto-titlebar" :fetcher github :repo
                             "purcell/ns-auto-titlebar" :files
                             ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                              "*.texinfo" "doc/dir" "doc/*.info"
                              "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                              "docs/dir" "docs/*.info" "docs/*.texi"
                              "docs/*.texinfo"
                              (:exclude ".dir-locals.el" "test.el"
                                        "tests.el" "*-test.el"
                                        "*-tests.el" "LICENSE"
                                        "README*" "*-pkg.el"))
                             :source "elpaca-menu-lock-file" :protocol
                             https :inherit t :depth treeless :ref
                             "1205ac67b76b58e9eb53d2115b85775533653a80"))
 (ob-go :source "elpaca-menu-lock-file" :recipe
        (:package "ob-go" :fetcher github :repo "pope/ob-go" :files
                  ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                   "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                   "doc/*.texinfo" "lisp/*.el" "docs/dir"
                   "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                   (:exclude ".dir-locals.el" "test.el" "tests.el"
                             "*-test.el" "*-tests.el" "LICENSE"
                             "README*" "*-pkg.el"))
                  :source "elpaca-menu-lock-file" :protocol https
                  :inherit t :depth treeless :ref
                  "c6c7c811fba278924888010ac1fa555297fe760a"))
 (ob-http :source "elpaca-menu-lock-file" :recipe
          (:package "ob-http" :repo "zweifisch/ob-http" :fetcher
                    github :files
                    ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                     "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                     "doc/*.texinfo" "lisp/*.el" "docs/dir"
                     "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                     (:exclude ".dir-locals.el" "test.el" "tests.el"
                               "*-test.el" "*-tests.el" "LICENSE"
                               "README*" "*-pkg.el"))
                    :source "elpaca-menu-lock-file" :protocol https
                    :inherit t :depth treeless :ref
                    "b1428ea2a63bcb510e7382a1bf5fe82b19c104a7"))
 (ob-mermaid :source "elpaca-menu-lock-file" :recipe
             (:package "ob-mermaid" :repo "arnm/ob-mermaid" :fetcher
                       github :files
                       ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                        "*.texinfo" "doc/dir" "doc/*.info"
                        "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                        "docs/dir" "docs/*.info" "docs/*.texi"
                        "docs/*.texinfo"
                        (:exclude ".dir-locals.el" "test.el"
                                  "tests.el" "*-test.el" "*-tests.el"
                                  "LICENSE" "README*" "*-pkg.el"))
                       :source "elpaca-menu-lock-file" :protocol https
                       :inherit t :depth treeless :ref
                       "372c2d91d3cdba5da9f7ac23e7bce7a0b3b46862"))
 (origami :source "elpaca-menu-lock-file" :recipe
          (:package "origami" :fetcher github :repo
                    "gregsexton/origami.el" :files
                    ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                     "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                     "doc/*.texinfo" "lisp/*.el" "docs/dir"
                     "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                     (:exclude ".dir-locals.el" "test.el" "tests.el"
                               "*-test.el" "*-tests.el" "LICENSE"
                               "README*" "*-pkg.el"))
                    :source "elpaca-menu-lock-file" :protocol https
                    :inherit t :depth treeless :ref
                    "e558710a975e8511b9386edc81cd6bdd0a5bda74"))
 (osx-trash :source "elpaca-menu-lock-file" :recipe
            (:package "osx-trash" :fetcher github :repo
                      "emacsorphanage/osx-trash" :files
                      (:defaults "*.AppleScript") :source
                      "elpaca-menu-lock-file" :protocol https :inherit
                      t :depth treeless :ref
                      "90f0c99206022fec646206018fcd63d9d2e57325"))
 (ox-gfm :source "elpaca-menu-lock-file" :recipe
         (:package "ox-gfm" :fetcher github :repo "larstvei/ox-gfm"
                   :files
                   ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                    "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                    "doc/*.texinfo" "lisp/*.el" "docs/dir"
                    "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                    (:exclude ".dir-locals.el" "test.el" "tests.el"
                              "*-test.el" "*-tests.el" "LICENSE"
                              "README*" "*-pkg.el"))
                   :source "elpaca-menu-lock-file" :protocol https
                   :inherit t :depth treeless :ref
                   "4f774f13d34b3db9ea4ddb0b1edc070b1526ccbb"))
 (ox-pandoc :source "elpaca-menu-lock-file" :recipe
            (:package "ox-pandoc" :repo "emacsorphanage/ox-pandoc"
                      :fetcher github :files
                      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                       "doc/*.texinfo" "lisp/*.el" "docs/dir"
                       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                       (:exclude ".dir-locals.el" "test.el" "tests.el"
                                 "*-test.el" "*-tests.el" "LICENSE"
                                 "README*" "*-pkg.el"))
                      :source "elpaca-menu-lock-file" :protocol https
                      :inherit t :depth treeless :ref
                      "5766c70b6db5a553829ccdcf52fcf3c6244e443d"))
 (package-build :source "elpaca-menu-lock-file" :recipe
                (:package "package-build" :repo "melpa/package-build"
                          :fetcher github :files
                          ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                           "*.texinfo" "doc/dir" "doc/*.info"
                           "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                           "docs/dir" "docs/*.info" "docs/*.texi"
                           "docs/*.texinfo"
                           (:exclude ".dir-locals.el" "test.el"
                                     "tests.el" "*-test.el"
                                     "*-tests.el" "LICENSE" "README*"
                                     "*-pkg.el"))
                          :source "elpaca-menu-lock-file" :protocol
                          https :inherit t :depth treeless :ref
                          "af13435418a1c782460a59307b14b64e3dd4b6f2"))
 (package-lint :source "elpaca-menu-lock-file" :recipe
               (:package "package-lint" :fetcher github :repo
                         "purcell/package-lint" :files
                         (:defaults "data" (:exclude "*flymake.el"))
                         :source "elpaca-menu-lock-file" :protocol
                         https :inherit t :depth treeless :ref
                         "1c37329703a507fa357302cf6fc29d4f2fe631a8"))
 (pfuture :source "elpaca-menu-lock-file" :recipe
          (:package "pfuture" :repo "Alexander-Miller/pfuture"
                    :fetcher github :files
                    ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                     "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                     "doc/*.texinfo" "lisp/*.el" "docs/dir"
                     "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                     (:exclude ".dir-locals.el" "test.el" "tests.el"
                               "*-test.el" "*-tests.el" "LICENSE"
                               "README*" "*-pkg.el"))
                    :source "elpaca-menu-lock-file" :protocol https
                    :inherit t :depth treeless :ref
                    "19b53aebbc0f2da31de6326c495038901bffb73c"))
 (phi-search :source "elpaca-menu-lock-file" :recipe
             (:package "phi-search" :fetcher github :repo
                       "zk-phi/phi-search" :files
                       ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                        "*.texinfo" "doc/dir" "doc/*.info"
                        "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                        "docs/dir" "docs/*.info" "docs/*.texi"
                        "docs/*.texinfo"
                        (:exclude ".dir-locals.el" "test.el"
                                  "tests.el" "*-test.el" "*-tests.el"
                                  "LICENSE" "README*" "*-pkg.el"))
                       :source "elpaca-menu-lock-file" :protocol https
                       :inherit t :depth treeless :ref
                       "2caee8a353608eb41a41e794e7999a5950dbfee3"))
 (php-mode :source "elpaca-menu-lock-file" :recipe
           (:package "php-mode" :repo "emacs-php/php-mode" :fetcher
                     github :files
                     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                      "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                      "doc/*.texinfo" "lisp/*.el" "docs/dir"
                      "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                      (:exclude ".dir-locals.el" "test.el" "tests.el"
                                "*-test.el" "*-tests.el" "LICENSE"
                                "README*" "*-pkg.el"))
                     :source "elpaca-menu-lock-file" :protocol https
                     :inherit t :depth treeless :ref
                     "d9858333e42f42c1486a84bc5277e9d8e37e40cc"))
 (plantuml-mode :source "elpaca-menu-lock-file" :recipe
                (:package "plantuml-mode" :fetcher github :repo
                          "skuro/plantuml-mode" :files
                          ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                           "*.texinfo" "doc/dir" "doc/*.info"
                           "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                           "docs/dir" "docs/*.info" "docs/*.texi"
                           "docs/*.texinfo"
                           (:exclude ".dir-locals.el" "test.el"
                                     "tests.el" "*-test.el"
                                     "*-tests.el" "LICENSE" "README*"
                                     "*-pkg.el"))
                          :source "elpaca-menu-lock-file" :protocol
                          https :inherit t :depth treeless :ref
                          "348e83ff193051d5ad332642100dd704f6e2a6d2"))
 (popup :source "elpaca-menu-lock-file" :recipe
        (:package "popup" :fetcher github :repo
                  "auto-complete/popup-el" :files
                  ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                   "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                   "doc/*.texinfo" "lisp/*.el" "docs/dir"
                   "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                   (:exclude ".dir-locals.el" "test.el" "tests.el"
                             "*-test.el" "*-tests.el" "LICENSE"
                             "README*" "*-pkg.el"))
                  :source "elpaca-menu-lock-file" :protocol https
                  :inherit t :depth treeless :ref
                  "45a0b759076ce4139aba36dde0a2904136282e73"))
 (posframe :source "elpaca-menu-lock-file" :recipe
           (:package "posframe" :fetcher github :repo
                     "tumashu/posframe" :files
                     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                      "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                      "doc/*.texinfo" "lisp/*.el" "docs/dir"
                      "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                      (:exclude ".dir-locals.el" "test.el" "tests.el"
                                "*-test.el" "*-tests.el" "LICENSE"
                                "README*" "*-pkg.el"))
                     :source "elpaca-menu-lock-file" :protocol https
                     :inherit t :depth treeless :ref
                     "d93828bf6c36383c365bd564ad3bab5a4403804c"))
 (powerline :source "elpaca-menu-lock-file" :recipe
            (:package "powerline" :fetcher github :repo
                      "milkypostman/powerline" :files
                      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                       "doc/*.texinfo" "lisp/*.el" "docs/dir"
                       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                       (:exclude ".dir-locals.el" "test.el" "tests.el"
                                 "*-test.el" "*-tests.el" "LICENSE"
                                 "README*" "*-pkg.el"))
                      :source "elpaca-menu-lock-file" :protocol https
                      :inherit t :depth treeless :ref
                      "c35c35bdf5ce2d992882c1f06f0f078058870d4a"))
 (prettier-js :source "elpaca-menu-lock-file" :recipe
              (:package "prettier-js" :repo "prettier/prettier-emacs"
                        :fetcher github :files
                        ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                         "*.texinfo" "doc/dir" "doc/*.info"
                         "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                         "docs/dir" "docs/*.info" "docs/*.texi"
                         "docs/*.texinfo"
                         (:exclude ".dir-locals.el" "test.el"
                                   "tests.el" "*-test.el" "*-tests.el"
                                   "LICENSE" "README*" "*-pkg.el"))
                        :source "elpaca-menu-lock-file" :protocol
                        https :inherit t :depth treeless :ref
                        "6c074e43423e9d6c606f89c2e31a239aae9c0eca"))
 (projectile :source "elpaca-menu-lock-file" :recipe
             (:package "projectile" :fetcher github :repo
                       "bbatsov/projectile" :files
                       ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                        "*.texinfo" "doc/dir" "doc/*.info"
                        "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                        "docs/dir" "docs/*.info" "docs/*.texi"
                        "docs/*.texinfo"
                        (:exclude ".dir-locals.el" "test.el"
                                  "tests.el" "*-test.el" "*-tests.el"
                                  "LICENSE" "README*" "*-pkg.el"))
                       :source "elpaca-menu-lock-file" :protocol https
                       :inherit t :depth treeless :ref
                       "9325c45e0fd96d5421e75ad901a91ee5353e10ad"))
 (promise :source "elpaca-menu-lock-file" :recipe
          (:package "promise" :repo "chuntaro/emacs-promise" :fetcher
                    github :files
                    ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                     "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                     "doc/*.texinfo" "lisp/*.el" "docs/dir"
                     "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                     (:exclude ".dir-locals.el" "test.el" "tests.el"
                               "*-test.el" "*-tests.el" "LICENSE"
                               "README*" "*-pkg.el"))
                    :source "elpaca-menu-lock-file" :protocol https
                    :inherit t :depth treeless :ref
                    "cec51feb5f957e8febe6325335cf57dc2db6be30"))
 (protobuf-mode :source "elpaca-menu-lock-file" :recipe
                (:package "protobuf-mode" :fetcher github :repo
                          "protocolbuffers/protobuf" :files
                          ("editors/protobuf-mode.el") :source
                          "elpaca-menu-lock-file" :protocol https
                          :inherit t :depth treeless :ref
                          "0fa45b23bde831225060f3c65f17a60d7f94c1cf"))
 (rainbow-mode :source "elpaca-menu-lock-file" :recipe
               (:package "rainbow-mode" :repo
                         ("https://github.com/emacsmirror/gnu_elpa"
                          . "rainbow-mode")
                         :branch "externals/rainbow-mode" :files
                         ("*" (:exclude ".git")) :source
                         "elpaca-menu-lock-file" :protocol https
                         :inherit t :depth treeless :ref
                         "f7db3b5919f70420a91eb199f8663468de3033f3"))
 (recursive-narrow :source "elpaca-menu-lock-file" :recipe
                   (:package "recursive-narrow" :fetcher github :repo
                             "nflath/recursive-narrow" :files
                             ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                              "*.texinfo" "doc/dir" "doc/*.info"
                              "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                              "docs/dir" "docs/*.info" "docs/*.texi"
                              "docs/*.texinfo"
                              (:exclude ".dir-locals.el" "test.el"
                                        "tests.el" "*-test.el"
                                        "*-tests.el" "LICENSE"
                                        "README*" "*-pkg.el"))
                             :source "elpaca-menu-lock-file" :protocol
                             https :inherit t :depth treeless :ref
                             "5e3e2067d5a148d7e64e64e0355d3b6860e4c259"))
 (refine :source "elpaca-menu-lock-file" :recipe
         (:package "refine" :repo "Wilfred/refine" :fetcher github
                   :files
                   ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                    "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                    "doc/*.texinfo" "lisp/*.el" "docs/dir"
                    "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                    (:exclude ".dir-locals.el" "test.el" "tests.el"
                              "*-test.el" "*-tests.el" "LICENSE"
                              "README*" "*-pkg.el"))
                   :source "elpaca-menu-lock-file" :protocol https
                   :inherit t :depth treeless :ref
                   "07c1f3518fff4e363c68c0a110137756754641df"))
 (reformatter :source "elpaca-menu-lock-file" :recipe
              (:package "reformatter" :repo
                        "purcell/emacs-reformatter" :fetcher github
                        :files
                        ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                         "*.texinfo" "doc/dir" "doc/*.info"
                         "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                         "docs/dir" "docs/*.info" "docs/*.texi"
                         "docs/*.texinfo"
                         (:exclude ".dir-locals.el" "test.el"
                                   "tests.el" "*-test.el" "*-tests.el"
                                   "LICENSE" "README*" "*-pkg.el"))
                        :source "elpaca-menu-lock-file" :protocol
                        https :inherit t :depth treeless :ref
                        "c0ddac04b7b937ed56d6bf97e4bfcc4eccfa501a"))
 (request :source "elpaca-menu-lock-file"
   :recipe
   (:package "request" :repo "tkf/emacs-request" :fetcher github
             :files ("request.el") :source "elpaca-menu-lock-file"
             :protocol https :inherit t :depth treeless :ref
             "c22e3c23a6dd90f64be536e176ea0ed6113a5ba6"))
 (resize-window :source "elpaca-menu-lock-file" :recipe
                (:package "resize-window" :fetcher github :repo
                          "dpsutton/resize-window" :files
                          ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                           "*.texinfo" "doc/dir" "doc/*.info"
                           "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                           "docs/dir" "docs/*.info" "docs/*.texi"
                           "docs/*.texinfo"
                           (:exclude ".dir-locals.el" "test.el"
                                     "tests.el" "*-test.el"
                                     "*-tests.el" "LICENSE" "README*"
                                     "*-pkg.el"))
                          :source "elpaca-menu-lock-file" :protocol
                          https :inherit t :depth treeless :ref
                          "72018aa4d2401b60120588199d4cedd0dc1fbcfb"))
 (restart-emacs :source "elpaca-menu-lock-file" :recipe
                (:package "restart-emacs" :fetcher github :repo
                          "iqbalansari/restart-emacs" :files
                          ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                           "*.texinfo" "doc/dir" "doc/*.info"
                           "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                           "docs/dir" "docs/*.info" "docs/*.texi"
                           "docs/*.texinfo"
                           (:exclude ".dir-locals.el" "test.el"
                                     "tests.el" "*-test.el"
                                     "*-tests.el" "LICENSE" "README*"
                                     "*-pkg.el"))
                          :source "elpaca-menu-lock-file" :protocol
                          https :inherit t :depth treeless :ref
                          "1607da2bc657fe05ae01f7fdf26f716eafead02c"))
 (restclient :source "elpaca-menu-lock-file" :recipe
             (:package "restclient" :fetcher github :repo
                       "emacsorphanage/restclient" :files
                       ("restclient.el") :source
                       "elpaca-menu-lock-file" :protocol https
                       :inherit t :depth treeless :ref
                       "1800a4e367c250051617d0b8c16a7cbd7f47da69"))
 (restclient-helm :source "elpaca-menu-lock-file" :recipe
                  (:package "restclient-helm" :fetcher github :repo
                            "emacsorphanage/restclient" :files
                            ("restclient-helm.el") :source
                            "elpaca-menu-lock-file" :protocol https
                            :inherit t :depth treeless :ref
                            "1800a4e367c250051617d0b8c16a7cbd7f47da69"))
 (rjsx-mode :source "elpaca-menu-lock-file" :recipe
            (:package "rjsx-mode" :fetcher github :repo
                      "felipeochoa/rjsx-mode" :files
                      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                       "doc/*.texinfo" "lisp/*.el" "docs/dir"
                       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                       (:exclude ".dir-locals.el" "test.el" "tests.el"
                                 "*-test.el" "*-tests.el" "LICENSE"
                                 "README*" "*-pkg.el"))
                      :source "elpaca-menu-lock-file" :protocol https
                      :inherit t :depth treeless :ref
                      "b697fe4d92cc84fa99a7bcb476f815935ea0d919"))
 (rspec-mode :source "elpaca-menu-lock-file" :recipe
             (:package "rspec-mode" :repo "pezra/rspec-mode" :fetcher
                       github :files ("rspec-mode.el" "snippets")
                       :source "elpaca-menu-lock-file" :protocol https
                       :inherit t :depth treeless :ref
                       "29df3d081c6a1cbdf840cd13d45ea1c100c5bbaa"))
 (rubocop :source "elpaca-menu-lock-file" :recipe
          (:package "rubocop" :repo "rubocop/rubocop-emacs" :fetcher
                    github :files
                    ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                     "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                     "doc/*.texinfo" "lisp/*.el" "docs/dir"
                     "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                     (:exclude ".dir-locals.el" "test.el" "tests.el"
                               "*-test.el" "*-tests.el" "LICENSE"
                               "README*" "*-pkg.el"))
                    :source "elpaca-menu-lock-file" :protocol https
                    :inherit t :depth treeless :ref
                    "f5fd18aa810c3d3269188cbbd731ddc09006f8f5"))
 (rubocopfmt :source "elpaca-menu-lock-file" :recipe
             (:package "rubocopfmt" :fetcher github :repo
                       "jimeh/rubocopfmt.el" :files
                       ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                        "*.texinfo" "doc/dir" "doc/*.info"
                        "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                        "docs/dir" "docs/*.info" "docs/*.texi"
                        "docs/*.texinfo"
                        (:exclude ".dir-locals.el" "test.el"
                                  "tests.el" "*-test.el" "*-tests.el"
                                  "LICENSE" "README*" "*-pkg.el"))
                       :source "elpaca-menu-lock-file" :protocol https
                       :inherit t :depth treeless :ref
                       "1c6f4f1da755c9e60eb475eb9530320726904341"))
 (ruby-compilation :source "elpaca-menu-lock-file" :recipe
                   (:package "ruby-compilation" :repo
                             "eschulte/rinari" :fetcher github :files
                             ("util/ruby-compilation.el") :source
                             "elpaca-menu-lock-file" :protocol https
                             :inherit t :depth treeless :ref
                             "9b3110f4043bc4f07d83e5ada26d64f90ef68aed"))
 (ruby-refactor :source "elpaca-menu-lock-file" :recipe
                (:package "ruby-refactor" :fetcher github :repo
                          "vargonaut/ruby-refactor" :files
                          ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                           "*.texinfo" "doc/dir" "doc/*.info"
                           "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                           "docs/dir" "docs/*.info" "docs/*.texi"
                           "docs/*.texinfo"
                           (:exclude ".dir-locals.el" "test.el"
                                     "tests.el" "*-test.el"
                                     "*-tests.el" "LICENSE" "README*"
                                     "*-pkg.el"))
                          :source "elpaca-menu-lock-file" :protocol
                          https :inherit t :depth treeless :ref
                          "e6b7125878a08518bffec6942df0c606f748e9ee"))
 (ruby-tools :source "elpaca-menu-lock-file" :recipe
             (:package "ruby-tools" :repo "rejeep/ruby-tools.el"
                       :fetcher github :files
                       ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                        "*.texinfo" "doc/dir" "doc/*.info"
                        "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                        "docs/dir" "docs/*.info" "docs/*.texi"
                        "docs/*.texinfo"
                        (:exclude ".dir-locals.el" "test.el"
                                  "tests.el" "*-test.el" "*-tests.el"
                                  "LICENSE" "README*" "*-pkg.el"))
                       :source "elpaca-menu-lock-file" :protocol https
                       :inherit t :depth treeless :ref
                       "6b97066b58a4f82eb2ecea6434a0a7e981aa4c18"))
 (rust-mode :source "elpaca-menu-lock-file" :recipe
            (:package "rust-mode" :repo "rust-lang/rust-mode" :fetcher
                      github :files
                      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                       "doc/*.texinfo" "lisp/*.el" "docs/dir"
                       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                       (:exclude ".dir-locals.el" "test.el" "tests.el"
                                 "*-test.el" "*-tests.el" "LICENSE"
                                 "README*" "*-pkg.el"))
                      :source "elpaca-menu-lock-file" :protocol https
                      :inherit t :depth treeless :ref
                      "ae161dca23db7531e021205d4bee18ab8a8f3938"))
 (rust-playground :source "elpaca-menu-lock-file" :recipe
                  (:package "rust-playground" :repo
                            "grafov/rust-playground" :fetcher github
                            :files
                            ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                             "*.texinfo" "doc/dir" "doc/*.info"
                             "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                             "docs/dir" "docs/*.info" "docs/*.texi"
                             "docs/*.texinfo"
                             (:exclude ".dir-locals.el" "test.el"
                                       "tests.el" "*-test.el"
                                       "*-tests.el" "LICENSE"
                                       "README*" "*-pkg.el"))
                            :source "elpaca-menu-lock-file" :protocol
                            https :inherit t :depth treeless :ref
                            "5a117781dcb66065bea7830dd73618008fc34949"))
 (s :source "elpaca-menu-lock-file" :recipe
    (:package "s" :fetcher github :repo "magnars/s.el" :files
              ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
               "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
               "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
               "docs/*.texinfo"
               (:exclude ".dir-locals.el" "test.el" "tests.el"
                         "*-test.el" "*-tests.el" "LICENSE" "README*"
                         "*-pkg.el"))
              :source "elpaca-menu-lock-file" :protocol https :inherit
              t :depth treeless :ref
              "dda84d38fffdaf0c9b12837b504b402af910d01d"))
 (sass-mode :source "elpaca-menu-lock-file" :recipe
            (:package "sass-mode" :repo "nex3/sass-mode" :fetcher
                      github :files
                      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                       "doc/*.texinfo" "lisp/*.el" "docs/dir"
                       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                       (:exclude ".dir-locals.el" "test.el" "tests.el"
                                 "*-test.el" "*-tests.el" "LICENSE"
                                 "README*" "*-pkg.el"))
                      :source "elpaca-menu-lock-file" :protocol https
                      :inherit t :depth treeless :ref
                      "247a0d4b509f10b28e4687cd8763492bca03599b"))
 (scss-mode :source "elpaca-menu-lock-file" :recipe
            (:package "scss-mode" :repo "antonj/scss-mode" :fetcher
                      github :files
                      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                       "doc/*.texinfo" "lisp/*.el" "docs/dir"
                       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                       (:exclude ".dir-locals.el" "test.el" "tests.el"
                                 "*-test.el" "*-tests.el" "LICENSE"
                                 "README*" "*-pkg.el"))
                      :source "elpaca-menu-lock-file" :protocol https
                      :inherit t :depth treeless :ref
                      "cf58dbec5394280503eb5502938f3b5445d1b53d"))
 (seeing-is-believing :source "elpaca-menu-lock-file" :recipe
                      (:package "seeing-is-believing" :repo
                                "jcinnamond/seeing-is-believing"
                                :fetcher github :files
                                ("*.el" "*.el.in" "dir" "*.info"
                                 "*.texi" "*.texinfo" "doc/dir"
                                 "doc/*.info" "doc/*.texi"
                                 "doc/*.texinfo" "lisp/*.el"
                                 "docs/dir" "docs/*.info"
                                 "docs/*.texi" "docs/*.texinfo"
                                 (:exclude ".dir-locals.el" "test.el"
                                           "tests.el" "*-test.el"
                                           "*-tests.el" "LICENSE"
                                           "README*" "*-pkg.el"))
                                :source "elpaca-menu-lock-file"
                                :protocol https :inherit t :depth
                                treeless :ref
                                "fbbe246c0fda87bb26227bb826eebadb418a220f"))
 (shell-maker :source "elpaca-menu-lock-file" :recipe
              (:package "shell-maker" :fetcher github :repo
                        "xenodium/shell-maker" :files
                        ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                         "*.texinfo" "doc/dir" "doc/*.info"
                         "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                         "docs/dir" "docs/*.info" "docs/*.texi"
                         "docs/*.texinfo"
                         (:exclude ".dir-locals.el" "test.el"
                                   "tests.el" "*-test.el" "*-tests.el"
                                   "LICENSE" "README*" "*-pkg.el"))
                        :source "elpaca-menu-lock-file" :protocol
                        https :inherit t :depth treeless :ref
                        "eab26a7af450d3f7e83b5a61ef2b7b347700b640"))
 (shell-pop :source "elpaca-menu-lock-file" :recipe
            (:package "shell-pop" :repo "kyagi/shell-pop-el" :fetcher
                      github :files
                      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                       "doc/*.texinfo" "lisp/*.el" "docs/dir"
                       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                       (:exclude ".dir-locals.el" "test.el" "tests.el"
                                 "*-test.el" "*-tests.el" "LICENSE"
                                 "README*" "*-pkg.el"))
                      :source "elpaca-menu-lock-file" :protocol https
                      :inherit t :depth treeless :ref
                      "657171f296fc930b1f335a96e6f67ae04b731b19"))
 (shfmt :source "elpaca-menu-lock-file" :recipe
        (:package "shfmt" :fetcher github :repo "purcell/emacs-shfmt"
                  :files
                  ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                   "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                   "doc/*.texinfo" "lisp/*.el" "docs/dir"
                   "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                   (:exclude ".dir-locals.el" "test.el" "tests.el"
                             "*-test.el" "*-tests.el" "LICENSE"
                             "README*" "*-pkg.el"))
                  :source "elpaca-menu-lock-file" :protocol https
                  :inherit t :depth treeless :ref
                  "2a222c53cea5bbecf85332077521e6de8185f101"))
 (shift-number :source "elpaca-menu-lock-file" :recipe
               (:package "shift-number" :fetcher codeberg :repo
                         "ideasman42/emacs-shift-number" :files
                         ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                          "*.texinfo" "doc/dir" "doc/*.info"
                          "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                          "docs/dir" "docs/*.info" "docs/*.texi"
                          "docs/*.texinfo"
                          (:exclude ".dir-locals.el" "test.el"
                                    "tests.el" "*-test.el"
                                    "*-tests.el" "LICENSE" "README*"
                                    "*-pkg.el"))
                         :source "elpaca-menu-lock-file" :protocol
                         https :inherit t :depth treeless :ref
                         "bb14d9609fed47000b76ecc8393285abff1bb766"))
 (shrink-path :source "elpaca-menu-lock-file" :recipe
              (:package "shrink-path" :fetcher gitlab :repo
                        "bennya/shrink-path.el" :files
                        ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                         "*.texinfo" "doc/dir" "doc/*.info"
                         "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                         "docs/dir" "docs/*.info" "docs/*.texi"
                         "docs/*.texinfo"
                         (:exclude ".dir-locals.el" "test.el"
                                   "tests.el" "*-test.el" "*-tests.el"
                                   "LICENSE" "README*" "*-pkg.el"))
                        :source "elpaca-menu-lock-file" :protocol
                        https :inherit t :depth treeless :ref
                        "c14882c8599aec79a6e8ef2d06454254bb3e1e41"))
 (slim-mode :source "elpaca-menu-lock-file" :recipe
            (:package "slim-mode" :repo "slim-template/emacs-slim"
                      :fetcher github :files
                      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                       "doc/*.texinfo" "lisp/*.el" "docs/dir"
                       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                       (:exclude ".dir-locals.el" "test.el" "tests.el"
                                 "*-test.el" "*-tests.el" "LICENSE"
                                 "README*" "*-pkg.el"))
                      :source "elpaca-menu-lock-file" :protocol https
                      :inherit t :depth treeless :ref
                      "0b1b3803290f749cb85084adc75013254b513d41"))
 (smart-shift :source "elpaca-menu-lock-file" :recipe
              (:package "smart-shift" :fetcher github :repo
                        "hbin/smart-shift" :files
                        ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                         "*.texinfo" "doc/dir" "doc/*.info"
                         "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                         "docs/dir" "docs/*.info" "docs/*.texi"
                         "docs/*.texinfo"
                         (:exclude ".dir-locals.el" "test.el"
                                   "tests.el" "*-test.el" "*-tests.el"
                                   "LICENSE" "README*" "*-pkg.el"))
                        :source "elpaca-menu-lock-file" :protocol
                        https :inherit t :depth treeless :ref
                        "b9958f042f974e09a7e9442431a1f9cbd8404f8a"))
 (smartparens :source "elpaca-menu-lock-file" :recipe
              (:package "smartparens" :fetcher github :repo
                        "Fuco1/smartparens" :files
                        ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                         "*.texinfo" "doc/dir" "doc/*.info"
                         "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                         "docs/dir" "docs/*.info" "docs/*.texi"
                         "docs/*.texinfo"
                         (:exclude ".dir-locals.el" "test.el"
                                   "tests.el" "*-test.el" "*-tests.el"
                                   "LICENSE" "README*" "*-pkg.el"))
                        :source "elpaca-menu-lock-file" :protocol
                        https :inherit t :depth treeless :ref
                        "b629b4e893ba21ba5a381f6c0054bb72f8e96df2"))
 (solaire-mode :source "elpaca-menu-lock-file" :recipe
               (:package "solaire-mode" :repo
                         "hlissner/emacs-solaire-mode" :fetcher github
                         :files
                         ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                          "*.texinfo" "doc/dir" "doc/*.info"
                          "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                          "docs/dir" "docs/*.info" "docs/*.texi"
                          "docs/*.texinfo"
                          (:exclude ".dir-locals.el" "test.el"
                                    "tests.el" "*-test.el"
                                    "*-tests.el" "LICENSE" "README*"
                                    "*-pkg.el"))
                         :source "elpaca-menu-lock-file" :protocol
                         https :inherit t :depth treeless :ref
                         "e44f11a1ff7489ea7173119d62de99b88e29c918"))
 (spinner :source "elpaca-menu-lock-file" :recipe
          (:package "spinner" :repo
                    ("https://github.com/Malabarba/spinner.el"
                     . "spinner")
                    :files ("*" (:exclude ".git")) :source
                    "elpaca-menu-lock-file" :protocol https :inherit t
                    :depth treeless :ref
                    "d4647ae87fb0cd24bc9081a3d287c860ff061c21"))
 (sqlformat :source "elpaca-menu-lock-file" :recipe
            (:package "sqlformat" :fetcher github :repo
                      "purcell/sqlformat" :files
                      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                       "doc/*.texinfo" "lisp/*.el" "docs/dir"
                       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                       (:exclude ".dir-locals.el" "test.el" "tests.el"
                                 "*-test.el" "*-tests.el" "LICENSE"
                                 "README*" "*-pkg.el"))
                      :source "elpaca-menu-lock-file" :protocol https
                      :inherit t :depth treeless :ref
                      "69ef8bec3ac8c9ce4a60f20a9721e4d7a592a84d"))
 (ssass-mode :source "elpaca-menu-lock-file" :recipe
             (:package "ssass-mode" :fetcher github :repo
                       "AdamNiederer/ssass-mode" :files
                       ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                        "*.texinfo" "doc/dir" "doc/*.info"
                        "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                        "docs/dir" "docs/*.info" "docs/*.texi"
                        "docs/*.texinfo"
                        (:exclude ".dir-locals.el" "test.el"
                                  "tests.el" "*-test.el" "*-tests.el"
                                  "LICENSE" "README*" "*-pkg.el"))
                       :source "elpaca-menu-lock-file" :protocol https
                       :inherit t :depth treeless :ref
                       "96f557887ad97a0066a60c54f92b7234b8407016"))
 (ssh-config-mode :source "elpaca-menu-lock-file" :recipe
                  (:package "ssh-config-mode" :fetcher github :repo
                            "peterhoeg/ssh-config-mode-el" :files
                            (:defaults "*.txt") :source
                            "elpaca-menu-lock-file" :protocol https
                            :inherit t :depth treeless :ref
                            "d0596f5fbeab3d2c3c30eb83527316403bc5b2f7"))
 (string-edit-at-point :source "elpaca-menu-lock-file" :recipe
                       (:package "string-edit-at-point" :fetcher
                                 github :repo "magnars/string-edit.el"
                                 :old-names (string-edit) :files
                                 ("*.el" "*.el.in" "dir" "*.info"
                                  "*.texi" "*.texinfo" "doc/dir"
                                  "doc/*.info" "doc/*.texi"
                                  "doc/*.texinfo" "lisp/*.el"
                                  "docs/dir" "docs/*.info"
                                  "docs/*.texi" "docs/*.texinfo"
                                  (:exclude ".dir-locals.el" "test.el"
                                            "tests.el" "*-test.el"
                                            "*-tests.el" "LICENSE"
                                            "README*" "*-pkg.el"))
                                 :source "elpaca-menu-lock-file"
                                 :protocol https :inherit t :depth
                                 treeless :ref
                                 "87936d816ae24184dd83688136531b6b6f1943fe"))
 (string-inflection :source "elpaca-menu-lock-file" :recipe
                    (:package "string-inflection" :fetcher github
                              :repo "akicho8/string-inflection" :files
                              ("*.el" "*.el.in" "dir" "*.info"
                               "*.texi" "*.texinfo" "doc/dir"
                               "doc/*.info" "doc/*.texi"
                               "doc/*.texinfo" "lisp/*.el" "docs/dir"
                               "docs/*.info" "docs/*.texi"
                               "docs/*.texinfo"
                               (:exclude ".dir-locals.el" "test.el"
                                         "tests.el" "*-test.el"
                                         "*-tests.el" "LICENSE"
                                         "README*" "*-pkg.el"))
                              :source "elpaca-menu-lock-file"
                              :protocol https :inherit t :depth
                              treeless :ref
                              "4a2f87d7b47f5efe702a78f8a40a98df36eeba13"))
 (symbol-overlay :source "elpaca-menu-lock-file" :recipe
                 (:package "symbol-overlay" :fetcher github :repo
                           "wolray/symbol-overlay" :files
                           ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                            "*.texinfo" "doc/dir" "doc/*.info"
                            "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                            "docs/dir" "docs/*.info" "docs/*.texi"
                            "docs/*.texinfo"
                            (:exclude ".dir-locals.el" "test.el"
                                      "tests.el" "*-test.el"
                                      "*-tests.el" "LICENSE" "README*"
                                      "*-pkg.el"))
                           :source "elpaca-menu-lock-file" :protocol
                           https :inherit t :depth treeless :ref
                           "6151f4279bd94b5960149596b202cdcb45cacec2"))
 (tab-bar-notch :source "elpaca-menu-lock-file" :recipe
                (:package "tab-bar-notch" :fetcher github :repo
                          "jimeh/tab-bar-notch" :files
                          ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                           "*.texinfo" "doc/dir" "doc/*.info"
                           "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                           "docs/dir" "docs/*.info" "docs/*.texi"
                           "docs/*.texinfo"
                           (:exclude ".dir-locals.el" "test.el"
                                     "tests.el" "*-test.el"
                                     "*-tests.el" "LICENSE" "README*"
                                     "*-pkg.el"))
                          :source "elpaca-menu-lock-file" :protocol
                          https :inherit t :depth treeless :host
                          github :ref
                          "49a0f4948bc3dc51ae36b026dec89698b26c0cb2"))
 (tablist :source "elpaca-menu-lock-file" :recipe
          (:package "tablist" :fetcher github :repo
                    "emacsorphanage/tablist" :files
                    ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                     "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                     "doc/*.texinfo" "lisp/*.el" "docs/dir"
                     "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                     (:exclude ".dir-locals.el" "test.el" "tests.el"
                               "*-test.el" "*-tests.el" "LICENSE"
                               "README*" "*-pkg.el"))
                    :source "elpaca-menu-lock-file" :protocol https
                    :inherit t :depth treeless :ref
                    "fcd37147121fabdf003a70279cf86fbe08cfac6f"))
 (terraform-doc :source "elpaca-menu-lock-file" :recipe
                (:package "terraform-doc" :repo "TxGVNN/terraform-doc"
                          :fetcher github :files
                          ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                           "*.texinfo" "doc/dir" "doc/*.info"
                           "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                           "docs/dir" "docs/*.info" "docs/*.texi"
                           "docs/*.texinfo"
                           (:exclude ".dir-locals.el" "test.el"
                                     "tests.el" "*-test.el"
                                     "*-tests.el" "LICENSE" "README*"
                                     "*-pkg.el"))
                          :source "elpaca-menu-lock-file" :protocol
                          https :inherit t :depth treeless :ref
                          "31f1c47453ad14181883f78258a72c02b95d9783"))
 (terraform-mode :source "elpaca-menu-lock-file" :recipe
                 (:package "terraform-mode" :repo
                           "hcl-emacs/terraform-mode" :fetcher github
                           :files
                           ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                            "*.texinfo" "doc/dir" "doc/*.info"
                            "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                            "docs/dir" "docs/*.info" "docs/*.texi"
                            "docs/*.texinfo"
                            (:exclude ".dir-locals.el" "test.el"
                                      "tests.el" "*-test.el"
                                      "*-tests.el" "LICENSE" "README*"
                                      "*-pkg.el"))
                           :source "elpaca-menu-lock-file" :protocol
                           https :inherit t :depth treeless :ref
                           "01635df3625c0cec2bb4613a6f920b8569d41009"))
 (thrift :source "elpaca-menu-lock-file" :recipe
         (:package "thrift" :fetcher github :repo "facebook/fbthrift"
                   :files ("thrift/contrib/thrift.el") :source
                   "elpaca-menu-lock-file" :protocol https :inherit t
                   :depth treeless :ref
                   "76baffe037eea78083ebadbfb4a3481a096e1347"))
 (transient :source "elpaca-menu-lock-file" :recipe
            (:package "transient" :fetcher github :repo
                      "magit/transient" :files
                      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                       "doc/*.texinfo" "lisp/*.el" "docs/dir"
                       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                       (:exclude ".dir-locals.el" "test.el" "tests.el"
                                 "*-test.el" "*-tests.el" "LICENSE"
                                 "README*" "*-pkg.el"))
                      :source "elpaca-menu-lock-file" :protocol https
                      :inherit t :depth treeless :ref
                      "caacdd789c9ed29839c5e46c56cdfba06299e7fb"))
 (tree-sitter :source "elpaca-menu-lock-file" :recipe
              (:package "tree-sitter" :fetcher github :repo
                        "emacs-tree-sitter/elisp-tree-sitter" :branch
                        "release" :files
                        ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                         "*.texinfo" "doc/dir" "doc/*.info"
                         "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                         "docs/dir" "docs/*.info" "docs/*.texi"
                         "docs/*.texinfo"
                         (:exclude ".dir-locals.el" "test.el"
                                   "tests.el" "*-test.el" "*-tests.el"
                                   "LICENSE" "README*" "*-pkg.el"))
                        :source "elpaca-menu-lock-file" :protocol
                        https :inherit t :depth treeless :ref
                        "d12aff8ee91dcd643da0a65a3bcee7be9a3cac68"))
 (tree-sitter-langs :source "elpaca-menu-lock-file" :recipe
                    (:package "tree-sitter-langs" :repo
                              "emacs-tree-sitter/tree-sitter-langs"
                              :fetcher github :branch "release" :files
                              (:defaults "queries") :source
                              "elpaca-menu-lock-file" :protocol https
                              :inherit t :depth treeless :ref
                              "b9d7d200b24d5e4a9e6a3e9e490708c704bf4afe"))
 (treemacs :source "elpaca-menu-lock-file" :recipe
           (:package "treemacs" :fetcher github :repo
                     "Alexander-Miller/treemacs" :files
                     (:defaults "Changelog.org" "icons"
                                "src/elisp/treemacs*.el"
                                "src/scripts/treemacs*.py"
                                (:exclude "src/extra/*"))
                     :source "elpaca-menu-lock-file" :protocol https
                     :inherit t :depth treeless :ref
                     "2ab5a3c89fa01bbbd99de9b8986908b2bc5a7b49"))
 (treemacs-magit :source "elpaca-menu-lock-file" :recipe
                 (:package "treemacs-magit" :fetcher github :repo
                           "Alexander-Miller/treemacs" :files
                           ("src/extra/treemacs-magit.el") :source
                           "elpaca-menu-lock-file" :protocol https
                           :inherit t :depth treeless :ref
                           "2ab5a3c89fa01bbbd99de9b8986908b2bc5a7b49"))
 (treemacs-nerd-icons :source "elpaca-menu-lock-file" :recipe
                      (:package "treemacs-nerd-icons" :fetcher github
                                :repo
                                "rainstormstudio/treemacs-nerd-icons"
                                :files
                                ("*.el" "*.el.in" "dir" "*.info"
                                 "*.texi" "*.texinfo" "doc/dir"
                                 "doc/*.info" "doc/*.texi"
                                 "doc/*.texinfo" "lisp/*.el"
                                 "docs/dir" "docs/*.info"
                                 "docs/*.texi" "docs/*.texinfo"
                                 (:exclude ".dir-locals.el" "test.el"
                                           "tests.el" "*-test.el"
                                           "*-tests.el" "LICENSE"
                                           "README*" "*-pkg.el"))
                                :source "elpaca-menu-lock-file"
                                :protocol https :inherit t :depth
                                treeless :ref
                                "0c5ddcb978da639f01ddb023febc40fc755171e5"))
 (treemacs-projectile :source "elpaca-menu-lock-file" :recipe
                      (:package "treemacs-projectile" :fetcher github
                                :repo "Alexander-Miller/treemacs"
                                :files
                                ("src/extra/treemacs-projectile.el")
                                :source "elpaca-menu-lock-file"
                                :protocol https :inherit t :depth
                                treeless :ref
                                "2ab5a3c89fa01bbbd99de9b8986908b2bc5a7b49"))
 (treepy :source "elpaca-menu-lock-file" :recipe
         (:package "treepy" :repo "volrath/treepy.el" :fetcher github
                   :files
                   ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                    "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                    "doc/*.texinfo" "lisp/*.el" "docs/dir"
                    "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                    (:exclude ".dir-locals.el" "test.el" "tests.el"
                              "*-test.el" "*-tests.el" "LICENSE"
                              "README*" "*-pkg.el"))
                   :source "elpaca-menu-lock-file" :protocol https
                   :inherit t :depth treeless :ref
                   "651e2634f01f346da9ec8a64613c51f54b444bc3"))
 (treesit-auto :source "elpaca-menu-lock-file" :recipe
               (:package "treesit-auto" :fetcher github :repo
                         "renzmann/treesit-auto" :files
                         ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                          "*.texinfo" "doc/dir" "doc/*.info"
                          "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                          "docs/dir" "docs/*.info" "docs/*.texi"
                          "docs/*.texinfo"
                          (:exclude ".dir-locals.el" "test.el"
                                    "tests.el" "*-test.el"
                                    "*-tests.el" "LICENSE" "README*"
                                    "*-pkg.el"))
                         :source "elpaca-menu-lock-file" :protocol
                         https :inherit t :depth treeless :ref
                         "016bd286a1ba4628f833a626f8b9d497882ecdf3"))
 (tsc :source "elpaca-menu-lock-file" :recipe
      (:package "tsc" :fetcher github :repo
                "emacs-tree-sitter/elisp-tree-sitter" :branch
                "release" :files
                ("core/*.el" "core/Cargo.toml" "core/Cargo.lock"
                 "core/src")
                :source "elpaca-menu-lock-file" :protocol https
                :inherit t :depth treeless :ref
                "d12aff8ee91dcd643da0a65a3bcee7be9a3cac68"))
 (undo-fu :source "elpaca-menu-lock-file" :recipe
          (:package "undo-fu" :fetcher codeberg :repo
                    "ideasman42/emacs-undo-fu" :files
                    ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                     "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                     "doc/*.texinfo" "lisp/*.el" "docs/dir"
                     "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                     (:exclude ".dir-locals.el" "test.el" "tests.el"
                               "*-test.el" "*-tests.el" "LICENSE"
                               "README*" "*-pkg.el"))
                    :source "elpaca-menu-lock-file" :protocol https
                    :inherit t :depth treeless :ref
                    "ac67233b93a5e47088a760d6b15c254507010a2a"))
 (undo-fu-session :source "elpaca-menu-lock-file" :recipe
                  (:package "undo-fu-session" :fetcher codeberg :repo
                            "ideasman42/emacs-undo-fu-session" :files
                            ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                             "*.texinfo" "doc/dir" "doc/*.info"
                             "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                             "docs/dir" "docs/*.info" "docs/*.texi"
                             "docs/*.texinfo"
                             (:exclude ".dir-locals.el" "test.el"
                                       "tests.el" "*-test.el"
                                       "*-tests.el" "LICENSE"
                                       "README*" "*-pkg.el"))
                            :source "elpaca-menu-lock-file" :protocol
                            https :inherit t :depth treeless :ref
                            "6b9ac96b6932a4ae10737caffd39a84d4e11d683"))
 (uuidgen :source "elpaca-menu-lock-file" :recipe
          (:package "uuidgen" :fetcher github :repo "kanru/uuidgen-el"
                    :files
                    ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                     "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                     "doc/*.texinfo" "lisp/*.el" "docs/dir"
                     "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                     (:exclude ".dir-locals.el" "test.el" "tests.el"
                               "*-test.el" "*-tests.el" "LICENSE"
                               "README*" "*-pkg.el"))
                    :source "elpaca-menu-lock-file" :protocol https
                    :inherit t :depth treeless :ref
                    "cebbe09d27c63abe61fe8c2e2248587d90265b59"))
 (vertico :source "elpaca-menu-lock-file" :recipe
          (:package "vertico" :repo "minad/vertico" :files
                    (:defaults "extensions/vertico-*.el") :fetcher
                    github :source "elpaca-menu-lock-file" :protocol
                    https :inherit t :depth treeless :ref
                    "709597a39f337b8448c50c8824e34b8ce98cfaca"))
 (vmd-mode :source "elpaca-menu-lock-file" :recipe
           (:package "vmd-mode" :repo "blak3mill3r/vmd-mode" :fetcher
                     github :files
                     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                      "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                      "doc/*.texinfo" "lisp/*.el" "docs/dir"
                      "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                      (:exclude ".dir-locals.el" "test.el" "tests.el"
                                "*-test.el" "*-tests.el" "LICENSE"
                                "README*" "*-pkg.el"))
                     :source "elpaca-menu-lock-file" :protocol https
                     :inherit t :depth treeless :ref
                     "b2bdf2ab54f8fc37780e6b473e4ad69c0e9ff4a6"))
 (vterm :source "elpaca-menu-lock-file" :recipe
        (:package "vterm" :fetcher github :repo
                  "akermu/emacs-libvterm" :files
                  ("CMakeLists.txt" "elisp.c" "elisp.h"
                   "emacs-module.h" "etc" "utf8.c" "utf8.h" "vterm.el"
                   "vterm-module.c" "vterm-module.h")
                  :source "elpaca-menu-lock-file" :protocol https
                  :inherit t :depth treeless :ref
                  "a01a2894a1c1e81a39527835a9169e35b7ec5dec"))
 (vue-html-mode :source "elpaca-menu-lock-file" :recipe
                (:package "vue-html-mode" :fetcher github :repo
                          "AdamNiederer/vue-html-mode" :files
                          ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                           "*.texinfo" "doc/dir" "doc/*.info"
                           "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                           "docs/dir" "docs/*.info" "docs/*.texi"
                           "docs/*.texinfo"
                           (:exclude ".dir-locals.el" "test.el"
                                     "tests.el" "*-test.el"
                                     "*-tests.el" "LICENSE" "README*"
                                     "*-pkg.el"))
                          :source "elpaca-menu-lock-file" :protocol
                          https :inherit t :depth treeless :ref
                          "1514939804bad558584feeb6298b38d22eadf64e"))
 (vue-mode :source "elpaca-menu-lock-file" :recipe
           (:package "vue-mode" :fetcher github :repo
                     "AdamNiederer/vue-mode" :files
                     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                      "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                      "doc/*.texinfo" "lisp/*.el" "docs/dir"
                      "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                      (:exclude ".dir-locals.el" "test.el" "tests.el"
                                "*-test.el" "*-tests.el" "LICENSE"
                                "README*" "*-pkg.el"))
                     :source "elpaca-menu-lock-file" :protocol https
                     :inherit t :depth treeless :ref
                     "4853d97ea8d7b2fab7d331d3a8aad18d02b792ad"))
 (vundo :source "elpaca-menu-lock-file" :recipe
        (:package "vundo" :repo
                  ("https://github.com/casouri/vundo" . "vundo")
                  :files ("*" (:exclude ".git" "test")) :source
                  "elpaca-menu-lock-file" :protocol https :inherit t
                  :depth treeless :ref
                  "e0af8c5845abf884a644215a9cac37f39c13cd5a"))
 (web-mode :source "elpaca-menu-lock-file" :recipe
           (:package "web-mode" :repo "fxbois/web-mode" :fetcher
                     github :files
                     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                      "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                      "doc/*.texinfo" "lisp/*.el" "docs/dir"
                      "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                      (:exclude ".dir-locals.el" "test.el" "tests.el"
                                "*-test.el" "*-tests.el" "LICENSE"
                                "README*" "*-pkg.el"))
                     :source "elpaca-menu-lock-file" :protocol https
                     :inherit t :depth treeless :ref
                     "1e7694aee87722f9e51b6e39c35d175d83a1fb2c"))
 (wfnames :source "elpaca-menu-lock-file" :recipe
          (:package "wfnames" :fetcher github :repo
                    "thierryvolpiatto/wfnames" :files
                    ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                     "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                     "doc/*.texinfo" "lisp/*.el" "docs/dir"
                     "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                     (:exclude ".dir-locals.el" "test.el" "tests.el"
                               "*-test.el" "*-tests.el" "LICENSE"
                               "README*" "*-pkg.el"))
                    :source "elpaca-menu-lock-file" :protocol https
                    :inherit t :depth treeless :ref
                    "164e4efa2a96bed201a0a5402e137ebeef15bcc6"))
 (which-key :source "elpaca-menu-lock-file" :recipe
            (:package "which-key" :repo "justbur/emacs-which-key"
                      :fetcher github :files
                      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                       "doc/*.texinfo" "lisp/*.el" "docs/dir"
                       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                       (:exclude ".dir-locals.el" "test.el" "tests.el"
                                 "*-test.el" "*-tests.el" "LICENSE"
                                 "README*" "*-pkg.el"))
                      :source "elpaca-menu-lock-file" :protocol https
                      :inherit t :depth treeless :ref
                      "38d4308d1143b61e4004b6e7a940686784e51500"))
 (with-editor :source "elpaca-menu-lock-file" :recipe
              (:package "with-editor" :fetcher github :repo
                        "magit/with-editor" :files
                        ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                         "*.texinfo" "doc/dir" "doc/*.info"
                         "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                         "docs/dir" "docs/*.info" "docs/*.texi"
                         "docs/*.texinfo"
                         (:exclude ".dir-locals.el" "test.el"
                                   "tests.el" "*-test.el" "*-tests.el"
                                   "LICENSE" "README*" "*-pkg.el"))
                        :source "elpaca-menu-lock-file" :protocol
                        https :inherit t :depth treeless :ref
                        "bf6c5d9297adbf64b7f74f7472f08399312f65b4"))
 (x509-mode :source "elpaca-menu-lock-file" :recipe
            (:package "x509-mode" :fetcher github :repo
                      "jobbflykt/x509-mode" :files (:defaults "*.txt")
                      :source "elpaca-menu-lock-file" :protocol https
                      :inherit t :depth treeless :ref
                      "02e62ebd857946de629e45bff6a7de533f9022bc"))
 (xterm-color :source "elpaca-menu-lock-file" :recipe
              (:package "xterm-color" :repo "atomontage/xterm-color"
                        :fetcher github :files
                        ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                         "*.texinfo" "doc/dir" "doc/*.info"
                         "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                         "docs/dir" "docs/*.info" "docs/*.texi"
                         "docs/*.texinfo"
                         (:exclude ".dir-locals.el" "test.el"
                                   "tests.el" "*-test.el" "*-tests.el"
                                   "LICENSE" "README*" "*-pkg.el"))
                        :source "elpaca-menu-lock-file" :protocol
                        https :inherit t :depth treeless :ref
                        "86fab1d247eb5ebe6b40fa5073a70dfa487cd465"))
 (xwwp :source "elpaca-menu-lock-file" :recipe
       (:package "xwwp" :fetcher github :repo "canatella/xwwp" :files
                 ("xwwp.el" "xwwp-follow-link.el"
                  "xwwp-follow-link-ido.el")
                 :source "elpaca-menu-lock-file" :protocol https
                 :inherit t :depth treeless :ref
                 "0c875e460d1c0637766204dc289ffbd0f2284194"))
 (yaml :source "elpaca-menu-lock-file" :recipe
       (:package "yaml" :repo "zkry/yaml.el" :fetcher github :files
                 ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
                  "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
                  "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
                  "docs/*.texinfo"
                  (:exclude ".dir-locals.el" "test.el" "tests.el"
                            "*-test.el" "*-tests.el" "LICENSE"
                            "README*" "*-pkg.el"))
                 :source "elpaca-menu-lock-file" :protocol https
                 :inherit t :depth treeless :ref
                 "3fbeaee97dce3c76a18b02a28c58777cbcdadf2f"))
 (yaml-imenu :source "elpaca-menu-lock-file" :recipe
             (:package "yaml-imenu" :fetcher github :repo
                       "knu/yaml-imenu.el" :files (:defaults "*.rb")
                       :source "elpaca-menu-lock-file" :protocol https
                       :inherit t :depth treeless :ref
                       "c2f32557c11cbd402853104da8f644df4ee88434"))
 (yaml-mode :source "elpaca-menu-lock-file" :recipe
            (:package "yaml-mode" :repo "yoshiki/yaml-mode" :fetcher
                      github :files
                      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                       "doc/*.texinfo" "lisp/*.el" "docs/dir"
                       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                       (:exclude ".dir-locals.el" "test.el" "tests.el"
                                 "*-test.el" "*-tests.el" "LICENSE"
                                 "README*" "*-pkg.el"))
                      :source "elpaca-menu-lock-file" :protocol https
                      :inherit t :depth treeless :ref
                      "d91f878729312a6beed77e6637c60497c5786efa"))
 (yank-indent :source "elpaca-menu-lock-file" :recipe
              (:source "elpaca-menu-lock-file" :protocol https
                       :inherit t :depth treeless :host github :repo
                       "jimeh/yank-indent" :package "yank-indent" :ref
                       "8fe8de468f97051bf353d27f586b4f188351f558"))
 (yari :source "elpaca-menu-lock-file" :recipe
       (:package "yari" :repo "hron/yari.el" :fetcher github :files
                 ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
                  "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
                  "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
                  "docs/*.texinfo"
                  (:exclude ".dir-locals.el" "test.el" "tests.el"
                            "*-test.el" "*-tests.el" "LICENSE"
                            "README*" "*-pkg.el"))
                 :source "elpaca-menu-lock-file" :protocol https
                 :inherit t :depth treeless :ref
                 "de61285ceb21f56c29f4be12e2e65b2aa2bccf56"))
 (yasnippet :source "elpaca-menu-lock-file" :recipe
            (:package "yasnippet" :repo "joaotavora/yasnippet"
                      :fetcher github :files
                      ("yasnippet.el" "snippets") :source
                      "elpaca-menu-lock-file" :protocol https :inherit
                      t :depth treeless :ref
                      "c1e6ff23e9af16b856c88dfaab9d3ad7b746ad37"))
 (yasnippet-capf :source "elpaca-menu-lock-file" :recipe
                 (:package "yasnippet-capf" :fetcher github :repo
                           "elken/yasnippet-capf" :files
                           ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                            "*.texinfo" "doc/dir" "doc/*.info"
                            "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                            "docs/dir" "docs/*.info" "docs/*.texi"
                            "docs/*.texinfo"
                            (:exclude ".dir-locals.el" "test.el"
                                      "tests.el" "*-test.el"
                                      "*-tests.el" "LICENSE" "README*"
                                      "*-pkg.el"))
                           :source "elpaca-menu-lock-file" :protocol
                           https :inherit t :depth treeless :ref
                           "f53c42a996b86fc95b96bdc2deeb58581f48c666"))
 (yasnippet-snippets :source "elpaca-menu-lock-file" :recipe
                     (:package "yasnippet-snippets" :repo
                               "AndreaCrotti/yasnippet-snippets"
                               :fetcher github :files
                               ("*.el" "snippets" ".nosearch") :source
                               "elpaca-menu-lock-file" :protocol https
                               :inherit t :depth treeless :ref
                               "606ee926df6839243098de6d71332a697518cb86"))
 (zone-nyan :source "elpaca-menu-lock-file" :recipe
            (:package "zone-nyan" :fetcher git :url
                      "https://depp.brause.cc/zone-nyan.git" :files
                      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
                       "doc/*.texinfo" "lisp/*.el" "docs/dir"
                       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
                       (:exclude ".dir-locals.el" "test.el" "tests.el"
                                 "*-test.el" "*-tests.el" "LICENSE"
                                 "README*" "*-pkg.el"))
                      :source "elpaca-menu-lock-file" :protocol https
                      :inherit t :depth treeless :ref
                      "38b6e9f1f5871e9166b00a1db44680caa56773be"))
 (zoom-window :source "elpaca-menu-lock-file" :recipe
              (:package "zoom-window" :fetcher github :repo
                        "emacsorphanage/zoom-window" :files
                        ("*.el" "*.el.in" "dir" "*.info" "*.texi"
                         "*.texinfo" "doc/dir" "doc/*.info"
                         "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
                         "docs/dir" "docs/*.info" "docs/*.texi"
                         "docs/*.texinfo"
                         (:exclude ".dir-locals.el" "test.el"
                                   "tests.el" "*-test.el" "*-tests.el"
                                   "LICENSE" "README*" "*-pkg.el"))
                        :source "elpaca-menu-lock-file" :protocol
                        https :inherit t :depth treeless :ref
                        "48bc4629a4462a60df092657bd7356e61abe25d4")))
