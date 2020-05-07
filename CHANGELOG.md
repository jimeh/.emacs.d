# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

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
