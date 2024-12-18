# Changelog

## [0.8.52](https://github.com/jimeh/.emacs.d/compare/v0.8.51...v0.8.52) (2024-12-17)


### Features

* **language/yaml:** use yaml-ts-mode by default ([1ddc73e](https://github.com/jimeh/.emacs.d/commit/1ddc73e8a5b7074fbd9b59cb42fd0685af6ae67f))
* **workspace/easysession:** add easysession-save keybinding ([384f7fc](https://github.com/jimeh/.emacs.d/commit/384f7fcf53102d3b4a65a6876cc4e3c8c566f00f))
* **workspaces:** replace desktop.el with easysession ([cb799f3](https://github.com/jimeh/.emacs.d/commit/cb799f31e0765d920d37849fccd9d04ed7183b93))


### Bug Fixes

* **completion/company:** fix keybind conflict with copilot-mode ([c991e20](https://github.com/jimeh/.emacs.d/commit/c991e20c9927d176c42bb249f9b3ba7eca920b05))
* **langauge/ruby:** switch back to solargraph from ruby-lsp ([b665226](https://github.com/jimeh/.emacs.d/commit/b665226d48ba305847aed3ed215ef481ec9120c2))
* **language/json:** don't load json-mode at all if json-ts-mode is available ([a9c6240](https://github.com/jimeh/.emacs.d/commit/a9c6240b6253d7b731122134cb675e0ae6fe65b6))
* **language/ruby:** switch back to ruby-lsp after fixing indent-region issue ([45c41b3](https://github.com/jimeh/.emacs.d/commit/45c41b318d1f1f6f4ea668db9f134a1a21a0fc6a))
* **language/toml:** fix toml setup hook function name ([2ea3fdc](https://github.com/jimeh/.emacs.d/commit/2ea3fdc27a3272361ddd08b203c688b41ee9d7f2))
* **language/yaml:** switch back to yaml-mode ([a7fc77f](https://github.com/jimeh/.emacs.d/commit/a7fc77f52e0a54f19919a31effa94466ce0a922c))
* **workspaces/easysession:** remove save keybinding conflicting with switch-to ([396fb0f](https://github.com/jimeh/.emacs.d/commit/396fb0f8531eb2a00e9482dac632460e4f6b3b73))

## [0.8.51](https://github.com/jimeh/.emacs.d/compare/v0.8.50...v0.8.51) (2024-12-02)


### Features

* **language/css:** switch to css-ts-mode ([18db915](https://github.com/jimeh/.emacs.d/commit/18db9153dd828494ff77be08ff9c158b0ebc0d5c))
* **language/go:** switch back to go-mode from go-ts-mode ([20bfc9c](https://github.com/jimeh/.emacs.d/commit/20bfc9cfe65e5dac24c53cf56aae18363659ec1d))
* **language/json:** switch to json-ts-mode (from json-mode) ([8cb67a0](https://github.com/jimeh/.emacs.d/commit/8cb67a061892d052301e55e16d1b4fc5315c09bd))
* **language/json:** switch to lua-ts-mode (from lua-mode) ([1bdd231](https://github.com/jimeh/.emacs.d/commit/1bdd2316c7ef21393e53b73455bc47f45a67a5a9))
* **language/lua:** enable lsp-mode in lua-ts-mode ([ef99f6a](https://github.com/jimeh/.emacs.d/commit/ef99f6aedcc8d4bc49bd40c6b00662478cbca64a))
* **language/php:** format PHP files with prettier ([fe04f68](https://github.com/jimeh/.emacs.d/commit/fe04f68948989c31e0aba3e9a11d50c40079199f))
* **language/php:** switch to php-ts-mode ([c01da3c](https://github.com/jimeh/.emacs.d/commit/c01da3c3b79e08646bde2ba810e03e2c40716838))
* **language/ruby:** switch from solargraph to ruby-lsp ([fac7bb0](https://github.com/jimeh/.emacs.d/commit/fac7bb0426690b66eeb0ae9e6900984496596068))
* **language/rust:** switch to rust-ts-mode ([6a07ee4](https://github.com/jimeh/.emacs.d/commit/6a07ee49d1737eaaf2d1ebb9db775601214f80f9))
* **language/scss:** format scss-mode with prettier ([c7ff9e1](https://github.com/jimeh/.emacs.d/commit/c7ff9e177a5e5719143e120d4636e0422cd88486))
* **language/toml:** switch to toml-ts-mode and enable lsp-mode as well ([074ac91](https://github.com/jimeh/.emacs.d/commit/074ac916ab172599be3c8db2d04c2137f3b4f374))
* **language/typescript:** format typescript-ts-mode and tsx-ts-mode with prettier ([931312e](https://github.com/jimeh/.emacs.d/commit/931312e1189cf9fb5a845f71cddf3c035307d87c))
* **projects:** add projectile switch project keybind that creates new tab-bar tab if needed ([c3bc47a](https://github.com/jimeh/.emacs.d/commit/c3bc47ab472e057a8917f3777739a00792979e61))
* **treesit:** install grammars to custom directory ([3edd8e6](https://github.com/jimeh/.emacs.d/commit/3edd8e647e9bb4311c50b79806fcdc24bb873301))
* **version-control/magic:** use git-commit-ts-mode ([983ccd3](https://github.com/jimeh/.emacs.d/commit/983ccd3c2718addec4cb91d6993ca05019138983))


### Bug Fixes

* **editor/origami:** add missing major modes ([9313f84](https://github.com/jimeh/.emacs.d/commit/9313f84d51e581a9188683b3f90bb1a678c7e35d))
* **language/go:** ensure tree-sitter grammar correctly ([0c12470](https://github.com/jimeh/.emacs.d/commit/0c124709b9ec1d2f6c9ec991a65280f371002db7))
* **language/ruby:** setup inf-ruby in ruby-ts-mode ([5cd13c6](https://github.com/jimeh/.emacs.d/commit/5cd13c64def364a81985d1269418c5ef1b1dfea7))
* **language/scss:** prevent tree-sitter-mode from activating in scss-mode ([efd3bf1](https://github.com/jimeh/.emacs.d/commit/efd3bf1dde9ed10d5b4c47ba6be415549509f1ef))
* **language/toml:** switch back to conf-toml-mode from toml-ts-mode ([055cbac](https://github.com/jimeh/.emacs.d/commit/055cbac42c1a5bc58057fd5ab92ad4473a63e367))
* **vendor/flycheck-erblint:** add missing variable definition ([def8719](https://github.com/jimeh/.emacs.d/commit/def871988fc97f749c608072e7311443d199a371))
* **vendor/flycheck-erblint:** fix command name ([52ed1dd](https://github.com/jimeh/.emacs.d/commit/52ed1ddc82d65c22d5048e7b77e11d32a8a2ec5b))


### Performance Improvements

* **lsp:** use plists to improve lsp-mode performance ([6239738](https://github.com/jimeh/.emacs.d/commit/623973802b2e9a347876dea94defacc7be54ad6f))

## [0.8.50](https://github.com/jimeh/.emacs.d/compare/v0.8.49...v0.8.50) (2024-10-21)


### Features

* **ai:** tweak chatgpt and gptel setup ([de9fee4](https://github.com/jimeh/.emacs.d/commit/de9fee487566b32c770f77a7d2589f304c8c39e8))
* **copilot:** disable copilot-mode in *scratch* buffers ([c5f6383](https://github.com/jimeh/.emacs.d/commit/c5f6383c7eace66a21f8903137b067745a2cf72e))
* **core:** add siren list manipulation helper functions ([2b4c3a2](https://github.com/jimeh/.emacs.d/commit/2b4c3a2d7a378978ed7bd4366f8c5eac8578ff30))
* **language/erb:** setup linting and formatting of ERB files via erblint ([d0ef255](https://github.com/jimeh/.emacs.d/commit/d0ef2559062cb42d97579a2e2416328cfc159208))
* **language/go:** basic prep and setup to test go-ts-mode ([224a6f6](https://github.com/jimeh/.emacs.d/commit/224a6f659ad5d4b6602ae2e24f8a1bc9bee69157))
* **language/go:** enable lsp-mode in go.mod and go.work files ([e97183e](https://github.com/jimeh/.emacs.d/commit/e97183ee71cd64679b4e83f18c5cd9730dc5feb8))
* **language/go:** remove inlay hints and add commended out gopls debug settings ([9fdf08a](https://github.com/jimeh/.emacs.d/commit/9fdf08a804bb08ec190f9c6aa245be4299b06d22))
* **language/go:** switch to go-ts-mode ([814347d](https://github.com/jimeh/.emacs.d/commit/814347dbb246368c836034ba477637e6bfeb193b))
* **language/ruby:** improve and customize ruby-ts-mode setup ([ea76214](https://github.com/jimeh/.emacs.d/commit/ea7621478ed132bc0549d1bd1ae0a6aa217e6bcc))
* **language/ruby:** switch to ruby-ts-mode ([3cae3d9](https://github.com/jimeh/.emacs.d/commit/3cae3d93bf11da129d557a3cad946539d3fa5dff))
* **language/ruby:** various tweaks for testing ruby-ts-mode and other improvements ([72cf922](https://github.com/jimeh/.emacs.d/commit/72cf92293e2ce3e15baeb7557da2b76fa3d80202))
* **language/terraform:** re-enable lsp-mode, seems more stable now ([ca739ba](https://github.com/jimeh/.emacs.d/commit/ca739bac8089cc108269f76a207f741812c8fb4b))
* **snippets/sh-mode:** add custom snippets ([b3a998a](https://github.com/jimeh/.emacs.d/commit/b3a998a83fc9138fa9cfc32af81af65b056af04f))
* **themes/doom-themes-overrides:** improve lsp-highlight and symbol-overlay ([e0b771b](https://github.com/jimeh/.emacs.d/commit/e0b771bf121d7334b4cb47f8b2ab27f15087f88c))


### Bug Fixes

* **completion/yasnippet:** fix completion issues caused by yasnippet ([f70de31](https://github.com/jimeh/.emacs.d/commit/f70de31989dcee709c545599e3eb33f449ddd5f0))
* **language/toml:** switch back to conf-toml-mode ([9ba69c8](https://github.com/jimeh/.emacs.d/commit/9ba69c8e626ea2b4aedfc74b143f8625db0bee46))
* **language/yaml:** define custom tree-sitter queries ([1dfd9d2](https://github.com/jimeh/.emacs.d/commit/1dfd9d28a059cf28a2ef595756b68f2a16bc0fae))
* **language/yaml:** provide filename to actionlint linter ([9e6ce1e](https://github.com/jimeh/.emacs.d/commit/9e6ce1eaa8c503175d60f8b8238451d469bcb6eb))
* **org-mode:** remove custom tab-width setting ([4cff1f7](https://github.com/jimeh/.emacs.d/commit/4cff1f760ba1dbe4f01b3b8ee377a4cea3e6d4a4))
* **org-mode:** remove setting causing error in latest nightly builds ([7d4fbe3](https://github.com/jimeh/.emacs.d/commit/7d4fbe39159136c07bd9f2ac6105ea722e38aba6))
* **package/refine:** use fork of refine with fixes ([dec4586](https://github.com/jimeh/.emacs.d/commit/dec45868d37cb450f9b982bece29bf039365d2cc))
* **text-editing/smartparens:** disable navigate action on {} pair ([2dfc86b](https://github.com/jimeh/.emacs.d/commit/2dfc86b61013cfb3dd5bbf4281986bdc59b61df8))


### Reverts

* **text-editing/smartparens:** disable navigate action on {} pair ([64d520c](https://github.com/jimeh/.emacs.d/commit/64d520c1d508965977a7355487b9986bcf98fc86))

## [0.8.49](https://github.com/jimeh/.emacs.d/compare/v0.8.48...v0.8.49) (2024-05-12)


### Features

* **ai/chatgpt:** add more models and use gpt-4-turbo-preview as default ([7dfc8b5](https://github.com/jimeh/.emacs.d/commit/7dfc8b575bbf6b2fee0f5f50d17587adeb1fef6b))
* **ai/chatgpt:** use the same API key for all models ([ac621b3](https://github.com/jimeh/.emacs.d/commit/ac621b3103c4a83d9b62b39ab411c5eb877a9ed6))
* **core/linux:** maximize window after finished loading ([ed2c051](https://github.com/jimeh/.emacs.d/commit/ed2c051ea1e1670f06d392095bc900695510e3c7))
* **editor/env:** switch from direnv package to envrc and mise ([6e9307d](https://github.com/jimeh/.emacs.d/commit/6e9307d61647467d95becc80e0c8aa29a3559c46))
* **version-control/magit:** add convention-commit package ([d608d96](https://github.com/jimeh/.emacs.d/commit/d608d968e4cd553348bce5d28d0f1543faba5d1f))


### Bug Fixes

* **completion/copilot:** ignore buffers which name start with *temp* ([a1ce447](https://github.com/jimeh/.emacs.d/commit/a1ce4473871022981b198aef5effb711c0b34ee7))
* **completion/copilot:** update config name after rename in package ([d97e02d](https://github.com/jimeh/.emacs.d/commit/d97e02dbb8865e6914baf0b378407097aca5c10d))
* **language/terraform:** disable lsp-mode and tree-sitter-mode ([6faa4d9](https://github.com/jimeh/.emacs.d/commit/6faa4d9f658697b1d31e91445cbe91d30cce48a3))

## [0.8.48](https://github.com/jimeh/.emacs.d/compare/v0.8.47...v0.8.48) (2024-02-01)


### Features

* **lsp:** disable inlay hints ([20ca877](https://github.com/jimeh/.emacs.d/commit/20ca8776a95d549d47d40214d0aa3b0866ae8f1c))
* **navigation/dired:** set dirvish to use nerd-icons instead of all-the-icons ([edf65c2](https://github.com/jimeh/.emacs.d/commit/edf65c2132392ad9e7efd58885d2a86a6113b2d6))
* **projects/treemacs:** use nerd-icons instead of all-the-icons ([3735e52](https://github.com/jimeh/.emacs.d/commit/3735e52a0cc02e9cb8d5c4f67aa0a89f28b8514e))


### Bug Fixes

* **formatting/prettier:** use prettier-pnp instead of prettier ([63f6e3f](https://github.com/jimeh/.emacs.d/commit/63f6e3fa41ce7f7ce32d75eeef89f4ce918bffb4))
* **nativation/dirvish:** use fork with fix for issue with Emacs 30.x ([434d13d](https://github.com/jimeh/.emacs.d/commit/434d13dd0e8995459bfb81ddb71a83e67920b197))
* **projects/projectile:** improve projectile-find-file tweak ([a650199](https://github.com/jimeh/.emacs.d/commit/a65019935ae2c638010d03edbddd96b613c93ee0))

## [0.8.47](https://github.com/jimeh/.emacs.d/compare/v0.8.46...v0.8.47) (2023-12-15)


### Features

* **editor:** disable indentation highlight guides ([862b7fc](https://github.com/jimeh/.emacs.d/commit/862b7fc26e94542cdea7e88c9f8f529daaa7c9c6))
* **misc:** add helper command to display list of available fonts ([c6d5682](https://github.com/jimeh/.emacs.d/commit/c6d5682037b54886ccc679ea78f0833083d9f0d6))


### Bug Fixes

* **completion/copilot:** disable annoying keybinding while overlay is visible ([b9e9a13](https://github.com/jimeh/.emacs.d/commit/b9e9a13eb9c4bc52a0e9075289973d2d82052b03))
* **copilot:** suppress warnings about indentation detection ([58e9cc1](https://github.com/jimeh/.emacs.d/commit/58e9cc1af13e0962cf7b6fc0890d12a081ff1076))
* **editor/fussy:** improve completion performance and simplify setup ([e74a3bd](https://github.com/jimeh/.emacs.d/commit/e74a3bd3ad3f663eb448baa581a85d8edc90e7de))
* **language/dockerfile:** use dockerfile-mode again ([e5efb2d](https://github.com/jimeh/.emacs.d/commit/e5efb2d19047635bd4f84df7662baa6beb4ce50f))
* **language/go:** disable lsp semantic tokens ([07794bb](https://github.com/jimeh/.emacs.d/commit/07794bb8bef0d51b5bf16bacb3e7a170bbbc8b88))
* **language/vue:** fix vue-mode setup by running prog-mode-hook ([527934d](https://github.com/jimeh/.emacs.d/commit/527934de93e5c23acd54e2133b679dc2e21c73ea))
* **text-editing/treesit:** ensure treesit and related packages are loaded correctly ([0053382](https://github.com/jimeh/.emacs.d/commit/0053382b787c595bd60313b60e9400f0789187ea))
* **text-editing/treesit:** resolve issues with treesit-auto package ([df10665](https://github.com/jimeh/.emacs.d/commit/df10665d0c4b72619352e08ff6207da0cc0c3e2e))

## [0.8.46](https://github.com/jimeh/.emacs.d/compare/v0.8.45...v0.8.46) (2023-11-16)


### Features

* **completion/copilot:** add useful keybindings when overlay is active ([d54f89a](https://github.com/jimeh/.emacs.d/commit/d54f89af23827441d47c8554ea88dcc1fdf8accf))
* **editor/doom-modeline:** override flycheck/flymake "ok" icon ([2212a5e](https://github.com/jimeh/.emacs.d/commit/2212a5eb1330b40c712578ee98e5c7c6bfeb9da6))
* **editor/treesit:** expand treesit highlight features to max ([400ba2c](https://github.com/jimeh/.emacs.d/commit/400ba2c37c5fe5b7c4a2a95473c863ff025aa8e5))
* **language/go:** expand lsp-golangci-lint to a proper lsp-mode client ([01c5018](https://github.com/jimeh/.emacs.d/commit/01c5018702c81be9e6eeaad2045498b1670810f9))
* **language/protobuf:** enable use of bufls language server ([359e692](https://github.com/jimeh/.emacs.d/commit/359e692d8e4b8960b1f02fa5a3213ff4b9d0ae40))
* **language/ruby:** remove rufo, as I haven't used it for years ([70a5d0f](https://github.com/jimeh/.emacs.d/commit/70a5d0f0afd335a12b2ee0e3caeb7585d505d01e))
* **language/typescript:** enable lsp-format-on-save ([de391e0](https://github.com/jimeh/.emacs.d/commit/de391e00ea4b006055fb680ffab497ea269f4ae8))
* **language/xml:** add xmllint formatter setup and bind to C-c C-f ([d405e96](https://github.com/jimeh/.emacs.d/commit/d405e962da1da9b3a912f768715f8cd5a7a32ab0))
* **lsp:** expand list of ignored watch directories ([0dd1ded](https://github.com/jimeh/.emacs.d/commit/0dd1dedf99702a4f5f6569f380bd51e3d7cfe3ad))
* **macbook-notch:** switch from vendored tab-bar-notch to standalone repo ([f1c5602](https://github.com/jimeh/.emacs.d/commit/f1c56020d4a7cd2caa85f3d033e8a2dd1d54e52d))
* **theme/override:** invert tab-bar active/inactive background colors ([f070c1b](https://github.com/jimeh/.emacs.d/commit/f070c1bdae29898d948e2df1ff268daad46152f5))
* **ui/macos:** shift buffer content below display notch on modern MacBook Pro models ([fcc2321](https://github.com/jimeh/.emacs.d/commit/fcc23217456624369dccc0de4c0c421735a13770))
* **vendor/lsp-golangci-lint:** add option for passing --fast flag ([9ca7035](https://github.com/jimeh/.emacs.d/commit/9ca7035ee33abfa9cfe55778601b130a1e97afda))
* **vendor/tab-bar-notch:** add support for 16-inch MacBook Pro models ([4e64dc3](https://github.com/jimeh/.emacs.d/commit/4e64dc3b340768c653266482562b58dc67c644c3))


### Bug Fixes

* **completion/copilot:** fix issue with company compat tweak ([8612ae4](https://github.com/jimeh/.emacs.d/commit/8612ae4fc6103052678a1d5e49e9f2eab4c83b12))
* **language/dockerfile:** ensure hadolint executable is found ([a64284d](https://github.com/jimeh/.emacs.d/commit/a64284d754b2e8845dfae3c600d3593dde1cb44f))
* **language/go:** correctly set go-test-args variable ([c452150](https://github.com/jimeh/.emacs.d/commit/c4521500d1b39da9cdc40a1d4fbeef9aa8227401))
* **language/ruby:** prevent use of lsp-rename in ruby buffers ([f30f8ab](https://github.com/jimeh/.emacs.d/commit/f30f8ab728bd3083e4fbc0f05d86484fca56ac2d))
* **language/terraform:** fix setup func name typo to avoid conflict with rust ([b0cc7be](https://github.com/jimeh/.emacs.d/commit/b0cc7be1639200165842a2adc3866e80d6ae9a95))
* **language/typescript:** disable lsp-semantic-tokens ([a10f797](https://github.com/jimeh/.emacs.d/commit/a10f797d4228c62c678a58e2533564fca779a568))
* **language/typescript:** ensure it loads correctly ([de1fd38](https://github.com/jimeh/.emacs.d/commit/de1fd38481ef653c0f9456b0bdea414aba97cdb2))
* **projects/projectile:** fix issue where incorrect completion style may be used ([69c3445](https://github.com/jimeh/.emacs.d/commit/69c34452953843c43b099c171e6693757e7147cd))
* **vendor/tab-bar-notch:** correctly calculate notch height on 16-inch displays ([c1e5828](https://github.com/jimeh/.emacs.d/commit/c1e5828e6f9f1556b48e82ad5af152a53bb7e30b))

## [0.8.45](https://github.com/jimeh/.emacs.d/compare/v0.8.44...v0.8.45) (2023-05-23)


### Features

* **language/csv:** add setup for csv-mode ([431692a](https://github.com/jimeh/.emacs.d/commit/431692af1a02cf364de0e7700046d384864009f4))
* **navigation/dirvish:** bind C-b to dirvish-subtree-up ([9a02511](https://github.com/jimeh/.emacs.d/commit/9a02511fd07ed7226d48c6b3f1f979f5400d4dc7))
* **themes/doom-overrides:** set dirvish-hl-line to a more subtle background ([62a0b29](https://github.com/jimeh/.emacs.d/commit/62a0b2926ef6493c32b7827a1de30be1b1dd940c))


### Bug Fixes

* **macos:** hide all child frames when toggling non-native fullscreen ([0878780](https://github.com/jimeh/.emacs.d/commit/08787800a3d668fad2d8fcc8815f33a30bc78687))
* **text-editing/treesit:** correctly load on versions of Emacs without built-in treesit ([762f2ca](https://github.com/jimeh/.emacs.d/commit/762f2ca733a421ddd3d84d57913deeda348bb3ed))

## [0.8.44](https://github.com/jimeh/.emacs.d/compare/v0.8.43...v0.8.44) (2023-05-15)


### Features

* **core:** update font selection preferring Nerd Font Mono ([f5ce193](https://github.com/jimeh/.emacs.d/commit/f5ce19323935209f7a810ac26b0d462f080f0b07))
* **editor:** replace nearly all use of all-the-icons with nerd-icons ([0b63d36](https://github.com/jimeh/.emacs.d/commit/0b63d3607d895a1f91078a24938619bf8083641d))
* **language/yaml:** lint GitHub Action workflows with actionlint ([15278d5](https://github.com/jimeh/.emacs.d/commit/15278d5abef01dbafde04d46b45092c3125e6e0e))
* **navigation:** add dirvish and have it override/enhance dired ([1729317](https://github.com/jimeh/.emacs.d/commit/1729317cd870fca21d55c2a036deaa2732891884))
* **theme:** add nerd-icons definitions to overrides theme ([f861ad0](https://github.com/jimeh/.emacs.d/commit/f861ad06e82170e9ba9ae7543b002c9c4f58c8fe))


### Bug Fixes

* **completion/marginalia:** improve issues with project-buffer annotations ([4654ea5](https://github.com/jimeh/.emacs.d/commit/4654ea5e803f0a062184473a96c0efaf45d3da77))


### Reverts

* **completion/copilot:** temporarily pin copilot.el ([0dac271](https://github.com/jimeh/.emacs.d/commit/0dac2718c1858822dac5e14c37636f42b4bd302b))

## [0.8.43](https://github.com/jimeh/.emacs.d/compare/v0.8.42...v0.8.43) (2023-05-09)


### Features

* **completion/company:** remove old fci-mode workaround ([a0b7a80](https://github.com/jimeh/.emacs.d/commit/a0b7a80985870c84d1c9a3b3670b2bbf594bb52e))
* **completion/siren:** enable shift+tab keybinding in terminal ([e8cdcae](https://github.com/jimeh/.emacs.d/commit/e8cdcaebe91fdffa786b58793974a76bf09fc987))
* **editor:** try snap-indent as a replacement for yank-indent ([3bd155c](https://github.com/jimeh/.emacs.d/commit/3bd155cb799e8ca4af8c0873aa767f61dee9f5bf))
* **icons:** use nerd-fonts to display icons in terminals ([a78e417](https://github.com/jimeh/.emacs.d/commit/a78e417e6f3f2ad4ebf5ecbfe18322a5102f4f43))
* **language/go:** enable extra gopls analyzers and code lenses ([05c45be](https://github.com/jimeh/.emacs.d/commit/05c45bee59296cc2863299422e4bda573fc34229))
* **language/lua:** enable tree-sitter-mode ([20457dc](https://github.com/jimeh/.emacs.d/commit/20457dc99fb427ae1210060fa79c796c8377c500))
* **language/lua:** improve lsp-mode setup and set tab-width to 2 ([c137dde](https://github.com/jimeh/.emacs.d/commit/c137dde815956459183eba2b714769c3fab181cc))
* **language/markdown:** enable tree-sitter-mode ([67a8b43](https://github.com/jimeh/.emacs.d/commit/67a8b439f5fb279ec23e2f9150acfdf716b84c3a))
* **language/nix:** enable tree-sitter-mode ([c3dd1fe](https://github.com/jimeh/.emacs.d/commit/c3dd1fe68a8de7122426ccbc5cef942c590a6155))
* **language/php:** enable tree-sitter-mode ([d7494f5](https://github.com/jimeh/.emacs.d/commit/d7494f5147fb3d1cfe5d931a44c2ab61a79c24e0))
* **language/python:** enable tree-sitter-mode ([d30d2e3](https://github.com/jimeh/.emacs.d/commit/d30d2e340bacdd1237abfcbda7c052041941fb10))
* **lsp:** enable inlay hints ([5d65b32](https://github.com/jimeh/.emacs.d/commit/5d65b32d1a5f0e1b51e41401e89f047951696bc1))
* **projects/treemacs:** disable project-follow mode ([e9da1ea](https://github.com/jimeh/.emacs.d/commit/e9da1ea174aefbfa1d9549a24fa6b5b7e3c2e41d))
* **projects:** add "elpaca" to list of ignored projectile directories ([ee04435](https://github.com/jimeh/.emacs.d/commit/ee044356a3fc829ec3aea04c7df80510fd435a64))
* **text-editing:** remove excess keybindings for smart-shift ([f7e9abb](https://github.com/jimeh/.emacs.d/commit/f7e9abbcb11aa8798914b20ccc664cbb8e56afc2))


### Bug Fixes

* **completion/copilot:** temporarily pin copilot.el ([bc8a2a4](https://github.com/jimeh/.emacs.d/commit/bc8a2a40e74dac1f99cec167f9ae128f72c5d88f))
* **formatting/preffier:** don't use preffier in rjsx-mode specifically ([dd26296](https://github.com/jimeh/.emacs.d/commit/dd262969632a6866f90b7ba22bb08a05c8c5a0c0))
* **language/go:** fix go-playground setup ([6434035](https://github.com/jimeh/.emacs.d/commit/6434035d60a3b121c60e2f08692e72dacaacea9c))
* **magit/forge:** fix error when attempting to edit a PR description ([956dc88](https://github.com/jimeh/.emacs.d/commit/956dc88505a137181057a1e0adcc2f5e30d28f65))
* pin doom-modeline to last all-the-icons supported commit ([e45fce6](https://github.com/jimeh/.emacs.d/commit/e45fce668552a2887e7668f1979ab0f50f32b0aa))
* **tools:** resolve require issues makefile-executor setup ([e8cca90](https://github.com/jimeh/.emacs.d/commit/e8cca905c31c665e93345646ce3c732cb9da4fef))
* **windows:** allow window switching keybindings to work in dired ([4526952](https://github.com/jimeh/.emacs.d/commit/4526952932b32c0440a2bc98f833065cb6dbf647))

## [0.8.42](https://github.com/jimeh/.emacs.d/compare/v0.8.41...v0.8.42) (2023-04-18)


### Features

* **ai/chatgpt:** all per-model API key configuration in shared setup ([d0d604b](https://github.com/jimeh/.emacs.d/commit/d0d604bbc7f65fc34f7c6d0ba3f2480504034a2a))
* **language/markdown:** add details snippet ([66efcdb](https://github.com/jimeh/.emacs.d/commit/66efcdb8a082a4f8cb89f22720303805e0e74ae1))

## [0.8.41](https://github.com/jimeh/.emacs.d/compare/v0.8.40...v0.8.41) (2023-04-16)


### Features

* **ai/chatgpt:** improvements with a focus on gptel and chatgpt-shell packages ([4f32191](https://github.com/jimeh/.emacs.d/commit/4f32191983b2ba87c695728e5995bc1e4fd8004f))

## [0.8.40](https://github.com/jimeh/.emacs.d/compare/v0.8.39...v0.8.40) (2023-04-16)


### Features

* **core/macos:** add C-s-<return> alternative binding for fullscreen toggle ([f058bee](https://github.com/jimeh/.emacs.d/commit/f058bee1dfdd9d6e17d2527ee3bad858545d47f6))
* **editor:** add custom yank-indent package ([0eedc37](https://github.com/jimeh/.emacs.d/commit/0eedc37603c4b6f16ed5d6cf83184090ee100bce))
* **formatting:** enable prettier-js-mode in toml files ([ede5843](https://github.com/jimeh/.emacs.d/commit/ede5843bd719ccb6c8fd1c54dc38083817558e01))
* **language/conf:** handle .tool-versions files with conf-mode ([98c0d16](https://github.com/jimeh/.emacs.d/commit/98c0d16b23d10d5c6bb68a2cadabe5f260bc3ca4))
* **language/go:** enable gotest to pass GOLDEN_UPDATE=1 env var ([0886d77](https://github.com/jimeh/.emacs.d/commit/0886d77f321898e383090ee1766f3ceb06cd9e0b))
* **language/lua:** set tab-width to 4 ([201bb6d](https://github.com/jimeh/.emacs.d/commit/201bb6d394315a20afeb09ad4f31fba86642343f))
* **language/terraform:** use lsp-mode in terraform buffers ([42ed25d](https://github.com/jimeh/.emacs.d/commit/42ed25d16558bbfa49bbd10bedcbaaa1d5b9d414))
* **language/toml:** use toml-ts-mode if available ([7f618b3](https://github.com/jimeh/.emacs.d/commit/7f618b309cdd801aea03f8fdb4abee50389fbf8a))
* **lsp:** disable semantic tokens in Dockerfile and JS files ([e4f9e00](https://github.com/jimeh/.emacs.d/commit/e4f9e002623872bd6044499769036d254d0b5e5e))
* **misc/chatgpt:** swap out ChatGPT related packages ([3da4562](https://github.com/jimeh/.emacs.d/commit/3da4562bb6b8312a78f100cd212dc2901d3000fa))
* **projects/treemacs:** disable lsp-treemacs-sync-mode ([5239dac](https://github.com/jimeh/.emacs.d/commit/5239dacc5e2ee776a3b0ecc8813ead9dec671247))
* **projects/treemacs:** enable treemacs-project-follow-mode ([90d98d7](https://github.com/jimeh/.emacs.d/commit/90d98d7a514da63fb17caef8fdfeb54617f4d876))


### Bug Fixes

* **language/rust:** correctly disable lsp-semnatic-tokens-mode ([32dae1d](https://github.com/jimeh/.emacs.d/commit/32dae1d558e9162239ebc3df1565ef46e453e01d))
* **language/typescript:** add setup hook to correct major mode ([cad2638](https://github.com/jimeh/.emacs.d/commit/cad2638c2d96335ed4e0279eb66e7f48c097d512))

## [0.8.39](https://github.com/jimeh/.emacs.d/compare/v0.8.38...v0.8.39) (2023-03-07)


### Features

* **language/rust:** add sf snippet for String::from($0) ([2369d50](https://github.com/jimeh/.emacs.d/commit/2369d509c75c586513f22e2254fb3ed7804cd648))
* **misc/chatgpt:** add unofficial package for interacting with ChatGPT ([9207050](https://github.com/jimeh/.emacs.d/commit/9207050c23a2daf176c0dd92bd7a9ce58d077e54))


### Bug Fixes

* **language/go:** enable tree-sitter syntax highlighting ([b8b7c7b](https://github.com/jimeh/.emacs.d/commit/b8b7c7be84aafbc73966b72955662ab74063eac2))
* **language/rust:** fix typo in function name ([d27c0bc](https://github.com/jimeh/.emacs.d/commit/d27c0bc67ed3d5be0ee600fc5e8c22a942dae6f1))

## [0.8.38](https://github.com/jimeh/.emacs.d/compare/v0.8.37...v0.8.38) (2023-02-26)


### Features

* **completion/copilot:** add .kube/config to exclude list ([76368c2](https://github.com/jimeh/.emacs.d/commit/76368c26eb17972128344d27a70645a5101629de))
* **completion/copilot:** add accept completion "mods" concept ([41b18aa](https://github.com/jimeh/.emacs.d/commit/41b18aa74cb49bf46f953f8adcf7ad5ff688142d))
* **completion/copilot:** major improvements to accept "mods" concept ([c3ccf4f](https://github.com/jimeh/.emacs.d/commit/c3ccf4f51b09e2e3e1d42e48439fbc133a22b0fd))
* **language/markdown:** enable whitespace-mode ([26d300f](https://github.com/jimeh/.emacs.d/commit/26d300f3916047056e9512878a5f3ed524cab51a))
* **language/rust:** improve cargo test run commands ([a8e92eb](https://github.com/jimeh/.emacs.d/commit/a8e92eb311768e52d8452c7b10610c4b8eafe0ac))
* **lsp:** add .devbox to ignored directories ([713ce68](https://github.com/jimeh/.emacs.d/commit/713ce6843dd4aad2319c79bcf0c5163f34c9f854))
* **snippets/go:** switch ppd snippet from "%+v" to "%#v" ([e7e5fc8](https://github.com/jimeh/.emacs.d/commit/e7e5fc87da825bcc36f8bc6ca0a11ea7d5983b15))


### Bug Fixes

* **lsp:** move misplaced :custom-face definition ([7021114](https://github.com/jimeh/.emacs.d/commit/7021114d558669d485d582ee16cada45ec35aeb7))

## [0.8.37](https://github.com/jimeh/.emacs.d/compare/v0.8.36...v0.8.37) (2023-02-17)


### Features

* **completion/copilot:** do not use copilot-mode in .env* files ([bbbc979](https://github.com/jimeh/.emacs.d/commit/bbbc9794cad092921734e48fc377ea5922aea9fe))
* **completion/copilot:** improve curly-bracket handling at end of completion ([7792cfc](https://github.com/jimeh/.emacs.d/commit/7792cfc965cb4515252d5c52b960bd0d03bab27c))
* **language/caddyfile:** improve file patterns that are handled by caddyfile-mode ([73b1eec](https://github.com/jimeh/.emacs.d/commit/73b1eec11cc67d41b2e4fb4c32bc5eed816157c5))
* **language/dockerfile:** use dockerfile-ts-mode if available ([04b8c37](https://github.com/jimeh/.emacs.d/commit/04b8c37dd48db6a97f9693f22bf31a42778ba412))
* **language/go:** improve ppd snippet ([58c161b](https://github.com/jimeh/.emacs.d/commit/58c161b63217ce8925092ce8d1c54f6445a8de42))
* **language/markdown:** change tab-width to 2 (from the default 4) ([a30e06c](https://github.com/jimeh/.emacs.d/commit/a30e06c9bb8eedd491d4afeccc973ba501b77716))
* **language/ruby:** enable formatting with syntax_tree/stree ([51451ec](https://github.com/jimeh/.emacs.d/commit/51451ecffd9a083da52eb2d5be1eb33f60d4be87))
* **language/rust:** add custom keybindings for running cargo test ([4babea1](https://github.com/jimeh/.emacs.d/commit/4babea1fad82c11186199e1063cf0ed1b3f494f0))
* **language/rust:** add pd and ppd debug print snippets ([57167c4](https://github.com/jimeh/.emacs.d/commit/57167c49359bd0804bd1ce9a3b3e31978e5d2993))
* **language/rust:** change pd snippet to use eprintln! instead of dbg! ([58cc0a3](https://github.com/jimeh/.emacs.d/commit/58cc0a39a9ec65a29ae991731285d7d8ff064a25))
* **language/ssh-config:** add setup hook for ssh-known-hosts-mode ([0882edb](https://github.com/jimeh/.emacs.d/commit/0882edb6fe62516a18f57772e007f47edc659ab7))
* **language/typescript:** switch to new typescript-ts-mode ([cead803](https://github.com/jimeh/.emacs.d/commit/cead803781172aa0304923a350dc0d4c68bbd8f2))


### Bug Fixes

* **editor/indent-guides:** switch back to column display due to performance ([1a55833](https://github.com/jimeh/.emacs.d/commit/1a55833d09292d7e9e5d68de46cfafd6bff5a81d))
* **language/go:** add-on lsp servers do not need to be registered anymore ([bc5d60c](https://github.com/jimeh/.emacs.d/commit/bc5d60c07c06b04e41ea60023dd8f2336ec813e2))
* **language/rust:** set rust-playground basedir so lsp-mode works correctly ([346b22a](https://github.com/jimeh/.emacs.d/commit/346b22a06be95301efb775f7eebdb16a2c9a061f))
* **language/sh:** only activate tree-sitter in sh and bash scripts ([e138cb3](https://github.com/jimeh/.emacs.d/commit/e138cb3a84ac84b2bc95c8a3bdd50af01b26ec78))

## [0.8.36](https://github.com/jimeh/.emacs.d/compare/v0.8.35...v0.8.36) (2023-01-15)


### Features

* **core/straight.el:** use version specific build dir ([ce0a9bf](https://github.com/jimeh/.emacs.d/commit/ce0a9bfc5c87a1dcd51e7aebbb88647af160fd40))
* **editor:** add direnv-mode to set env vars via direnv ([d6457f2](https://github.com/jimeh/.emacs.d/commit/d6457f26dee85fc109392b6e84b82594f1d1d3ba))
* **editor:** change highlight indent guides style to a thin line ([d83ca98](https://github.com/jimeh/.emacs.d/commit/d83ca9867ab675cec47c14ffb95a31bb762a3314))
* **editor:** enable subword-word globally in all buffers ([9654403](https://github.com/jimeh/.emacs.d/commit/9654403bee1333a4225e47c1e682a5805fc95ce4))
* **language/go:** make go-playground nicer to use with extra keybindings ([09aa5cb](https://github.com/jimeh/.emacs.d/commit/09aa5cb1c6a1db129f4a53d1ba7e46afffeffc3d))
* **language/nix:** add nix-mode for editing *.nix files ([23d6664](https://github.com/jimeh/.emacs.d/commit/23d66646091b14ec9da49596679172064920a59f))
* **language/rust:** major improvements to Rust dev experience ([7e29a78](https://github.com/jimeh/.emacs.d/commit/7e29a78b05ff14dd67285327a01ed1a4c715b760))


### Bug Fixes

* **completion/copilot:** resolve startup error in Emacs 30.x ([3b59f17](https://github.com/jimeh/.emacs.d/commit/3b59f17a9981eefc27bcd923fe3ecd764c520cf4))
* remove references to deprecated and removed siren functions ([03efc3b](https://github.com/jimeh/.emacs.d/commit/03efc3b84786df90768faf33a6555129c3414170))
* **spelling/flyspell:** incorrect call to flyspell-prog-mode ([bc5add2](https://github.com/jimeh/.emacs.d/commit/bc5add2f031ebc28899a009da83abb07414d9d0c))

## [0.8.35](https://github.com/jimeh/.emacs.d/compare/v0.8.34...v0.8.35) (2022-11-24)


### Features

* **language/yaml:** enable tree-sitter syntax highlighting ([ebbdab3](https://github.com/jimeh/.emacs.d/commit/ebbdab36fb2a3d635d591cc3179b8f4ed9a476d0))

## [0.8.34](https://github.com/jimeh/.emacs.d/compare/v0.8.33...v0.8.34) (2022-10-29)


### Features

* **language/rust:** improve lsp-mode setup ([eea90ad](https://github.com/jimeh/.emacs.d/commit/eea90adfa661f4720ded6193869ab1b8cbbf1504))


### Bug Fixes

* **dired+:** dired operations with multiple selected files work again ([5d442da](https://github.com/jimeh/.emacs.d/commit/5d442da04efcb544bfc9d02606e867bc9bb1ff0a))

## [0.8.33](https://github.com/jimeh/.emacs.d/compare/v0.8.32...v0.8.33) (2022-10-19)


### Features

* **editor:** switch to fork of all-the-icons-completion ([dfe7250](https://github.com/jimeh/.emacs.d/commit/dfe725021833912ac02305fffc0a522121ce6846))
* **formatting/prettier-js:** enforce use of ~/.prettierrc.js config if it exists ([4d9fdb8](https://github.com/jimeh/.emacs.d/commit/4d9fdb84145fbb90aafe85956dde17662b99a43c))
* **navigation/consult:** improve global and project buffer completion ([082aebb](https://github.com/jimeh/.emacs.d/commit/082aebbdd5a3fcb258c34979711bde665219619e))


### Bug Fixes

* **editor:** move siren-all-the-icons module from projects to editor directory ([d498f20](https://github.com/jimeh/.emacs.d/commit/d498f20336f71818c3c363b1416844a9cb6f368a))
* **navigation/helm-ag:** correctly set ignore patterns for ripgrep ([6e9262d](https://github.com/jimeh/.emacs.d/commit/6e9262da2cac31e22bedaf4b3f4c8bf5420c7a60))

## [0.8.32](https://github.com/jimeh/.emacs.d/compare/v0.8.31...v0.8.32) (2022-10-04)


### Features

* **ui:** do not enable pixel-scroll-precision-mode on startup ([938f138](https://github.com/jimeh/.emacs.d/commit/938f138ba86513aad3d3a18640cbc6b63cd5c6bc))


### Bug Fixes

* **language/go:** add tree-sitter query for highlighting struct properties ([6d4665f](https://github.com/jimeh/.emacs.d/commit/6d4665f3dd5c40a612b2a3cada148642fadf488f))
* **language/go:** attach go-playground setup function correct hook ([6bf20de](https://github.com/jimeh/.emacs.d/commit/6bf20de60e57712b6c61c6441faa0c5f8b510c3c))

## [0.8.31](https://github.com/jimeh/.emacs.d/compare/v0.8.30...v0.8.31) (2022-09-28)

## [0.8.30](https://github.com/jimeh/.emacs.d/compare/v0.8.29...v0.8.30) (2022-09-28)


### Features

* **language/go:** improve setup of go-playground ([efccea6](https://github.com/jimeh/.emacs.d/commit/efccea6cbdf4c04e0099d35e27252a83e1d1793c))
* **language/markdown:** improve prettier setup ([ae4da2c](https://github.com/jimeh/.emacs.d/commit/ae4da2c2489a51ee06efade754df8b53b6042767))
* **misc:** add new siren-reopen helper function ([06bf89a](https://github.com/jimeh/.emacs.d/commit/06bf89af61413aaf610e7a293306c01e330f3302))
* **theme:** change default light theme to doom-solarized-light ([4d3de5d](https://github.com/jimeh/.emacs.d/commit/4d3de5def2a73d3b1f727511118f5205d6227138))


### Bug Fixes

* **completion/copilot:** custom accept fun ignoring trailing "{" chars ([fd1c57a](https://github.com/jimeh/.emacs.d/commit/fd1c57a96c1b71ccd1a430234030a700d468b80e))

## [0.8.29](https://github.com/jimeh/.emacs.d/compare/v0.8.28...v0.8.29) (2022-08-20)


### Features

* **editor:** don't enable vertico-mouse-mode ([1e5761a](https://github.com/jimeh/.emacs.d/commit/1e5761afc763df64a140678de86068276d5cf7b0))
* **editor:** replace highlight-symbol with symbol-overlay ([c7d1f1d](https://github.com/jimeh/.emacs.d/commit/c7d1f1d7491af7f66aaca4a0b683b6c9e8effb1b))
* **language/go:** configure modes for go.mod and go.work files ([43d9d30](https://github.com/jimeh/.emacs.d/commit/43d9d309da844ab35bc4232b80ace0c4faa1923b))

## [0.8.28](https://github.com/jimeh/.emacs.d/compare/v0.8.27...v0.8.28) (2022-08-13)


### Features

* **languages/x509:** add x509-mode ([f1c0030](https://github.com/jimeh/.emacs.d/commit/f1c0030aff99e1e750cd1a45cc253c4ae4901f47))
* **navigation:** setup better-jumper to jump back after goto def style operations ([de72250](https://github.com/jimeh/.emacs.d/commit/de722509f5dd4008d5ed7b2c47aea64c9c4fb8c7))

## [0.8.27](https://github.com/jimeh/.emacs.d/compare/v0.8.26...v0.8.27) (2022-08-11)


### Features

* **navigation:** add consult-dir package ([99bbb27](https://github.com/jimeh/.emacs.d/commit/99bbb27f79ced1b5f25fc233589fce2ae6e876b4))


### Bug Fixes

* **editor:** resolve flx-rs+consult issues ([19713d3](https://github.com/jimeh/.emacs.d/commit/19713d30e3f31e5785660678aae79b2725d4974d))

## [0.8.26](https://github.com/jimeh/.emacs.d/compare/v0.8.25...v0.8.26) (2022-08-10)


### Bug Fixes

* **themes/doom:** correctly load theme when running in terminal ([e1fe7ef](https://github.com/jimeh/.emacs.d/commit/e1fe7ef4e974251d37eeda58a47f1630b8a5686e))

## [0.8.25](https://github.com/jimeh/.emacs.d/compare/v0.8.24...v0.8.25) (2022-07-30)


### Features

* **language/caddyfile:** format on save, use tab indentation ([646876f](https://github.com/jimeh/.emacs.d/commit/646876f1cd91976ac1416c72456d96256727e271))
* **themes/doom:** add support for ns-system-appearance ([9db2724](https://github.com/jimeh/.emacs.d/commit/9db27243f75e18a7efb8a42a4afcc98e87ad7f20))
* **ui/display-time:** add config for display-time-mode ([e662ee6](https://github.com/jimeh/.emacs.d/commit/e662ee6552a8b8ad0d076842a1a33c89195b0f59))
* **utils:** add siren-prepend and siren-append macros ([bbd8f11](https://github.com/jimeh/.emacs.d/commit/bbd8f11719d15580da2e2bb0d98ea7afe97cf601))


### Bug Fixes

* **completion:** ensure correct order of completion-at-point-functions ([7f32de8](https://github.com/jimeh/.emacs.d/commit/7f32de8c49bc86da6cd9126e503cd276cd8fd036))
* **themes/doom:** set foreground of tab-bar and tab-line to fg-alt ([0932f6c](https://github.com/jimeh/.emacs.d/commit/0932f6c5fa98943021fce28036f1ad6ed27bd72f))

## [0.8.24](https://github.com/jimeh/.emacs.d/compare/v0.8.23...v0.8.24) (2022-07-27)


### Bug Fixes

* add missing siren-clang-format module ([3319a5c](https://github.com/jimeh/.emacs.d/commit/3319a5ce3657933dfa55faa7a48695fd356f91a7))

## [0.8.23](https://github.com/jimeh/.emacs.d/compare/v0.8.22...v0.8.23) (2022-07-20)


### Features

* **core/vendor:** add support for loading files from vendor directory ([a67b8f5](https://github.com/jimeh/.emacs.d/commit/a67b8f5047737cdea815ce514d9b6d369a4d3d99))
* **editor/consult:** massively simplify consult setup ([ca9ec4f](https://github.com/jimeh/.emacs.d/commit/ca9ec4f7a220918916f7561a4e117a0f66ffe8ac))
* **editor/fussy:** improve completion performance ([29db7b6](https://github.com/jimeh/.emacs.d/commit/29db7b63ac663b9c14d0cfbfeb971a6ca9b8b01a))
* **editor:** improve code folding with origami ([7c253d9](https://github.com/jimeh/.emacs.d/commit/7c253d986c35b5646c38575aea378a58e8a0d92e))
* **language/protobuf:** format non-buf protobuf files with clang-format ([b92bd7b](https://github.com/jimeh/.emacs.d/commit/b92bd7b19ebbd309aa154ac346a4542b2339450e))
* **text-editing:** add beginend package which improves M-< and M-> keybindings ([ab7d541](https://github.com/jimeh/.emacs.d/commit/ab7d5411483646893013a7e76f970a8462e7b3b9))
* **text-editing:** add shift-number package ([86464e8](https://github.com/jimeh/.emacs.d/commit/86464e80b15d51791b0915cae20034f39eae72ea))
* **text-editing:** replace toggle-quotes with cycle-quotes package ([0de0c4c](https://github.com/jimeh/.emacs.d/commit/0de0c4ca23a4b34f56c1696a23f1038beb9b91b2))
* **theme:** add alias commands to quickly activate light/dark theme ([3355244](https://github.com/jimeh/.emacs.d/commit/33552444ab6d4e7e053b4d6e135bd4e983cba1b0))
* **theme:** tweak completion related faces ([ccb2d7a](https://github.com/jimeh/.emacs.d/commit/ccb2d7a70374a424da15799d8d17c3f20531e5b9))
* **vendor/clang-format:** add custom reformatter-based clang-format package ([72c33e7](https://github.com/jimeh/.emacs.d/commit/72c33e7b37c0448dff4ffc76b5a11f37028e9c79))


### Bug Fixes

* **editor:** correctly filter buffer results from consult-buffer ([92a6db7](https://github.com/jimeh/.emacs.d/commit/92a6db71e61429ade2ed5f0e0b38d3781132899d))
* **language/protobuf:** enforce buf flycheck linter in buf projects ([a3c3840](https://github.com/jimeh/.emacs.d/commit/a3c384027dc560493857cdb5831d22e478bc90a9))

## [0.8.22](https://github.com/jimeh/.emacs.d/compare/v0.8.21...v0.8.22) (2022-07-15)


### Features

* **completion/copilot:** add new and improve existing keybindings ([2b55cf7](https://github.com/jimeh/.emacs.d/commit/2b55cf7bd93f5038f59ecdb1909d3d4f20e339f8))
* **core:** add siren-reopen-current-file interactive command ([731be46](https://github.com/jimeh/.emacs.d/commit/731be46b932456c11fc8c63cb745e5ba813da851))
* **editor:** add marginalia tab annotator with tab group support ([3d40d3b](https://github.com/jimeh/.emacs.d/commit/3d40d3b0efe39cc5924316bed7871d8afcfe7c4f))
* **language/protobuf:** enable format-on-save with buf format ([a1a3c3d](https://github.com/jimeh/.emacs.d/commit/a1a3c3d9f5a8c8ade34fbf8290ff67da1b9aea96))
* **navigation/dired:** improve keybindings and listing switches setup ([caf8791](https://github.com/jimeh/.emacs.d/commit/caf879136372088792fe1ef9b2f590eb88b4aab2))
* **ui:** add solaire-mode ([9d72997](https://github.com/jimeh/.emacs.d/commit/9d72997be082fc8d9f86c647bff18ea528217483))
* **vc/git-commit-mode:** enable smartparens-mode and whitespace-mode ([978667f](https://github.com/jimeh/.emacs.d/commit/978667fc3460461398edd1c00c80dba522ac6ec6))
* **workspaces/tab-bar:** add keybindings for tab-duplicate ([05ad42d](https://github.com/jimeh/.emacs.d/commit/05ad42d77e8b198902bc0753ba222073974116c7))
* **workspaces/tab-bar:** easier use of tab groups ([558e6a9](https://github.com/jimeh/.emacs.d/commit/558e6a97d1a3f2f8a68ff56f2317b4c3ae1f79e9))


### Bug Fixes

* **editor:** change highlight indentation guides back to 'column mode ([2fa3838](https://github.com/jimeh/.emacs.d/commit/2fa38381ee2e96fd21bd6ec55cc64a898d303712))
* **language/terraform:** disable lsp-mode in terraform files ([f8ed102](https://github.com/jimeh/.emacs.d/commit/f8ed1029da71409ec59a7d4d35f8257bf855ccf5))
* **navigation/dired:** fix unbinding of M-b ([2a60c0d](https://github.com/jimeh/.emacs.d/commit/2a60c0d42f36e8b9385c8227fd363ad733733af5))
* **themes/doom-overrides:** don't tweak vertical-bar in light themes ([9c13005](https://github.com/jimeh/.emacs.d/commit/9c130059370865f560dcf5329219f2ab02737cd2))

## [0.8.21](https://github.com/jimeh/.emacs.d/compare/v0.8.20...v0.8.21) (2022-06-22)


### Features

* **editor:** don't highlight current indent level ([efde4ea](https://github.com/jimeh/.emacs.d/commit/efde4eaaf27537b9245d4c7c392ba116b942f8ed))
* **editor:** improve styling of highlight-indent-guides package ([c501012](https://github.com/jimeh/.emacs.d/commit/c5010120da8f6eda5388f2340c8b31c4d706d221))
* **editor:** switch indent guide style to a thin line ([7ecfb8f](https://github.com/jimeh/.emacs.d/commit/7ecfb8fd866e6e1ea5e33ca4086ac83a5ad91585))
* **language:** stop using visual-line-mode in prog-mode derived modes ([262a661](https://github.com/jimeh/.emacs.d/commit/262a66155730ed7df6b6adaf69502e3d9f7beb1b))
* **whitespace:** re-enable whitespace mode without newline-mark ([f319097](https://github.com/jimeh/.emacs.d/commit/f3190978218482c5986bdd1c71a843f46aec14ee))


### Bug Fixes

* **completion/copilot:** disable whitespace-mode to fix cursor placement issue ([25b6493](https://github.com/jimeh/.emacs.d/commit/25b64935307b4f74abce26999de823443af450a2))
* **editor/undo:** increase undo limits when using undo-fu ([5b054bd](https://github.com/jimeh/.emacs.d/commit/5b054bdd07c2b78d89e0159cdda52e0b9b1b1c61))

## [0.8.20](https://github.com/jimeh/.emacs.d/compare/v0.8.19...v0.8.20) (2022-06-09)


### Features

* **completion:** replace orderless with fussy ([f6ecda7](https://github.com/jimeh/.emacs.d/commit/f6ecda7bf4d72ff693003fc719fad916b2d397a8))


### Bug Fixes

* **packages:** override undo-fu and undo-fu-session recipes ([bd3e53b](https://github.com/jimeh/.emacs.d/commit/bd3e53bdc86c5b128da6c50063d5491375da3ec3))

## [0.8.19](https://github.com/jimeh/.emacs.d/compare/v0.8.18...v0.8.19) (2022-06-02)


### Bug Fixes

* **navigation/consult:** fix custom project directory lookup function ([c5b1494](https://github.com/jimeh/.emacs.d/commit/c5b149497b0548af99d5e1177d6c3c4aab504f20))

## [0.8.18](https://github.com/jimeh/.emacs.d/compare/v0.8.17...v0.8.18) (2022-05-12)


### Features

* **completion:** add support for GitHub Copilot via copilot.el ([44c4cc9](https://github.com/jimeh/.emacs.d/commit/44c4cc93c11733e891a523768e96aadfbe2c3ae2))
* **completion/company:** use company-box front-end in GUI mode ([ce4fd06](https://github.com/jimeh/.emacs.d/commit/ce4fd06ccca49c08fc241dbcdfb56a579962fe87))
* **editor:** add extra navigation keybindings for vundo ([911bdb7](https://github.com/jimeh/.emacs.d/commit/911bdb71821e6e0166dd8d9f1742aa1916e28ed8))
* **editor:** improve whitespace-mode setup and cleanup on save ([c84bf1d](https://github.com/jimeh/.emacs.d/commit/c84bf1dea67c73e14faccfcf7e7d17eabad9b77d))
* **editor:** replace undo-tree with undo-fu and vundo ([177f075](https://github.com/jimeh/.emacs.d/commit/177f0758536582d1770ac79129172facb873bfa3))
* **language:** enable tree-sitter for most languages that are supported ([d86f6c4](https://github.com/jimeh/.emacs.d/commit/d86f6c4490239d5cecd8818e1c1266ae5f255d87))
* **language/terraform:** enable tree-sitter in terraform-mode ([682896a](https://github.com/jimeh/.emacs.d/commit/682896a67f4b082af2578582179183961de7c5c6))
* **languages:** enable shellcheck linting when using bash language server ([cb719af](https://github.com/jimeh/.emacs.d/commit/cb719af306a5760ffd82e99f7b829a05edf8c51d))
* **text-editing:** add siren-insert module ([ad2e2d2](https://github.com/jimeh/.emacs.d/commit/ad2e2d2bab15c31b1b9248fbeff20663c9e6e57f))
* **ui:** define custom siren-pixel-scroll-mode ([be59506](https://github.com/jimeh/.emacs.d/commit/be595062e62981841e93a7a4d4ef7a3eb2f80b05))


### Bug Fixes

* **completion/copilot:** improve copilot's interaction with company-mode ([e14bfa3](https://github.com/jimeh/.emacs.d/commit/e14bfa37d8810bfd35fbbfdbef3ed02f23cc7b29))
* **completion/copilot:** work around freezing issue caused by visual-line-mode ([7c2beb4](https://github.com/jimeh/.emacs.d/commit/7c2beb4cdfbde496b6ed54fa1e50ec58c0c6e187))
* **editor:** use new marginalia-field-width variable name ([dad8f77](https://github.com/jimeh/.emacs.d/commit/dad8f778b31dc722d7c044ec82c931c83324ab9f))
* **language/markdown:** disable polymode in markdown-mode ([1fda5dc](https://github.com/jimeh/.emacs.d/commit/1fda5dc0ccc7214131ecfec3eee2d02e753eed22))
* **navigation:** resolve load order between consult and projectile ([846c138](https://github.com/jimeh/.emacs.d/commit/846c13881efbf405526fb30185fb2e35d52f36e4))
* **text-editing:** use wildcard in tempel-path ([d85671a](https://github.com/jimeh/.emacs.d/commit/d85671a44cb4f4b93cc526052dada476990450c6))
* **ui/pixel-scroll:** fix typo with siren-pixel-scroll-mode init ([16ad040](https://github.com/jimeh/.emacs.d/commit/16ad0402a28d39fd30a0b09818ccb2521693e452))

## [0.8.17](https://github.com/jimeh/.emacs.d/compare/v0.8.16...v0.8.17) (2022-04-07)


### Features

* **ui:** enable pixel-scroll-precision-mode in GUI if available ([f0f7c53](https://github.com/jimeh/.emacs.d/commit/f0f7c53cb3d139fd6db6ec6097a181ec92090ac0))

## [0.8.16](https://github.com/jimeh/.emacs.d/compare/v0.8.15...v0.8.16) (2022-03-14)


### Features

* **completion:** ignore case in minibuffer completion ([ee91287](https://github.com/jimeh/.emacs.d/commit/ee91287b52671c1b7582138d31189f753f276174))
* **completion:** improve completion-at-point/company candidates ([106245a](https://github.com/jimeh/.emacs.d/commit/106245af8b2c716df5671196b1523f69c6d21ae9))
* **core:** add general.el for easier / flexible keybinding definitions ([3fc0d2d](https://github.com/jimeh/.emacs.d/commit/3fc0d2d77d39619d1a449104c56d2537826f3265))
* **core:** use general.el for keybind definitions nearly everywhere ([a861893](https://github.com/jimeh/.emacs.d/commit/a8618938bf0e76949cebaa40e508fb0a9df8485c))
* **language/go:** add -race flag to gotest invocations ([7da944b](https://github.com/jimeh/.emacs.d/commit/7da944b04d3289f27af49900038885e92bed93a5))
* **language/markdown:** add vmd-mode to preview markdown via vmd ([0b7ecb9](https://github.com/jimeh/.emacs.d/commit/0b7ecb91a27c4e38f368e9d7f1dd121c906f85b1))
* **misc:** disable grip-mode as I never use it ([c64b717](https://github.com/jimeh/.emacs.d/commit/c64b717e59cc23f551626a1f6ba8c4df3be65e18))
* **projects:** enable all-the-icons in minibuffer completion ([e8978f7](https://github.com/jimeh/.emacs.d/commit/e8978f7b44d1b454d7335f37e2adb9d62834cf8c))
* **snippets:** add wip config for tempel to try it out ([6bada58](https://github.com/jimeh/.emacs.d/commit/6bada58d495538f2a5c2eff9b4f38c6c7324e568))
* **snippets:** disable prog-mode snippets from yasnippet-snippets ([b742c90](https://github.com/jimeh/.emacs.d/commit/b742c9026f87b1bef6676abeeb7159ae0abc4f7b))


### Bug Fixes

* **snippets/org-mode:** update gfm snippet so it actually works ([dbe14e8](https://github.com/jimeh/.emacs.d/commit/dbe14e827ebd152ccf2eee508bee117de69b725f))

## [0.8.15](https://github.com/jimeh/.emacs.d/compare/v0.8.14...v0.8.15) (2022-03-10)


### Features

* **core:** update linux font and fullscreen command ([a0bc641](https://github.com/jimeh/.emacs.d/commit/a0bc64107c0477c6a6a8ab83af4fb4e8b81cbbd9))
* **core/editor:** disable graphical dialog boxes ([f39714b](https://github.com/jimeh/.emacs.d/commit/f39714b1ca6b7ffb6b19bce49cdfcc5786b84346))
* **language/go:** improve and fix usage of gotest package ([2554669](https://github.com/jimeh/.emacs.d/commit/2554669fea92a1628199333f9d37444b48c90267))
* **language/go:** use tree-sitter-mode and tree-sitter-hl-mode ([92c16d4](https://github.com/jimeh/.emacs.d/commit/92c16d4dcbdc0401d8710dce1019dbf0dfde18f7))
* **language/markdown:** enable polymode in markdown buffers ([6f42277](https://github.com/jimeh/.emacs.d/commit/6f422773a5c8d3b8d765c0f2719c9053ed32402e))
* **language/ssh-config:** add custom file path to mode list ([75543de](https://github.com/jimeh/.emacs.d/commit/75543de052e6eb750d776b989baa2063ff32cdcd))


### Bug Fixes

* **env:** initialize env from shell in pgtk window-system ([a1f30f6](https://github.com/jimeh/.emacs.d/commit/a1f30f6d1579344b56672ef470f6a8166e0ca33f))
* **navigation:** disable direx as it is broken on recent Emacs 29.x builds ([96d5bab](https://github.com/jimeh/.emacs.d/commit/96d5bab074e418d52641b00516e5a1b8e08b4ce9))
* **navigation:** remove ctrlf package in favor of isearch ([246a459](https://github.com/jimeh/.emacs.d/commit/246a459622705e04f93a5cbac24c8d26dd6f9081))

## [0.8.14](https://github.com/jimeh/.emacs.d/compare/v0.8.13...v0.8.14) (2022-02-17)


### Features

* **font:** change default font "Menlo" to "Menlo Nerd Font Mono" ([b428d26](https://github.com/jimeh/.emacs.d/commit/b428d262ff4d3475c2753d7f8c96a44b8e00bae6))
* **nativation/consult:** custom groups for consult-buffer ([1db4018](https://github.com/jimeh/.emacs.d/commit/1db40184978a750f8a156298499397bdab6ddcde))
* **themes:** add lsp-ui-doc-border styling to override theme ([f496e14](https://github.com/jimeh/.emacs.d/commit/f496e14710e723bb626e1b01bfe60b4af8f742a9))


### Bug Fixes

* **docs/helpful:** add workarounds for recent Emacs 29.x issues ([d6d7b3a](https://github.com/jimeh/.emacs.d/commit/d6d7b3a450538a7cd668a1dc240986b8ca70f351))
* **editor/vertico:** resolve race-condition issue with projectile-switch-project ([4a552aa](https://github.com/jimeh/.emacs.d/commit/4a552aa96dddc1304e161cacf4add721d782df58))
* **nativation/helm:** resolve helm loading issue after update ([1a41eea](https://github.com/jimeh/.emacs.d/commit/1a41eea77e859430a8ddeadd8d407b699b3ed74a))
* **ui:** prevent tab-bar being visible in lsp-ui-doc child frame ([27fae46](https://github.com/jimeh/.emacs.d/commit/27fae4666453491f9413763abfa4ddab6467ac40))

## [0.8.13](https://github.com/jimeh/.emacs.d/compare/v0.8.12...v0.8.13) (2022-01-26)


### Features

* **projects:** switch from helm-projectile to regular projectile commands ([0312a36](https://github.com/jimeh/.emacs.d/commit/0312a360b4918d155d67443a8d75056e19152e10))
* **workspaces/tab-bar:** display tab-bar and make it pretty ([ddc99ac](https://github.com/jimeh/.emacs.d/commit/ddc99acaa0fc794608f568497307a449dec4d53b))

## [0.8.12](https://github.com/jimeh/.emacs.d/compare/v0.8.11...v0.8.12) (2022-01-19)


### Bug Fixes

* **editor/vertico:** cleanup if projectile command is canceled ([c80b4e2](https://github.com/jimeh/.emacs.d/commit/c80b4e24fa6af0d510238070344d8093818fdf2e))

## [0.8.11](https://github.com/jimeh/.emacs.d/compare/v0.8.10...v0.8.11) (2022-01-18)


### Features

* **editor/vertico:** improve extension setup ([309bc2a](https://github.com/jimeh/.emacs.d/commit/309bc2a611b68aabc7bc4cb8a6145b370af8caca))
* **languages:** enable lsp-mode in Dockerfiles and web-mode buffers ([fdc443e](https://github.com/jimeh/.emacs.d/commit/fdc443ea740dac0e5c1f70fb04acf3a9799a4a93))


### Bug Fixes

* **navigation/helm:** add require helm-mode to fix errors ([b5daa4f](https://github.com/jimeh/.emacs.d/commit/b5daa4f2e5143250ec75e80f9318a5ce3e3651f3))
* **navigation/helm:** set helm-find-files to C-x f ([bd36da4](https://github.com/jimeh/.emacs.d/commit/bd36da4bfeb042e80f9402523a790ada3a80b8df))

## [0.8.10](https://github.com/jimeh/.emacs.d/compare/v0.8.9...v0.8.10) (2022-01-16)


### Features

* **completion:** switch from selectrum to vertico ([56a577a](https://github.com/jimeh/.emacs.d/commit/56a577ae918a6739e65d4d43f3b83b59bc24d1a8))
* **editor/veritco:** add vertico-directory extension ([04d83a2](https://github.com/jimeh/.emacs.d/commit/04d83a23cd1de1d76dd373c784ee6e08feb55e21))
* **version-control:** add gh-notify package ([90441a2](https://github.com/jimeh/.emacs.d/commit/90441a259086c6ffa88c8ecd7ad8365f285ad662))
* **version-control:** add github-review package ([fd707a6](https://github.com/jimeh/.emacs.d/commit/fd707a6e1b20406ff9725b2be52df455efbdf289))


### Bug Fixes

* **lsp-mode:** add "tmp" to ignored directory names ([3a8b04b](https://github.com/jimeh/.emacs.d/commit/3a8b04b59cd3df8357d3445aa524ccb5e38e47b9))
* **macos:** disable ctrl+scroll emacs keybindings on macOS ([d6860c0](https://github.com/jimeh/.emacs.d/commit/d6860c0fe52fe4cdb111fdbdf8426b135deb9bfa))

## [0.8.9](https://github.com/jimeh/.emacs.d/compare/v0.8.8...v0.8.9) (2021-11-30)


### Features

* **misc:** enable refine package ([1c303c9](https://github.com/jimeh/.emacs.d/commit/1c303c942441650b74b73ae253c463fd40bba4fa))
* **version-control:** add code-review package ([70f776d](https://github.com/jimeh/.emacs.d/commit/70f776d4f3fe7761b2a4788107dff73e02d7b51c))


### Bug Fixes

* **faces:** handle new mode-line-active and mode-line-inactive faces ([1b81c91](https://github.com/jimeh/.emacs.d/commit/1b81c91490e55a1a6de3502e1119d8c4a9c0abc6))

## [0.8.8](https://github.com/jimeh/.emacs.d/compare/v0.8.7...v0.8.8) (2021-11-26)


### Features

* **editor:** separate sentences with a single space instead of two ([6a95b32](https://github.com/jimeh/.emacs.d/commit/6a95b32f3815a3612215038538b1dfa067ae1bab))
* **lang/go:** add custom lsp-client for golangci-lint-langserver ([0ac1c86](https://github.com/jimeh/.emacs.d/commit/0ac1c861026fc3bfb8285ead4c8f2d7b79376b3f))


### Bug Fixes

* **dired:** prevent dired from prompting about removing dired buffers ([819f068](https://github.com/jimeh/.emacs.d/commit/819f06887975a8a9a9962c9f2e20cb536786c74d))
* **env:** set MallocNanoZone var to fix Go race detector issue in Monterey ([0c89367](https://github.com/jimeh/.emacs.d/commit/0c893670cf9d42f806ee748684c093788a5474ad))

## [0.8.7](https://github.com/jimeh/.emacs.d/compare/v0.8.6...v0.8.7) (2021-11-10)


### Bug Fixes

* **editor:** disable auto-revert-mode's use of file notifications on macOS ([78cb7fc](https://github.com/jimeh/.emacs.d/commit/78cb7fcd049bfbef99f7121813eddef4b83a669d))
* **version-control/magit:** when disabled delta still caused issues ([ab001ee](https://github.com/jimeh/.emacs.d/commit/ab001eeb0ee8d2e183b7e229b1086ed89ed61c5f))

## [0.8.6](https://github.com/jimeh/.emacs.d/compare/v0.8.5...v0.8.6) (2021-10-28)


### Features

* **lsp:** tweak lsp diagnostics related keybindings ([c52853e](https://github.com/jimeh/.emacs.d/commit/c52853e832745c9335b46d4503df80e068be6c54))
* **navigation/helm:** add helm-xref package ([11099af](https://github.com/jimeh/.emacs.d/commit/11099af502b5d2cf20c9673ca1e83cc56bd67cc9))
* **navigation/helm:** make treemacs/neotree auto-hiding customizable ([6e65e27](https://github.com/jimeh/.emacs.d/commit/6e65e27ca2606b9742738c95355e3b9078a9dc59))
* **navigation/imenu:** improve C-t imenu keybinding ([1f7d739](https://github.com/jimeh/.emacs.d/commit/1f7d739193b4e4f30e6ce43636f300417e6e0efb))
* **projects/treemacs:** customize highlight line background color ([cccff71](https://github.com/jimeh/.emacs.d/commit/cccff7190a80a6e5a9e8f357de09e32320b1fb78))
* **version-control/magit:** add magit-delta package ([1dbb563](https://github.com/jimeh/.emacs.d/commit/1dbb5631f6d77b1af625b6e3404094f3198e68f6))
* **workspaces/tab-bar:** hide tab-bar ([205af00](https://github.com/jimeh/.emacs.d/commit/205af0097a61987f7210f10c38595244bf113300))


### Bug Fixes

* **lang:** gitconfig-mode and gitignore-mode have been replaced with git-modes ([01bd757](https://github.com/jimeh/.emacs.d/commit/01bd757c15b51932e1083166eaab281557581322))
* **lang/dockerfile:** add custom hadolint flycheck checker which actually works ([6daac86](https://github.com/jimeh/.emacs.d/commit/6daac868e22b4c08e3a5ab0d29a1ccc3196f72ef))
* **navigation:** resolve dired/dired+ load order issue ([35d6e12](https://github.com/jimeh/.emacs.d/commit/35d6e1261269d123d842858e2f5db4089abfe192))
* **projects:** unbind M-l from treemacs as it interfered with a global keybinding ([09c27ab](https://github.com/jimeh/.emacs.d/commit/09c27ab0a7fa4dd41ed2f6384e471b4c91b6ae00))

## [0.8.5](https://github.com/jimeh/.emacs.d/compare/v0.8.4...v0.8.5) (2021-10-06)


### Features

* **editor:** add project-buffer marginalia annotator ([f4e1c40](https://github.com/jimeh/.emacs.d/commit/f4e1c403b0c483b77e9ea501f56f77b9ffaf4144))
* **editor:** decorate various projectile commands with marginalia ([6dc661f](https://github.com/jimeh/.emacs.d/commit/6dc661f14e0776fea436c5d83364b5c91a1d13ae))
* **editor:** don't use helm for projectile-switch-project ([b8fe28f](https://github.com/jimeh/.emacs.d/commit/b8fe28f07c0b659caeab3bf7f77334305e34c9c1))
* **lang:** enable a few gopls analyzers which are disabled by default ([5849a7b](https://github.com/jimeh/.emacs.d/commit/5849a7b522abf559a461a0704e518b2e54cf023b))
* **lsp:** add keybindings for helm-lsp-diagnostics ([9a3828c](https://github.com/jimeh/.emacs.d/commit/9a3828c293f8007cffb54988458ea1fba1d7fb8e))
* **navigation:** make helm take up full frame ([bde7650](https://github.com/jimeh/.emacs.d/commit/bde765001b0fe70830b80f888664c9f9c8633bc8))
* **navigation:** stop using helm-posframe ([cb0cf52](https://github.com/jimeh/.emacs.d/commit/cb0cf52769a36d3771416525efbfc8f5dd5f0d68))
* **navigation:** use consult instead of helm for imenu completion ([2236947](https://github.com/jimeh/.emacs.d/commit/22369470c4866ec17ea94bd3bae04f979b460f27))
* **projects:** only show file/process buffers in projectile buffer list ([11bb56b](https://github.com/jimeh/.emacs.d/commit/11bb56b4ac3401884b9a317e253a2d9221489265))
* **projects:** use helm-projectile for project switching again ([6e34c36](https://github.com/jimeh/.emacs.d/commit/6e34c36e69604a01fba6985e38332baf54f670ea))

## [0.8.4](https://github.com/jimeh/.emacs.d/compare/v0.8.3...v0.8.4) (2021-09-28)


### Features

* **lang:** add protobuf-mode and configure flycheck to support buf ([d3ee782](https://github.com/jimeh/.emacs.d/commit/d3ee78224ad15153caa61342e80ed30ccc634b07))
* **lang:** add ssh-config-mode for ssh config and authorized_keys files ([093f4a6](https://github.com/jimeh/.emacs.d/commit/093f4a62c3109f2885f7a80f3490a107bca2d221))


### Bug Fixes

* **lang:** set tab-width in protobuf-mode ([abc1ddd](https://github.com/jimeh/.emacs.d/commit/abc1dddcf968d5cad9ecb18eb0b94fecbea0694c))

## [0.8.3](https://github.com/jimeh/.emacs.d/compare/v0.8.2...v0.8.3) (2021-09-15)


### Features

* **makefile:** improve makefile execution and bind it to C-c C-m ([4cb9c3d](https://github.com/jimeh/.emacs.d/commit/4cb9c3d3a0b7cafc8c707d72b28769474da684d6))


### Bug Fixes

* **lang:** tweak golines arguments to not use deprecated gofumports ([32f23ea](https://github.com/jimeh/.emacs.d/commit/32f23ea33baa0ddc3ff98c60e9991ec6b9c1ef22))
* **lsp:** only use lsp-mode in bash and sh based sh-mode buffer ([46a8169](https://github.com/jimeh/.emacs.d/commit/46a8169ed356e085b8e109c8518175aa8cb99ec8))
* **theme:** tweak magit-diff-hunk-heading face to make it more readable ([784a295](https://github.com/jimeh/.emacs.d/commit/784a29585a4a4e69dbb6f887bf19638d395979c9))

## [0.8.2](https://github.com/jimeh/.emacs.d/compare/v0.8.1...v0.8.2) (2021-08-03)


### Features

* **lang:** improve jsonnet-mode setup with format on save, and more ([17f6325](https://github.com/jimeh/.emacs.d/commit/17f63255d9ee25d9fde2b75a2123e36589b60bf4))
* **misc:** add lorem-ipsum package ([8096cb3](https://github.com/jimeh/.emacs.d/commit/8096cb34ab1602631a61ea8d6ebd74484f98a9e5))


### Bug Fixes

* **editor:** do not highlight indentation levels on large files ([0435cb2](https://github.com/jimeh/.emacs.d/commit/0435cb28d69911217b794f52828dcb115499ec63))

## [0.8.1](https://github.com/jimeh/.emacs.d/compare/v0.8.0...v0.8.1) (2021-07-04)


### Features

* **lang:** enable lsp-mode for bash and sh script files in sh-mode ([850c9db](https://github.com/jimeh/.emacs.d/commit/850c9dbbddd7a88dc2169d2582811ffb958545a0))
* **lsp:** allow C-c C-f to perform extra formatting not done by on-save hook ([14f394c](https://github.com/jimeh/.emacs.d/commit/14f394c7ca884d5287a27e48bd3a778ac731167a))


### Bug Fixes

* **editor:** switch from vertico to selectrum due lsp-mode issue ([4c8384b](https://github.com/jimeh/.emacs.d/commit/4c8384bcec5a38206ee19433572ef6a45d68a468))

## [0.8.0](https://github.com/jimeh/.emacs.d/compare/v0.7.31...v0.8.0) (2021-06-24)


### Features

* **completion:** insert current company-mode selection with tab ([cb1296e](https://github.com/jimeh/.emacs.d/commit/cb1296ed9c7eb40dac2f512603a96b9783b38bff))
* **editor:** add config for vertico + orderless as a alternative to selectrum ([07b0013](https://github.com/jimeh/.emacs.d/commit/07b0013c75fc2542d9f417afe5ac9eea2b31ffc7))
* **editor:** add embark ([49cef56](https://github.com/jimeh/.emacs.d/commit/49cef56c82f90ba4ae921bf00e8198e089b82883))
* **editor:** replace ido and amx with selectrum, prescient and marginalia ([93c22e1](https://github.com/jimeh/.emacs.d/commit/93c22e1bb99d3e5dedcb82a8567ece97ca03f70f))
* **editor:** switch to vertico+orderless from selectrum+prescient ([0e6a7b6](https://github.com/jimeh/.emacs.d/commit/0e6a7b6290d15c084c2b144961aa6adb48b32c0f))
* **navigation:** add consult ([354ed23](https://github.com/jimeh/.emacs.d/commit/354ed23d21a396a3af8a396ee96ee391df4a9395))
* **navigation:** add ctrlf-mode, a isearch replacement ([5878449](https://github.com/jimeh/.emacs.d/commit/5878449963a2107a150ae37c44cfc7617267adb9))
* **navigation:** enabled hl-line-mode in dired ([d90e559](https://github.com/jimeh/.emacs.d/commit/d90e55904785d47a545a9b67c9d07d69a296867f))
* **navigation:** use helm-posframe ([63b5441](https://github.com/jimeh/.emacs.d/commit/63b5441deb648cf3970df09776b9c63ff9175e45))
* **ui:** change macOS GUI font from Monaco to Menlo ([639f813](https://github.com/jimeh/.emacs.d/commit/639f813ab023b62f40fbcc368be7fc8bd6b46a19))
* **ui:** improve vertical-border border character when running in terminal ([8c96e38](https://github.com/jimeh/.emacs.d/commit/8c96e38141172a0d524132e664400d1c6d526e94))


### Bug Fixes

* **editor:** ensure selectrum current item always highlights full line ([ee89505](https://github.com/jimeh/.emacs.d/commit/ee895054fd883c79e5784e2e490e7008d96ed912))
* **editor:** improve filtering performance of M-x when marginalia is active ([689dc6a](https://github.com/jimeh/.emacs.d/commit/689dc6a1e4b0aab9e94143e6bf7ccad8953bf411))
* **init:** workaround recursive load error in jka-compr with latest nightly builds ([b049ec6](https://github.com/jimeh/.emacs.d/commit/b049ec652a064bc211abd6a022d135a08d548e15))
* **nativation:** make consult-buffer (C-x b) work before projectile is loaded ([b647d64](https://github.com/jimeh/.emacs.d/commit/b647d6447b1d1a747b21a6f446dcc7bffcf9cba6))
* **navigation:** make helm play nicer with treemacs when helm-posframe is enabled ([b53cef4](https://github.com/jimeh/.emacs.d/commit/b53cef4d30a91f255d1e319498d44e33f25dda09))
* **navigation:** workaround dired+ incompatibility with dired in master branch ([688b14a](https://github.com/jimeh/.emacs.d/commit/688b14a775e2e052ceb32631d329f86f290d6d2d))

## [0.7.31](https://github.com/jimeh/.emacs.d/compare/v0.7.30...v0.7.31) (2021-06-14)


### Features

* **formatting:** swap from prettier.js to lsp-mode to format js/json ([a07cc67](https://github.com/jimeh/.emacs.d/commit/a07cc6746f2dba7c8b528a730eb40747759c0307))
* **lang:** improve yaml formatting and enable lsp-mode ([38544ef](https://github.com/jimeh/.emacs.d/commit/38544ef7f2c084214e7b7af30495033d1ad72f0c))


### Bug Fixes

* **editor:** disable undo-tree in terminal buffers ([263400c](https://github.com/jimeh/.emacs.d/commit/263400c4c19e44a4fa971f1478c4ff2628d61788))
* **theme:** override whitespace-tab background to match normal bg color ([3ab4ef5](https://github.com/jimeh/.emacs.d/commit/3ab4ef51e3d8dda78e15b303abf250e2dfa843f5))

## [0.7.30](https://github.com/jimeh/.emacs.d/compare/v0.7.29...v0.7.30) (2021-05-15)


### Features

* **lang:** enable lsp-mode in lua-mode ([0ef8ea7](https://github.com/jimeh/.emacs.d/commit/0ef8ea787f096f1d8142a518731381aff1613632))
* **linting:** simplify warning arrow glyph used by flycheck ([f50e2d9](https://github.com/jimeh/.emacs.d/commit/f50e2d925e7dc7318b1b0717b4cf872483ee4b3c))
* **ui:** improve vertical bar styling, especially in terminal ([d191cee](https://github.com/jimeh/.emacs.d/commit/d191ceea5d207eae5668b789c07cb5530660e57d))
* **version-control:** improve styling of diff-hl indicators ([e434e41](https://github.com/jimeh/.emacs.d/commit/e434e41d97a28d4c150ecdda2e07bc031a403893))


### Bug Fixes

* **native-comp:** set old/new config values to ensure they work ([23f2da6](https://github.com/jimeh/.emacs.d/commit/23f2da6210e1ceb4459fb5c616572a049009bfe3))
* **version-control:** set correct diff-hl mode after desktop-read ([c8196d7](https://github.com/jimeh/.emacs.d/commit/c8196d759061716bdd17df4aed6f913066dd64e0))
* **workspaces:** set base desktop base dir correctly ([f20ebd3](https://github.com/jimeh/.emacs.d/commit/f20ebd3f1ee33a2124100897c72c3484a92fc55c))

## [0.7.29](https://github.com/jimeh/.emacs.d/compare/v0.7.28...v0.7.29) (2021-05-09)


### Bug Fixes

* **native-comp:** update config to support recent variable name changes ([7fad360](https://github.com/jimeh/.emacs.d/commit/7fad360c3e8fd157cfad9e6ce9732bb4053773d1))

## [0.7.28](https://github.com/jimeh/.emacs.d/compare/v0.7.27...v0.7.28) (2021-05-08)


### Features

* **formatting:** use whitespace-clean-mode ([b7d914c](https://github.com/jimeh/.emacs.d/commit/b7d914c51ee5aee9a2553160356bd2788570a64a))
* **navigation:** improve list of files searched by helm-ag via ripgrep ([fc0e0ac](https://github.com/jimeh/.emacs.d/commit/fc0e0acd655b2710389b39d1cba8c24b09bdf9a2))


### Bug Fixes

* **native-comp:** support new *.eln load path variable name ([8a47421](https://github.com/jimeh/.emacs.d/commit/8a47421c1ade18afc849acc25de0134f1e9b936b))

## [0.7.27](https://github.com/jimeh/.emacs.d/compare/v0.7.26...v0.7.27) (2021-04-20)


### Features

* **lang:** ensure markdown formatting respects local fill-column width ([1fade1a](https://github.com/jimeh/.emacs.d/commit/1fade1ab4d954a9f08c7f65c93eaa4ea91b51838))
* **lsp:** enable lsp-semantic-tokens ([c5ffefd](https://github.com/jimeh/.emacs.d/commit/c5ffefdb97d269b195dd13abdb46cac5d205dbd7))
* **org:** enable left/right shift keybinds which are available everywhere else ([cacb7d2](https://github.com/jimeh/.emacs.d/commit/cacb7d2fe90ca79cd0a63f9e8c75344c3c1dc270))
* **org:** expand and tweak org-src and org-babel setup ([c8187b4](https://github.com/jimeh/.emacs.d/commit/c8187b4be8bd3b8681c4fc2b122918b1ce3576da))

## [0.7.26](https://github.com/jimeh/.emacs.d/compare/v0.7.25...v0.7.26) (2021-04-15)


### Features

* **shell:** improve vterm setup making vterm-copy-mode easier to use ([2d39ce9](https://github.com/jimeh/.emacs.d/commit/2d39ce9fc11991a4fa12e8d55fcacc88dd311685))


### Bug Fixes

* **lang:** control Ruby formatting method on a per-project basis ([8728d5d](https://github.com/jimeh/.emacs.d/commit/8728d5da9e235bdfa76a9f89976a1e51bd2e84b7))
* **shell:** windmove keybindings within vterm-mode ([397b7ed](https://github.com/jimeh/.emacs.d/commit/397b7edb2062723dfae1ad89314a6bf9d0b5a35e))

## [0.7.25](https://github.com/jimeh/.emacs.d/compare/v0.7.24...v0.7.25) (2021-04-07)


### Features

* **lang:** add rufo package for Ruby ([f374dc4](https://github.com/jimeh/.emacs.d/commit/f374dc4eabe070244b0755b091649b738c9ff340))
* **lsp:** create and use on-save minor modes for lsp-format-buffer and lsp-organize-imports commands ([dc24cd4](https://github.com/jimeh/.emacs.d/commit/dc24cd4f7f45f7ddb7425288ffefc495164156e6))
* **makefile:** add next-version target to preview next version and changelog ([1fba384](https://github.com/jimeh/.emacs.d/commit/1fba3842dae25d5ef5c4e4aba04527250866e8e0))
* **shell:** add xterm-color package to colorize compilation buffers ([349f007](https://github.com/jimeh/.emacs.d/commit/349f007fe9420a5af0b6f4b19e4c47cf28c3bb47))
* **theme:** improve doom-themes overrides by using a proper theme ([5f4aa98](https://github.com/jimeh/.emacs.d/commit/5f4aa98abdf39a1e8927955ee8c19f66f382b390))


### Bug Fixes

* **formatting:** specify parser for prettier-js to avoid errors ([7de79dd](https://github.com/jimeh/.emacs.d/commit/7de79dd7049aa867ccf85f3aee1bb00b7175c08c))

## [0.7.24](https://github.com/jimeh/.emacs.d/compare/v0.7.23...v0.7.24) (2021-04-02)


### Features

* **themes:** make vertical divider between windows slightly more prominent ([301a134](https://github.com/jimeh/.emacs.d/commit/301a134a721ef3a7f91308a005b1eaba7f88834b))
* **version-control:** add module for git-gutter as an alternative to diff-hl ([1e5cc84](https://github.com/jimeh/.emacs.d/commit/1e5cc844d26d88df5b3fb4a65b81b65531eed288))
* **version-control:** tweak diff-hl style ([e7020e8](https://github.com/jimeh/.emacs.d/commit/e7020e814a399a274785f6ec82c063ec230f3f64))


### Bug Fixes

* **linting:** change flycheck fringe indicator to a left-pointing arrow ([d564fbe](https://github.com/jimeh/.emacs.d/commit/d564fbe75728b6368f0cb7bf8b5c2fe905afbf74))

## [0.7.23](https://github.com/jimeh/.emacs.d/compare/v0.7.22...v0.7.23) (2021-04-01)


### Features

* **lang:** handle additional file patterns with sh-mode ([009c3dc](https://github.com/jimeh/.emacs.d/commit/009c3dc4b1638f9f5ee128c45e3256212157f2bc))
* **lsp:** disable lsp-ui docs on mouse hover ([29e7e06](https://github.com/jimeh/.emacs.d/commit/29e7e066ce0ed6b890e36d4857b921cf54976901))


### Bug Fixes

* **version-control:** pin diff-hl to a known good commit ([5a425b5](https://github.com/jimeh/.emacs.d/commit/5a425b58122e6b134de60a20e7c18d2c29150aa0))

## [0.7.22](https://github.com/jimeh/.emacs.d/compare/v0.7.21...v0.7.22) (2021-03-22)


### Features

* **lang:** use reformatter to enable golines formatting ([06f0db1](https://github.com/jimeh/.emacs.d/commit/06f0db1035a6f31d50e9468976e5d89c72e3d238))
* **version-control:** switch diff-hl style back to default ([268b902](https://github.com/jimeh/.emacs.d/commit/268b9020aae3854fab9adbacbc984320fc8a0abd))


### Bug Fixes

* **lang:** populate auto-mode-alist with correct sh-mode function ([43ce3f6](https://github.com/jimeh/.emacs.d/commit/43ce3f6f73ceb0776f9b0c90c794cdf7cde89377))
* **version-control:** add missing magit hook for diff-hl ([d0223d4](https://github.com/jimeh/.emacs.d/commit/d0223d4253a64d4aa336fd091b82c98c92c29a1e))

## [0.7.21](https://github.com/jimeh/.emacs.d/compare/v0.7.20...v0.7.21) (2021-03-15)


### Features

* **lang:** enable manual formatting of go-mode buffers with golines ([da5ecff](https://github.com/jimeh/.emacs.d/commit/da5ecfffcd8c09f7cb3173cd5c7a4e52511f6ed0))
* **lsp:** tweak configuration for lsp-mode and lsp-ui ([b7bc119](https://github.com/jimeh/.emacs.d/commit/b7bc119af06c2c39f7544bd75ec68e4ffdddb460))
* **native_comp:** set comp-async-query-on-exit to t ([1767dae](https://github.com/jimeh/.emacs.d/commit/1767dae080c53031b0099acbe8ba73557ec7540d))
* **themes:** make comments and vertical bar slightly more visible ([49c8548](https://github.com/jimeh/.emacs.d/commit/49c85482b1a778e6401318303405e71f33638f28))


### Bug Fixes

* **lang:** disable duplicate before-save hooks for go-mode ([bc4328c](https://github.com/jimeh/.emacs.d/commit/bc4328c6d5af44a8e541c368724e10657abfa6a2))
* **misc:** do not enable explain-pause-mode automatically when emacs starts ([98b4e80](https://github.com/jimeh/.emacs.d/commit/98b4e800f509d6aa5219a0daeb5aeb506500842c))

## [0.7.20](https://github.com/jimeh/.emacs.d/compare/v0.7.19...v0.7.20) (2021-02-27)


### Features

* **editor:** update undo-tree to 0.8 ([0368206](https://github.com/jimeh/.emacs.d/commit/03682066c7bc47d772e4cf02dc4c5f1da63fe429))
* **lang:** add bf (benchmark func) snippet for go-mode ([62029fd](https://github.com/jimeh/.emacs.d/commit/62029fd83422366149f51b792199b0901e1a01de))
* **version-control:** add git-gutter support to siren-doom-themes customizations ([601a040](https://github.com/jimeh/.emacs.d/commit/601a040d2cf4a145a670e7cfc6a2521aed1cd80a))
* **version-control:** change diff-hl fringe bitmap style to be a thin solid line ([00f6db6](https://github.com/jimeh/.emacs.d/commit/00f6db64de004091300106b83785d67684c88be7))
* **version-control:** use diff-hl-margin-mode when running Emacs in a terminal ([efae487](https://github.com/jimeh/.emacs.d/commit/efae487c94a4a3c146616a238e230ac87a6d383c))


### Bug Fixes

* **lang:** ensure Go related env vars are correctly loaded ([e74800b](https://github.com/jimeh/.emacs.d/commit/e74800b5cbc01dd59e8cfdb03d27a56cc66bc914))
* **lang:** prevent dockerfile-mode wrongfully activating certain files ([147e9ed](https://github.com/jimeh/.emacs.d/commit/147e9ed1d3887f79935b2d264801e6acfe66327b))
* **native-comp:** expand ignored file patterns ([702b4eb](https://github.com/jimeh/.emacs.d/commit/702b4eb5d12184c88adf8e2272dee99ffc6b9824))
* **native-comp:** reduce warning by ignoring specific files which always fail to native-compile ([d0a1927](https://github.com/jimeh/.emacs.d/commit/d0a19270818f778e7fbc300cf7e4da5eabe4d454))
* **navigation:** ensure helm-ring is correctly loaded on startup ([bcd3440](https://github.com/jimeh/.emacs.d/commit/bcd34409db5d8dfddab8f70325c6b81b43f27b47))
* **startup:** correctly setup deferred loading for various packages ([395ad7c](https://github.com/jimeh/.emacs.d/commit/395ad7ccacd9f35750260230b7df5f04825e81a6))
* **text-editing:** correctly load custom snippets on emacs startup ([affbe2e](https://github.com/jimeh/.emacs.d/commit/affbe2e113975e4485c1fd280ee608872a8fedf4))

## [0.7.19](https://github.com/jimeh/.emacs.d/compare/v0.7.18...v0.7.19) (2021-02-14)


### Features

* **lang:** enable lsp-mode for sql-mode via sqls language server ([1ff9e88](https://github.com/jimeh/.emacs.d/commit/1ff9e880ba6cda9a1ace3e6a99398957a63e9864))


### Bug Fixes

* **lang:** debug current go test now works in non-root module packages ([f41a9da](https://github.com/jimeh/.emacs.d/commit/f41a9daff106588a14a8a2e96d469c3875497158))
* **lang:** for formatting of *.sql files with pgformatter ([dd4c77a](https://github.com/jimeh/.emacs.d/commit/dd4c77ad24595ae093cd5cb96e1d9e45261a5092))

## [0.7.18](https://github.com/jimeh/.emacs.d/compare/v0.7.17...v0.7.18) (2021-01-21)


### Bug Fixes

* **lang:** correctly add rubocopfmt package vars to list of safe local vars ([4f1e68f](https://github.com/jimeh/.emacs.d/commit/4f1e68f33eaf6c7cfe6c3509663ad63f1e23211d))
* **workspaces:** don't hide tab-bar on startup ([3e8bbe3](https://github.com/jimeh/.emacs.d/commit/3e8bbe36f4a21a5778648346b84c5830bc01b9a7))

## [0.7.17](https://github.com/jimeh/.emacs.d/compare/v0.7.16...v0.7.17) (2021-01-15)


### Features

* **lang:** format ruby-mode buffers with language server ([996a5b8](https://github.com/jimeh/.emacs.d/commit/996a5b8bf673c16194914dac0bd7598e92972dcb))
* **lsp:** enable code lenses, improve lsp-ui-doc setup ([e8544e7](https://github.com/jimeh/.emacs.d/commit/e8544e79e92dfd8545ddfdbe6384772c4a941982))
* **lsp:** tweak lsp-ui settings ([6271425](https://github.com/jimeh/.emacs.d/commit/6271425e150e207930501cc4a77d98a41f97f67e))
* **projects:** add all-the-icons-ibuffer package ([6425b46](https://github.com/jimeh/.emacs.d/commit/6425b4625cc72d9131cb5a0f0baefbb1a4ea2a50))
* **snippets:** add various snippets for go-mode ([d79e999](https://github.com/jimeh/.emacs.d/commit/d79e9999fd066b1438db9e027f52343783fa03dd))


### Bug Fixes

* **lang:** correctly load dap-mode for go-mode ([c1865ad](https://github.com/jimeh/.emacs.d/commit/c1865ad30950b18908b57d28f0fa2be34a896181))
* **lang:** correctly set projectile igonore directories ([2438f0a](https://github.com/jimeh/.emacs.d/commit/2438f0ab9000c8dcdfb0a5ab0b0be9e97d48fc79))
* **packages:** fix incompatibility with latest use-package ([50a85ca](https://github.com/jimeh/.emacs.d/commit/50a85ca8d8fbd2685b36d9d63e9245981e3e8907))
* **projects:** add missing dependency for all-the-icons ([5f278ab](https://github.com/jimeh/.emacs.d/commit/5f278ab2771438bb97b59a3af5d7a15004139a89))
* **projects:** correctly suppress treemacs load-time warnings ([8329c7e](https://github.com/jimeh/.emacs.d/commit/8329c7e91297c8ffbe7a366131fa218693607193))

## [0.7.16](https://github.com/jimeh/.emacs.d/compare/v0.7.15...v0.7.16) (2021-01-05)


### Features

* **lang:** enable debugging current test in go-mode via dap-mode ([672d6d8](https://github.com/jimeh/.emacs.d/commit/672d6d819cf2e522581dbfc9b222ed5bc521bbe7))

## [0.7.15](https://github.com/jimeh/.emacs.d/compare/v0.7.14...v0.7.15) (2020-12-25)


### Features

* **lang:** allow gopls language server to modify go.mod ([b31b35e](https://github.com/jimeh/.emacs.d/commit/b31b35edee44283fc04742373084b457562bb993))
* **tools:** add and configure restclient package ([2af986d](https://github.com/jimeh/.emacs.d/commit/2af986d57fe55f3058914b662e909c78b9c5cac0))
* **tools:** add httprepl package ([f675e1f](https://github.com/jimeh/.emacs.d/commit/f675e1f0304e1910ea05c605222996b4e1e7a9fe))
* **tools:** add ob-http package ([bbc0e4a](https://github.com/jimeh/.emacs.d/commit/bbc0e4a7148cd695ecc2897c53057821e6d1ac87))
* **version-control:** ensure magit uses correct width for tab indents ([07470c2](https://github.com/jimeh/.emacs.d/commit/07470c27bd6fad2e455511220ef6c5f08e0ab998))

## [0.7.14](https://github.com/jimeh/.emacs.d/compare/v0.7.13...v0.7.14) (2020-11-15)


### Features

* **debugging:** add dap-mode with basic config for Go and Ruby ([7917f6a](https://github.com/jimeh/.emacs.d/commit/7917f6ac5689de9da63bedd477a3563d978ca66d))
* **editor:** remove hideshowvis package ([811d14f](https://github.com/jimeh/.emacs.d/commit/811d14fda0ad238b213d3e22589ff9daefbfd0b4))
* **lang:** expand golang-related env vars which are imported ([9a51b31](https://github.com/jimeh/.emacs.d/commit/9a51b31c9e23f9e1dfd6ffcfcefbd9abfeffd1e1))
* **lsp:** bind lsp-ui-doc-glance to C-c C-d instead of lsp-ui-doc-show ([3812b3d](https://github.com/jimeh/.emacs.d/commit/3812b3df296e97f3cdd1303e73352c6802172534))
* **snippets:** add Golang snippet ft "for _, tt := range tests {...}" ([5c2229c](https://github.com/jimeh/.emacs.d/commit/5c2229c80744ccc2879557b123fd8b2796e38301))

## [0.7.13](https://github.com/jimeh/.emacs.d/compare/v0.7.12...v0.7.13) (2020-11-09)


### Features

* **lang:** enable terraform-ls language server support in terraform-mode ([3adfd0c](https://github.com/jimeh/.emacs.d/commit/3adfd0c0eb138ac2bd0e47bac993fc6a6e6b905d))
* **lang:** format go-mode buffers on save with gofumpt via lsp-mode ([7ca255d](https://github.com/jimeh/.emacs.d/commit/7ca255db9cde01fd263f8517b94cc448e6bfa838))

## [0.7.12](https://github.com/jimeh/.emacs.d/compare/v0.7.11...v0.7.12) (2020-10-29)


### Features

* **misc:** add rand-ip command to insert a random IPv4 address ([3edd57c](https://github.com/jimeh/.emacs.d/commit/3edd57c7532cb8f39f6f34632bfb01ffbeaa1c4f))
* **version-control:** correctly format forge-post-mode buffers with prettier-js ([f540569](https://github.com/jimeh/.emacs.d/commit/f5405690b4276962020414ceddb0fa87bc1d61dd))

## [0.7.11](https://github.com/jimeh/.emacs.d/compare/v0.7.10...v0.7.11) (2020-10-27)


### Features

* **lang:** add print related go-mode snippets ([ea03506](https://github.com/jimeh/.emacs.d/commit/ea0350669184adcf071db7045541ac0366032c9a))
* **misc:** add various rand-* commands for generating randomized data ([60df63b](https://github.com/jimeh/.emacs.d/commit/60df63bc4912175a7dce7b24f787514af8431bcf))


### Bug Fixes

* **lang:** disable indentation highlights for Makefiles ([192499a](https://github.com/jimeh/.emacs.d/commit/192499a67b4c51acee0bb4fbe244931829d2405a))
* **lang:** properly escape } in puts debug (pd) ruby-mode snippet ([c36be86](https://github.com/jimeh/.emacs.d/commit/c36be866131ce4c86dd5b699d0d6e01858b21c0d))
* **text-editing:** enable yasnippet via global mode ([11ac1a8](https://github.com/jimeh/.emacs.d/commit/11ac1a822c7c6dcfb0c1774a676d8b7875395d15))

## [0.7.10](https://github.com/jimeh/.emacs.d/compare/v0.7.9...v0.7.10) (2020-10-15)


### Bug Fixes

* **ui:** use advice to yes-or-no-p to y-or-n-p ([f987f01](https://github.com/jimeh/.emacs.d/commit/f987f01f9a099574de64880d898297d8413d88c5))

## [0.7.9](https://github.com/jimeh/.emacs.d/compare/v0.7.8...v0.7.9) (2020-10-09)


### Features

* **editor:** add common language statements to highlight-symbol-ignore-list ([0e204bc](https://github.com/jimeh/.emacs.d/commit/0e204bc3a7a1b6a70dddf1035946b48d7b6401a4))
* **org-mode:** disable section body indentation ([499349c](https://github.com/jimeh/.emacs.d/commit/499349cf3aa0baf71bdca6014c28666b08e622b3))
* **org-mode:** enable auto-fill-mode to automatically wrap lines at 80 characters ([b1689e0](https://github.com/jimeh/.emacs.d/commit/b1689e0d79f00bc703037638007ef807598223d7))


### Bug Fixes

* **lang:** ensure golang setup works with goenv ([9d45b1a](https://github.com/jimeh/.emacs.d/commit/9d45b1a908405909910b333bb89fefc86e5e1f80))

## [0.7.8](https://github.com/jimeh/.emacs.d/compare/v0.7.7...v0.7.8) (2020-10-04)

## [0.7.7](https://github.com/jimeh/.emacs.d/compare/v0.7.6...v0.7.7) (2020-09-27)


### Features

* **lang:** add jsonnet-mode ([5937589](https://github.com/jimeh/.emacs.d/commit/5937589cc5b040875fa7435af333c4df2893b30f))
* **macos:** move files/folders to trash instead of deleting them on macOS ([bda82a9](https://github.com/jimeh/.emacs.d/commit/bda82a9c775e8f73fb3090b9316ffd724198b9ad))

## [0.7.6](https://github.com/jimeh/.emacs.d/compare/v0.7.5...v0.7.6) (2020-09-23)


### Features

* **misc:** add uuidgen package ([9c28e42](https://github.com/jimeh/.emacs.d/commit/9c28e4229f58a5448e5ed79af58b072992f43956))

## [0.7.5](https://github.com/jimeh/.emacs.d/compare/v0.7.4...v0.7.5) (2020-09-10)


### Bug Fixes

* **lang:** resolve json-snatcher issue by overriding it with a fork ([298587d](https://github.com/jimeh/.emacs.d/commit/298587d35d70743aca7ef7b8d5230a86469d1320))

## [0.7.4](https://github.com/jimeh/.emacs.d/compare/v0.7.3...v0.7.4) (2020-09-01)


### Bug Fixes

* **workspaces:** do not auto-load "default" desktop on startup ([6003c89](https://github.com/jimeh/.emacs.d/commit/6003c899945c50017be0f1c0cee9953a6c91e20b))

## [0.7.3](https://github.com/jimeh/.emacs.d/compare/v0.7.2...v0.7.3) (2020-08-28)


### Features

* **workspaces:** hide workspace name in modeline ([04b2524](https://github.com/jimeh/.emacs.d/commit/04b252438bec2ef4ef04e4808e2d21f813ae964b))
* **workspaces:** strip down frame parameters saved to desktop file ([7a1ab57](https://github.com/jimeh/.emacs.d/commit/7a1ab57606a2d7a89f370057670db11071ecaf41))
* **workspaces:** tweak tab-bar keybindings and turn on tab-bar-history-mode ([4203fdb](https://github.com/jimeh/.emacs.d/commit/4203fdb383cd32e4ad6089aa88598f5feac2f5da))


### Bug Fixes

* **native_comp:** correctly set custom comp-eln-load-path ([4e7ec6a](https://github.com/jimeh/.emacs.d/commit/4e7ec6ade80f5ac10a72beb6d67c3ea5fc737faa))
* **packages:** update package definitions to be compatible with latest straight.el ([1c81570](https://github.com/jimeh/.emacs.d/commit/1c81570ef7cf6b932b888e08467f41308a23039a))

## [0.7.2](https://github.com/jimeh/.emacs.d/compare/v0.7.1...v0.7.2) (2020-08-20)


### Features

* **windows:** use new windmove-swap-* functions on Emacs 27 and later ([dccb577](https://github.com/jimeh/.emacs.d/commit/dccb57747efe78c498951deefff0ddba2f28050d))


### Bug Fixes

* **lang:** Disable ruby-specific C-c C-b binding ([0981431](https://github.com/jimeh/.emacs.d/commit/098143191da2bf0d410dbd9ad4b00d2b72bb6ca4))
* **lang:** fix issue with json-mode when native-comp is used ([0082330](https://github.com/jimeh/.emacs.d/commit/00823307ac6d4b53f0a1f99299953be017ee69c1))
* **native_comp:** automatically delete invalid *.eln files on startup ([cb86a67](https://github.com/jimeh/.emacs.d/commit/cb86a6721f7a29b89b21f4baf6ca43586eb91176))

## [0.7.1](https://github.com/jimeh/.emacs.d/compare/v0.7.0...v0.7.1) (2020-08-18)


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

## [0.6.12](https://github.com/jimeh/.emacs.d/compare/v0.6.11...v0.6.12) (2020-08-11)


### Features

* **lang:** add vue-mode for working with .vue files ([d1f4e13](https://github.com/jimeh/.emacs.d/commit/d1f4e138862b203e6ef0b72c2a003fa25bfdecb6))
* **lang:** Remove robe package in favor of lsp-mode for Ruby ([4ba09d4](https://github.com/jimeh/.emacs.d/commit/4ba09d49b6019fe79fa20a257ac01ce291daf123))


### Bug Fixes

* **navigation:** Update setup for recent changes to helm ([6cca25c](https://github.com/jimeh/.emacs.d/commit/6cca25c66cc673ac6208071adc5f5f254036a599))

## [0.6.11](https://github.com/jimeh/.emacs.d/compare/v0.6.10...v0.6.11) (2020-07-21)


### Features

* **lang:** Improve markdown formatting on save ([8376b71](https://github.com/jimeh/.emacs.d/commit/8376b71b7c929c902cab3178c6eab53127abc7b0))
* **shell:** Switch shell-pop from ansi-term to vterm ([4338d85](https://github.com/jimeh/.emacs.d/commit/4338d85291bb48f247865796c9bfecf1eff1db09))


### Bug Fixes

* **workspaces:** Recent persp now works after renaming persps ([a04e57f](https://github.com/jimeh/.emacs.d/commit/a04e57f88710c3ca5a4a63c55cd59d7d46413320))

## [0.6.10](https://github.com/jimeh/.emacs.d/compare/v0.6.9...v0.6.10) (2020-07-13)


### Features

* **lang:** Set new rubocopfmt-include-unsafe-cops option to t ([7d0ff60](https://github.com/jimeh/.emacs.d/commit/7d0ff606a3895a6f46b562d50875a234d4dd97d8))


### Bug Fixes

* **helm:** Helm failure when tramp-methods variable is not defined ([2059714](https://github.com/jimeh/.emacs.d/commit/20597149bbd0fe873c4a81778c8f50d9f93d5a4f))

## [0.6.9](https://github.com/jimeh/.emacs.d/compare/v0.6.8...v0.6.9) (2020-07-04)


### Features

* **lsp:** Improve lsp-mode performance, support latest 7.x version ([efd0b42](https://github.com/jimeh/.emacs.d/commit/efd0b421e34f93cab1b990123930c1dc9877a712))

## [0.6.8](https://github.com/jimeh/.emacs.d/compare/v0.6.7...v0.6.8) (2020-07-02)


### Features

* **lang:** Enable terminal-friendly quote toggle for ruby-mode ([9b5c22f](https://github.com/jimeh/.emacs.d/commit/9b5c22f9e29726c806a7961a9b65c789e55adaf3))
* **windows:** Enable terminal friendly zoom-window keybinding ([2fa061b](https://github.com/jimeh/.emacs.d/commit/2fa061bdec7cc1c0bf7bb27736faef5dfeb23055))


### Bug Fixes

* **editor:** Make undo-tree a bit more terminal friendly ([bbc98de](https://github.com/jimeh/.emacs.d/commit/bbc98decea771ea843639cd2386ed68ac42bdcd0))
* **navigation:** Dired disk usage command was unreliable on Linux ([acb2d6f](https://github.com/jimeh/.emacs.d/commit/acb2d6f5fa7648e29895fb8b05085ac65e084f4d))

## [0.6.7](https://github.com/jimeh/.emacs.d/compare/v0.6.6...v0.6.7) (2020-06-07)


### Features

* **lang:** Add jinja2-mode for Jinja2 templates ([84bdd61](https://github.com/jimeh/.emacs.d/commit/84bdd610caa4a1cca3c2c02e26f9735340c5b102))
* **lang:** Language aware syntax highlight of markdown code-blocks ([a746106](https://github.com/jimeh/.emacs.d/commit/a74610689e2e57f5799b3fc77c080b6add5be306))
* **navigation:** Add file/directory size commands to Dired ([ecc278b](https://github.com/jimeh/.emacs.d/commit/ecc278b83ba97643a14c3b98c1e8d9b8b0fac307))


### Bug Fixes

* **lang:** Work around for whitespace-mode issue with caddyfile-mode ([1ef8570](https://github.com/jimeh/.emacs.d/commit/1ef8570f059444a0cf31da3cfe938c4a6af87a95))

## [0.6.6](https://github.com/jimeh/.emacs.d/compare/v0.6.5...v0.6.6) (2020-06-05)


### Features

* **lang:** Add caddyfile-mode for Caddy config files ([e6b52a5](https://github.com/jimeh/.emacs.d/commit/e6b52a534a9ef657734512d52101b529e2c798a0))
* **workspaces:** Improve persp-mode "UI" helpers ([984b9fb](https://github.com/jimeh/.emacs.d/commit/984b9fb3aa101e13885114637046b77827bcea29))


### Bug Fixes

* **workspaces:** Attempt to fix persp-mode forgetting persp layouts ([ca2d51b](https://github.com/jimeh/.emacs.d/commit/ca2d51bebdc651e5b036861438f54cc1c6df6191))

## [0.6.5](https://github.com/jimeh/.emacs.d/compare/v0.6.4...v0.6.5) (2020-05-30)


### Features

* **lang:** Add terraform-doc package ([e6ff06e](https://github.com/jimeh/.emacs.d/commit/e6ff06ea2c3ba07e31446ff356c92974649bc9f0))
* **windows:** Integrate windmove with tmux ([0810857](https://github.com/jimeh/.emacs.d/commit/0810857131fb2cc7103dbf26d5ed48d21c151829))


### Bug Fixes

* **lang:** terraform-mode now formats buffers on save correctly ([bf4c49d](https://github.com/jimeh/.emacs.d/commit/bf4c49dd1ff3c8dbf18a98cf3ce951d287332640))
* **themes:** Handle highlight-indent-guides when switching themes ([88ceeaa](https://github.com/jimeh/.emacs.d/commit/88ceeaa7c79ff171f62554911874d280948e148c))

## [0.6.4](https://github.com/jimeh/.emacs.d/compare/v0.6.3...v0.6.4) (2020-05-23)


### Features

* **lang:** Add module for terraform-mode package ([e4c8643](https://github.com/jimeh/.emacs.d/commit/e4c864319a75d26a4d73971d41a8baf5fd5f284d))
* **lang:** Add support for Haskell via haskell-mode ([0f13518](https://github.com/jimeh/.emacs.d/commit/0f13518f918881f1836b25aa4fab8d23d242ff5f))
* **lang:** Format shell scripts with shfmt on save ([c220e65](https://github.com/jimeh/.emacs.d/commit/c220e65a99c5f7a93df0c6450342d8b8403be996))
* **persp-mode:** Enable switching to most recent persp ([3c8fe70](https://github.com/jimeh/.emacs.d/commit/3c8fe70d8e525f67be9f19e88c33adc965e260d6))
* **text-editing:** Add reformatter package ([be39020](https://github.com/jimeh/.emacs.d/commit/be39020c64e94c79f08adc8844f06f772343a2e8))


### Bug Fixes

* **lang:** Switch back to formatting Ruby with rubocop-daemon ([aee6af6](https://github.com/jimeh/.emacs.d/commit/aee6af61289cdfe3f12e02db03676c0190034d5b))

## [0.6.3](https://github.com/jimeh/.emacs.d/compare/v0.6.2...v0.6.3) (2020-05-19)


### Features

* **lang:** Enable use of markdown-edit-code-block ([ac0bf9b](https://github.com/jimeh/.emacs.d/commit/ac0bf9b42eb85ce60c682f7961fc58dadba23cab))
* **lang:** Format ruby files with `lsp-format-buffer` ([a71fc70](https://github.com/jimeh/.emacs.d/commit/a71fc70e66ca48d8d126f2c376583bd23afde547))
* **lang:** Use rubocop-daemon to format ruby files on save ([25441f4](https://github.com/jimeh/.emacs.d/commit/25441f47d31880e4be29418da040adc7bfa28fe2))
* **lsp:** Improve lsp-mode setup with a prefix key and company tweaks ([764c4da](https://github.com/jimeh/.emacs.d/commit/764c4dae74f40ab930cf2a52d2640d668a5531d4))
* **performance:** Add explain-pause-mode ([8814bf1](https://github.com/jimeh/.emacs.d/commit/8814bf130309e4deaeff6c4eeed54a3a59ea2571))


### Bug Fixes

* **navigation:** Ensure imenu config was is set correctly ([8868e97](https://github.com/jimeh/.emacs.d/commit/8868e975e290209cabbe15cc6676e05d66ce98de))

## [0.6.2](https://github.com/jimeh/.emacs.d/compare/v0.6.1...v0.6.2) (2020-05-10)


### Features

* **editor:** Replace browse-kill-ring with helm-show-kill-ring ([cdacf31](https://github.com/jimeh/.emacs.d/commit/cdacf31ca03a959a52ee8c1cd860d0fc792ea484))


### Bug Fixes

* **lsp:** Add helm-lsp-workspace-symbol keybinding for terminal use ([a6a8452](https://github.com/jimeh/.emacs.d/commit/a6a84524bd0648f5e02869302b3142cc7e135bbf))
* **navigation:** Improve helm-ag keybindings ([decc1c5](https://github.com/jimeh/.emacs.d/commit/decc1c58c1b9da674c259826b8ad439d5ef6c04b))
* **navigation:** Improve helm-apropos usage ([c69dec3](https://github.com/jimeh/.emacs.d/commit/c69dec37bc183e26e7d43be6b3cd0ac25bb533e4))
* **navigation:** Lazy-load helm without breaking keybindings ([cb16ffe](https://github.com/jimeh/.emacs.d/commit/cb16ffe993ac991ee5ceb04f70c405468cb78304))
* **projects:** Improve helm-projectile keybindings in terminal ([cc8a76c](https://github.com/jimeh/.emacs.d/commit/cc8a76c617eab90f584b60319750a774ce2b8ab9))

## [0.6.1](https://github.com/jimeh/.emacs.d/compare/v0.6.0...v0.6.1) (2020-05-07)


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
