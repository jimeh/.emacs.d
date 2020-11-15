# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

### [0.7.14](https://github.com/jimeh/.emacs.d/compare/v0.7.13...v0.7.14) (2020-11-15)


### Features

* **debugging:** add dap-mode with basic config for Go and Ruby ([7917f6a](https://github.com/jimeh/.emacs.d/commit/7917f6ac5689de9da63bedd477a3563d978ca66d))
* **editor:** remove hideshowvis package ([811d14f](https://github.com/jimeh/.emacs.d/commit/811d14fda0ad238b213d3e22589ff9daefbfd0b4))
* **lang:** expand golang-related env vars which are imported ([9a51b31](https://github.com/jimeh/.emacs.d/commit/9a51b31c9e23f9e1dfd6ffcfcefbd9abfeffd1e1))
* **lsp:** bind lsp-ui-doc-glance to C-c C-d instead of lsp-ui-doc-show ([3812b3d](https://github.com/jimeh/.emacs.d/commit/3812b3df296e97f3cdd1303e73352c6802172534))
* **snippets:** add Golang snippet ft "for _, tt := range tests {...}" ([5c2229c](https://github.com/jimeh/.emacs.d/commit/5c2229c80744ccc2879557b123fd8b2796e38301))

### [0.7.13](https://github.com/jimeh/.emacs.d/compare/v0.7.12...v0.7.13) (2020-11-09)


### Features

* **lang:** enable terraform-ls language server support in terraform-mode ([3adfd0c](https://github.com/jimeh/.emacs.d/commit/3adfd0c0eb138ac2bd0e47bac993fc6a6e6b905d))
* **lang:** format go-mode buffers on save with gofumpt via lsp-mode ([7ca255d](https://github.com/jimeh/.emacs.d/commit/7ca255db9cde01fd263f8517b94cc448e6bfa838))

### [0.7.12](https://github.com/jimeh/.emacs.d/compare/v0.7.11...v0.7.12) (2020-10-29)


### Features

* **misc:** add rand-ip command to insert a random IPv4 address ([3edd57c](https://github.com/jimeh/.emacs.d/commit/3edd57c7532cb8f39f6f34632bfb01ffbeaa1c4f))
* **version-control:** correctly format forge-post-mode buffers with prettier-js ([f540569](https://github.com/jimeh/.emacs.d/commit/f5405690b4276962020414ceddb0fa87bc1d61dd))

### [0.7.11](https://github.com/jimeh/.emacs.d/compare/v0.7.10...v0.7.11) (2020-10-27)


### Features

* **lang:** add print related go-mode snippets ([ea03506](https://github.com/jimeh/.emacs.d/commit/ea0350669184adcf071db7045541ac0366032c9a))
* **misc:** add various rand-* commands for generating randomized data ([60df63b](https://github.com/jimeh/.emacs.d/commit/60df63bc4912175a7dce7b24f787514af8431bcf))


### Bug Fixes

* **lang:** disable indentation highlights for Makefiles ([192499a](https://github.com/jimeh/.emacs.d/commit/192499a67b4c51acee0bb4fbe244931829d2405a))
* **lang:** properly escape } in puts debug (pd) ruby-mode snippet ([c36be86](https://github.com/jimeh/.emacs.d/commit/c36be866131ce4c86dd5b699d0d6e01858b21c0d))
* **text-editing:** enable yasnippet via global mode ([11ac1a8](https://github.com/jimeh/.emacs.d/commit/11ac1a822c7c6dcfb0c1774a676d8b7875395d15))

### [0.7.10](https://github.com/jimeh/.emacs.d/compare/v0.7.9...v0.7.10) (2020-10-15)


### Bug Fixes

* **ui:** use advice to yes-or-no-p to y-or-n-p ([f987f01](https://github.com/jimeh/.emacs.d/commit/f987f01f9a099574de64880d898297d8413d88c5))

### [0.7.9](https://github.com/jimeh/.emacs.d/compare/v0.7.8...v0.7.9) (2020-10-09)


### Features

* **editor:** add common language statements to highlight-symbol-ignore-list ([0e204bc](https://github.com/jimeh/.emacs.d/commit/0e204bc3a7a1b6a70dddf1035946b48d7b6401a4))
* **org-mode:** disable section body indentation ([499349c](https://github.com/jimeh/.emacs.d/commit/499349cf3aa0baf71bdca6014c28666b08e622b3))
* **org-mode:** enable auto-fill-mode to automatically wrap lines at 80 characters ([b1689e0](https://github.com/jimeh/.emacs.d/commit/b1689e0d79f00bc703037638007ef807598223d7))


### Bug Fixes

* **lang:** ensure golang setup works with goenv ([9d45b1a](https://github.com/jimeh/.emacs.d/commit/9d45b1a908405909910b333bb89fefc86e5e1f80))

### [0.7.8](https://github.com/jimeh/.emacs.d/compare/v0.7.7...v0.7.8) (2020-10-04)

### [0.7.7](https://github.com/jimeh/.emacs.d/compare/v0.7.6...v0.7.7) (2020-09-27)


### Features

* **lang:** add jsonnet-mode ([5937589](https://github.com/jimeh/.emacs.d/commit/5937589cc5b040875fa7435af333c4df2893b30f))
* **macos:** move files/folders to trash instead of deleting them on macOS ([bda82a9](https://github.com/jimeh/.emacs.d/commit/bda82a9c775e8f73fb3090b9316ffd724198b9ad))

### [0.7.6](https://github.com/jimeh/.emacs.d/compare/v0.7.5...v0.7.6) (2020-09-23)


### Features

* **misc:** add uuidgen package ([9c28e42](https://github.com/jimeh/.emacs.d/commit/9c28e4229f58a5448e5ed79af58b072992f43956))

### [0.7.5](https://github.com/jimeh/.emacs.d/compare/v0.7.4...v0.7.5) (2020-09-10)


### Bug Fixes

* **lang:** resolve json-snatcher issue by overriding it with a fork ([298587d](https://github.com/jimeh/.emacs.d/commit/298587d35d70743aca7ef7b8d5230a86469d1320))

### [0.7.4](https://github.com/jimeh/.emacs.d/compare/v0.7.3...v0.7.4) (2020-09-01)


### Bug Fixes

* **workspaces:** do not auto-load "default" desktop on startup ([6003c89](https://github.com/jimeh/.emacs.d/commit/6003c899945c50017be0f1c0cee9953a6c91e20b))

### [0.7.3](https://github.com/jimeh/.emacs.d/compare/v0.7.2...v0.7.3) (2020-08-28)


### Features

* **workspaces:** hide workspace name in modeline ([04b2524](https://github.com/jimeh/.emacs.d/commit/04b252438bec2ef4ef04e4808e2d21f813ae964b))
* **workspaces:** strip down frame parameters saved to desktop file ([7a1ab57](https://github.com/jimeh/.emacs.d/commit/7a1ab57606a2d7a89f370057670db11071ecaf41))
* **workspaces:** tweak tab-bar keybindings and turn on tab-bar-history-mode ([4203fdb](https://github.com/jimeh/.emacs.d/commit/4203fdb383cd32e4ad6089aa88598f5feac2f5da))


### Bug Fixes

* **native_comp:** correctly set custom comp-eln-load-path ([4e7ec6a](https://github.com/jimeh/.emacs.d/commit/4e7ec6ade80f5ac10a72beb6d67c3ea5fc737faa))
* **packages:** update package definitions to be compatible with latest straight.el ([1c81570](https://github.com/jimeh/.emacs.d/commit/1c81570ef7cf6b932b888e08467f41308a23039a))

### [0.7.2](https://github.com/jimeh/.emacs.d/compare/v0.7.1...v0.7.2) (2020-08-20)


### Features

* **windows:** use new windmove-swap-* functions on Emacs 27 and later ([dccb577](https://github.com/jimeh/.emacs.d/commit/dccb57747efe78c498951deefff0ddba2f28050d))


### Bug Fixes

* **lang:** Disable ruby-specific C-c C-b binding ([0981431](https://github.com/jimeh/.emacs.d/commit/098143191da2bf0d410dbd9ad4b00d2b72bb6ca4))
* **lang:** fix issue with json-mode when native-comp is used ([0082330](https://github.com/jimeh/.emacs.d/commit/00823307ac6d4b53f0a1f99299953be017ee69c1))
* **native_comp:** automatically delete invalid *.eln files on startup ([cb86a67](https://github.com/jimeh/.emacs.d/commit/cb86a6721f7a29b89b21f4baf6ca43586eb91176))

### [0.7.1](https://github.com/jimeh/.emacs.d/compare/v0.7.0...v0.7.1) (2020-08-18)


### Features

* **core:** add support for native-comp/gccemacs ([658daa9](https://github.com/jimeh/.emacs.d/commit/658daa99d69f493c46e439138907f7b8ff292e46))


### Bug Fixes

* **lang:** remove poly-markdown as it was glitchy ([e533a3b](https://github.com/jimeh/.emacs.d/commit/e533a3b6d5db4c53e84b558ad08d44c01616a5db))
* **projects:** ensure treemacs uses the central cache directory ([67498da](https://github.com/jimeh/.emacs.d/commit/67498da9536037ad6d7900cb7d6427203a63e0b8))
* **windows:** set zoom-window keybindings correctly ([88ab8f9](https://github.com/jimeh/.emacs.d/commit/88ab8f9007d90bab89ffc6d080b7b40322538f90))
* **workspaces:** Improve reliability of desktop restore ([4fbf607](https://github.com/jimeh/.emacs.d/commit/4fbf6079506c40ef1c5b907909b36dc9160f9e7e))

## [0.7.0](https://github.com/jimeh/.emacs.d/compare/v0.6.12...v0.7.0) (2020-08-16)


### Features

* **core:** use buffer local hl-line-mode instead of global-hl-line-mode ([7ed3e92](https://github.com/jimeh/.emacs.d/commit/7ed3e92dbb5fcbf93c231a2be2769203614043b9))
* **projects:** tweak projectile keybindings ([208394e](https://github.com/jimeh/.emacs.d/commit/208394ef00d064fa53fe08f5d157fbebae91b5da))
* **projects:** use all-the-icons in treemacs ([9bd34f8](https://github.com/jimeh/.emacs.d/commit/9bd34f805f2e073eb89e12e7c24a02cce3cfd709))
* **shell:** improve vterm-mode configuration ([a8ec880](https://github.com/jimeh/.emacs.d/commit/a8ec880b69dc5ce0d7a113d1a78054b2bd3bd7b2))
* **workspaces:** add siren-desktop module for managing emacs sessions ([5ce5740](https://github.com/jimeh/.emacs.d/commit/5ce5740b210d457b61ec7f0e8012aa31b178242b))
* **workspaces:** add siren-tab-bar module with custom tab-bar-mode setup ([c1ddbe3](https://github.com/jimeh/.emacs.d/commit/c1ddbe37aa90eb53b379e0a42a872e67195c03b8))
* **workspaces:** switch from persp-mode to tar-bar-mode and desktop ([e8f82a4](https://github.com/jimeh/.emacs.d/commit/e8f82a4b1ae602ac2e0d8f1664de18a069758d82))


### Bug Fixes

* **core:** set default-directory correctly during startup on macOS ([d80df8e](https://github.com/jimeh/.emacs.d/commit/d80df8e2d41fec779cf8ed7444646e9d7b215a23))

### [0.6.12](https://github.com/jimeh/.emacs.d/compare/v0.6.11...v0.6.12) (2020-08-11)


### Features

* **lang:** add vue-mode for working with .vue files ([d1f4e13](https://github.com/jimeh/.emacs.d/commit/d1f4e138862b203e6ef0b72c2a003fa25bfdecb6))
* **lang:** Remove robe package in favor of lsp-mode for Ruby ([4ba09d4](https://github.com/jimeh/.emacs.d/commit/4ba09d49b6019fe79fa20a257ac01ce291daf123))


### Bug Fixes

* **navigation:** Update setup for recent changes to helm ([6cca25c](https://github.com/jimeh/.emacs.d/commit/6cca25c66cc673ac6208071adc5f5f254036a599))

### [0.6.11](https://github.com/jimeh/.emacs.d/compare/v0.6.10...v0.6.11) (2020-07-21)


### Features

* **lang:** Improve markdown formatting on save ([8376b71](https://github.com/jimeh/.emacs.d/commit/8376b71b7c929c902cab3178c6eab53127abc7b0))
* **shell:** Switch shell-pop from ansi-term to vterm ([4338d85](https://github.com/jimeh/.emacs.d/commit/4338d85291bb48f247865796c9bfecf1eff1db09))


### Bug Fixes

* **workspaces:** Recent persp now works after renaming persps ([a04e57f](https://github.com/jimeh/.emacs.d/commit/a04e57f88710c3ca5a4a63c55cd59d7d46413320))

### [0.6.10](https://github.com/jimeh/.emacs.d/compare/v0.6.9...v0.6.10) (2020-07-13)


### Features

* **lang:** Set new rubocopfmt-include-unsafe-cops option to t ([7d0ff60](https://github.com/jimeh/.emacs.d/commit/7d0ff606a3895a6f46b562d50875a234d4dd97d8))


### Bug Fixes

* **helm:** Helm failure when tramp-methods variable is not defined ([2059714](https://github.com/jimeh/.emacs.d/commit/20597149bbd0fe873c4a81778c8f50d9f93d5a4f))

### [0.6.9](https://github.com/jimeh/.emacs.d/compare/v0.6.8...v0.6.9) (2020-07-04)


### Features

* **lsp:** Improve lsp-mode performance, support latest 7.x version ([efd0b42](https://github.com/jimeh/.emacs.d/commit/efd0b421e34f93cab1b990123930c1dc9877a712))

### [0.6.8](https://github.com/jimeh/.emacs.d/compare/v0.6.7...v0.6.8) (2020-07-02)


### Features

* **lang:** Enable terminal-friendly quote toggle for ruby-mode ([9b5c22f](https://github.com/jimeh/.emacs.d/commit/9b5c22f9e29726c806a7961a9b65c789e55adaf3))
* **windows:** Enable terminal friendly zoom-window keybinding ([2fa061b](https://github.com/jimeh/.emacs.d/commit/2fa061bdec7cc1c0bf7bb27736faef5dfeb23055))


### Bug Fixes

* **editor:** Make undo-tree a bit more terminal friendly ([bbc98de](https://github.com/jimeh/.emacs.d/commit/bbc98decea771ea843639cd2386ed68ac42bdcd0))
* **navigation:** Dired disk usage command was unreliable on Linux ([acb2d6f](https://github.com/jimeh/.emacs.d/commit/acb2d6f5fa7648e29895fb8b05085ac65e084f4d))

### [0.6.7](https://github.com/jimeh/.emacs.d/compare/v0.6.6...v0.6.7) (2020-06-07)


### Features

* **lang:** Add jinja2-mode for Jinja2 templates ([84bdd61](https://github.com/jimeh/.emacs.d/commit/84bdd610caa4a1cca3c2c02e26f9735340c5b102))
* **lang:** Language aware syntax highlight of markdown code-blocks ([a746106](https://github.com/jimeh/.emacs.d/commit/a74610689e2e57f5799b3fc77c080b6add5be306))
* **navigation:** Add file/directory size commands to Dired ([ecc278b](https://github.com/jimeh/.emacs.d/commit/ecc278b83ba97643a14c3b98c1e8d9b8b0fac307))


### Bug Fixes

* **lang:** Work around for whitespace-mode issue with caddyfile-mode ([1ef8570](https://github.com/jimeh/.emacs.d/commit/1ef8570f059444a0cf31da3cfe938c4a6af87a95))

### [0.6.6](https://github.com/jimeh/.emacs.d/compare/v0.6.5...v0.6.6) (2020-06-05)


### Features

* **lang:** Add caddyfile-mode for Caddy config files ([e6b52a5](https://github.com/jimeh/.emacs.d/commit/e6b52a534a9ef657734512d52101b529e2c798a0))
* **workspaces:** Improve persp-mode "UI" helpers ([984b9fb](https://github.com/jimeh/.emacs.d/commit/984b9fb3aa101e13885114637046b77827bcea29))


### Bug Fixes

* **workspaces:** Attempt to fix persp-mode forgetting persp layouts ([ca2d51b](https://github.com/jimeh/.emacs.d/commit/ca2d51bebdc651e5b036861438f54cc1c6df6191))

### [0.6.5](https://github.com/jimeh/.emacs.d/compare/v0.6.4...v0.6.5) (2020-05-30)


### Features

* **lang:** Add terraform-doc package ([e6ff06e](https://github.com/jimeh/.emacs.d/commit/e6ff06ea2c3ba07e31446ff356c92974649bc9f0))
* **windows:** Integrate windmove with tmux ([0810857](https://github.com/jimeh/.emacs.d/commit/0810857131fb2cc7103dbf26d5ed48d21c151829))


### Bug Fixes

* **lang:** terraform-mode now formats buffers on save correctly ([bf4c49d](https://github.com/jimeh/.emacs.d/commit/bf4c49dd1ff3c8dbf18a98cf3ce951d287332640))
* **themes:** Handle highlight-indent-guides when switching themes ([88ceeaa](https://github.com/jimeh/.emacs.d/commit/88ceeaa7c79ff171f62554911874d280948e148c))

### [0.6.4](https://github.com/jimeh/.emacs.d/compare/v0.6.3...v0.6.4) (2020-05-23)


### Features

* **lang:** Add module for terraform-mode package ([e4c8643](https://github.com/jimeh/.emacs.d/commit/e4c864319a75d26a4d73971d41a8baf5fd5f284d))
* **lang:** Add support for Haskell via haskell-mode ([0f13518](https://github.com/jimeh/.emacs.d/commit/0f13518f918881f1836b25aa4fab8d23d242ff5f))
* **lang:** Format shell scripts with shfmt on save ([c220e65](https://github.com/jimeh/.emacs.d/commit/c220e65a99c5f7a93df0c6450342d8b8403be996))
* **persp-mode:** Enable switching to most recent persp ([3c8fe70](https://github.com/jimeh/.emacs.d/commit/3c8fe70d8e525f67be9f19e88c33adc965e260d6))
* **text-editing:** Add reformatter package ([be39020](https://github.com/jimeh/.emacs.d/commit/be39020c64e94c79f08adc8844f06f772343a2e8))


### Bug Fixes

* **lang:** Switch back to formatting Ruby with rubocop-daemon ([aee6af6](https://github.com/jimeh/.emacs.d/commit/aee6af61289cdfe3f12e02db03676c0190034d5b))

### [0.6.3](https://github.com/jimeh/.emacs.d/compare/v0.6.2...v0.6.3) (2020-05-19)


### Features

* **lang:** Enable use of markdown-edit-code-block ([ac0bf9b](https://github.com/jimeh/.emacs.d/commit/ac0bf9b42eb85ce60c682f7961fc58dadba23cab))
* **lang:** Format ruby files with `lsp-format-buffer` ([a71fc70](https://github.com/jimeh/.emacs.d/commit/a71fc70e66ca48d8d126f2c376583bd23afde547))
* **lang:** Use rubocop-daemon to format ruby files on save ([25441f4](https://github.com/jimeh/.emacs.d/commit/25441f47d31880e4be29418da040adc7bfa28fe2))
* **lsp:** Improve lsp-mode setup with a prefix key and company tweaks ([764c4da](https://github.com/jimeh/.emacs.d/commit/764c4dae74f40ab930cf2a52d2640d668a5531d4))
* **performance:** Add explain-pause-mode ([8814bf1](https://github.com/jimeh/.emacs.d/commit/8814bf130309e4deaeff6c4eeed54a3a59ea2571))


### Bug Fixes

* **navigation:** Ensure imenu config was is set correctly ([8868e97](https://github.com/jimeh/.emacs.d/commit/8868e975e290209cabbe15cc6676e05d66ce98de))

### [0.6.2](https://github.com/jimeh/.emacs.d/compare/v0.6.1...v0.6.2) (2020-05-10)


### Features

* **editor:** Replace browse-kill-ring with helm-show-kill-ring ([cdacf31](https://github.com/jimeh/.emacs.d/commit/cdacf31ca03a959a52ee8c1cd860d0fc792ea484))


### Bug Fixes

* **lsp:** Add helm-lsp-workspace-symbol keybinding for terminal use ([a6a8452](https://github.com/jimeh/.emacs.d/commit/a6a84524bd0648f5e02869302b3142cc7e135bbf))
* **navigation:** Improve helm-ag keybindings ([decc1c5](https://github.com/jimeh/.emacs.d/commit/decc1c58c1b9da674c259826b8ad439d5ef6c04b))
* **navigation:** Improve helm-apropos usage ([c69dec3](https://github.com/jimeh/.emacs.d/commit/c69dec37bc183e26e7d43be6b3cd0ac25bb533e4))
* **navigation:** Lazy-load helm without breaking keybindings ([cb16ffe](https://github.com/jimeh/.emacs.d/commit/cb16ffe993ac991ee5ceb04f70c405468cb78304))
* **projects:** Improve helm-projectile keybindings in terminal ([cc8a76c](https://github.com/jimeh/.emacs.d/commit/cc8a76c617eab90f584b60319750a774ce2b8ab9))

### [0.6.1](https://github.com/jimeh/.emacs.d/compare/v0.6.0...v0.6.1) (2020-05-07)


### Features

* **dired:** Add dired-subtree and dired-narrow packages ([1d04474](https://github.com/jimeh/.emacs.d/commit/1d04474ab0f67fdbeaaf9f600f462b1de56c89ae))
* **dired:** Customize dired+ faces to match doom-themes ([c458d8e](https://github.com/jimeh/.emacs.d/commit/c458d8ef2faa865f4057442a257a13ec7309e872))
* **navigation:** Improve narrowing with recursive-narrow package ([801d6f1](https://github.com/jimeh/.emacs.d/commit/801d6f133a48e43aedce1159297c621f2cb77a2a))
* **navigation:** Use ripgrep instead of the_silver_searcher in helm-ag ([4869796](https://github.com/jimeh/.emacs.d/commit/4869796d6fff7a10c014540a05cf4c60c22e6c62))
* **text-editing:** Safer case change keybindings (C-x C-u, C-x C-l) ([4d447e7](https://github.com/jimeh/.emacs.d/commit/4d447e723afcb84e76121f4901e898b2fd398666))


### Bug Fixes

* **tools:** Ensure helm-make package keybinding works ([889da80](https://github.com/jimeh/.emacs.d/commit/889da809e06d700fc1303aeeae3a1d1f3b07704d))

## [0.6.0](https://github.com/jimeh/.emacs.d/compare/v0.5.0...v0.6.0) (2020-05-04)


### Features

* **completion:** Add configuration for prescient and selectrum ([07657bb](https://github.com/jimeh/.emacs.d/commit/07657bbb7307be9a4ff4fc01c1ae4174d1532118))
* **editor:** Add mwim package to replace custom function ([663852a](https://github.com/jimeh/.emacs.d/commit/663852a2107028a6ca11c03dfe2a0cfab67a0fc0))
* **editor:** Add siren-display-fill-column wrapper module ([a0a72bd](https://github.com/jimeh/.emacs.d/commit/a0a72bddc51b443b1b21b0f4233aff072ed7a951))
* **editor:** Support Emacs 27's native fill-column-indicator ([4647577](https://github.com/jimeh/.emacs.d/commit/464757740ee92d1b98dd5e76d5f7e5182f0540dc))
* **editor:** Use auto-highlight-symbol instead of highlight-symbol ([045520a](https://github.com/jimeh/.emacs.d/commit/045520a6032b5d772c1047e169e0e45e1f411d3d))
* **exports:** Add pandoc exporting to org-mode and markdown-mode ([07521a1](https://github.com/jimeh/.emacs.d/commit/07521a1e71779b38d24ebd420c67f390db4c21cb))
* **lang:** Add config for nxml-mode ([1469865](https://github.com/jimeh/.emacs.d/commit/1469865826991e3345317432b4d80f9fffec40b3))
* **lang:** Add go-gen-test package for generating tabular tests ([38e20c7](https://github.com/jimeh/.emacs.d/commit/38e20c7d62b26a560f6cd5b26d27ad49a13f8ff4))
* **lang:** Add nginx-mode and company-nginx packages ([f66d246](https://github.com/jimeh/.emacs.d/commit/f66d246337738a5fe95940fe2614b8029388ecb2))
* **lang:** Add support for AppleScript ([e65698e](https://github.com/jimeh/.emacs.d/commit/e65698ee5b40288cd18c67da8802ff0b79ef6db5))
* **lang:** Add support for TOML files via toml-mode package ([b5cb054](https://github.com/jimeh/.emacs.d/commit/b5cb0544039267adc117dd450cc8f2a79be09d6f))
* **lang:** Format all the things (almost) with prettier ([d50ffee](https://github.com/jimeh/.emacs.d/commit/d50ffee618f87a66b36e465f075ed98efc177110))
* **lang:** Format yaml files with prettier ([d4ee9cc](https://github.com/jimeh/.emacs.d/commit/d4ee9cc0ab7f0d09cee26200f3fdd9672b8f857d))
* **line-numbers:** Swap linum for built-in display-line-numbers ([392d769](https://github.com/jimeh/.emacs.d/commit/392d769816a51ad823d61c64a2ae723e937ac04a))
* **misc:** Add grip-mode to preview Markdown via GitHub's API ([801b32a](https://github.com/jimeh/.emacs.d/commit/801b32af1df2fea97f66627b7c0d6f9d882d79e0))
* **navigation:** Add config for centaur-tabs, not loaded on startup ([8730b23](https://github.com/jimeh/.emacs.d/commit/8730b23256a7eb15eb18343c11e719e3becdb936))
* **packages:** Replace package.el with straight.el ([b13ca36](https://github.com/jimeh/.emacs.d/commit/b13ca362cba3fa89a9eee707f6198997cec0429c))
* **projects:** Get treemacs working nicely with helm ([b257c7d](https://github.com/jimeh/.emacs.d/commit/b257c7d20619a8dc4b7bbf73b6749eac5d4f5a5c))
* **tools:** Add docker and kubernetes packages ([ff378e1](https://github.com/jimeh/.emacs.d/commit/ff378e13faf9cf9399a4d3ea1510b173c31e5a12))
* **tools:** Add helm-make package ([79caa36](https://github.com/jimeh/.emacs.d/commit/79caa36d95756ce7da5b81cbbb6dddda69a45329))
* **workspaces:** Enable easy re-ordering of persp-mode perspectives ([767014d](https://github.com/jimeh/.emacs.d/commit/767014dba5f86e0b1ba76404b1b010868418f134))
* **xwidgets:** Add xwidget-plus package ([c0993c8](https://github.com/jimeh/.emacs.d/commit/c0993c8c548fc61bc9ec2b8e0e1f5e603cfffd6b))


### Bug Fixes

* **core:** Auto-save folder was not being set correctly ([fdfdbc1](https://github.com/jimeh/.emacs.d/commit/fdfdbc16f4de01f09ac7cdde065d89eb477ff7d6))
* **editor:** Disable ido-everywhere ([c8802b3](https://github.com/jimeh/.emacs.d/commit/c8802b358bcd6f4fa66abf606c48b5b0b47d8655))
* **editor:** Improve reliability of undo history ([6888df4](https://github.com/jimeh/.emacs.d/commit/6888df47c64524c71dadf59693f9438227ec035e))
* **helm:** Do not defer helm-make package to ensure keybinding works ([9efa5e5](https://github.com/jimeh/.emacs.d/commit/9efa5e54e975981b768a4ce971420ade9a6db79b))
* **lang:** Remove stray invalid character causing semi-random issues ([92bc4af](https://github.com/jimeh/.emacs.d/commit/92bc4af0fca2e0f9a30a63f524db29a56ef2d801))
* **navigation:** Improve dired on macOS ([b09cc28](https://github.com/jimeh/.emacs.d/commit/b09cc28fb71dc47524393eb3c2b0284165d5a7e9))
* **org-mode:** Remove invalid confluence export-backend ([252553f](https://github.com/jimeh/.emacs.d/commit/252553fa8879b8421d49013ab493ac5ec2b68e8d))
* **vc:** Disable magit-todos package ([16264c3](https://github.com/jimeh/.emacs.d/commit/16264c3f917c9c6680856bf934aebd19af00be9b))
* **windows:** Make zoom-window package play nice with persp-mode ([1692aa1](https://github.com/jimeh/.emacs.d/commit/1692aa1944ec57b9f44be03ace639ab183ef3ad3))
* **workspaces:** Don't restore magit buffers on startup ([683ab9a](https://github.com/jimeh/.emacs.d/commit/683ab9a8a17b0550b7d97a4359a9570c30495c70))
* File associations for gitconfig-mode and dockerfile-mode ([e1d64b8](https://github.com/jimeh/.emacs.d/commit/e1d64b8d19240c3ac3138b2e6b9cd079a304fd40))
