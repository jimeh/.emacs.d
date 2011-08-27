# My .emacs.d Config Folder #

This is my personal Emacs configuration. Having been primarily a TextMate user
previously, my setup might also work nicely for other TM users who are curious
about Emacs.

That said, this is not some form of an Emacs starter kit, it's simply my
personal config with any quirks, oddities, bugs, and man-eating errors I live
with on a daily basis.


## Requirements ##

My config uses Emacs 24's new package system, and also the awesome [el-get][]
package manager. The latest stable version of Emacs is currently 23, so you'll
need to get ahold of a nightly build somehow.

[el-get]: https://github.com/dimitri/el-get


### Mac OS X ###

Personally I use [Homebrew][] to install Emacs from the latest source,
specially since Homebrew includes a few OSX specific patches, like full-screen
support.

[homebrew]: http://mxcl.github.com/homebrew/

To install with Homebrew:

    brew install emacs -HEAD --cocoa

Or if you prefer to not compile it yourself, and you can live without
full-screen, you can download the latest nightly from:
[emacsformacosx.com][].

[emacsformacosx.com]: http://emacsformacosx.com/builds


### Linux, Windows ###

I'm afraid you'll have to figure out how to get Emacs 24 yourself. Like I
said, this is not a starter kit.


## Installation ##

Simply clone my config repo to `~/.emacs.d` update git submodules, and launch
Emacs:

    git clone git://github.com/jimeh/.emacs.d.git ~/.emacs.d
    cd ~/.emacs.d
    git submodule init
    git submodule update

Once you launch Emacs, it'll load in the config and the list of packages to
use, automatically installing any packages which are not installed. This means
your first launch can take as long as 5-10 minutes, and also display some
ruby-related errors. On subsequent launches it's fast and error free.

*Remember how I said you'll have to live with the bugs too if you wanna use my
config? ;)*


## Notes ##

* Feel free to fork and tweak :)
* Theme-wise I use a slightly tweaked version of [Joe Bergantine][]'s [Birds of
  Paradise][] theme, which I've made available [here][my-theme]. The original
  Emacs port was created by Paul M. Rodriguez, and I can't remember or find
  where I got it from originally, so I posted it to [this][ori-theme] Gist.
* I've customized keyboard shortcuts a decent bit, which you can overview in
  [keybindings.el][].
* Flyspell is set to use `aspell` instead of the default `ispell` command.
* For those who want a project tree view, there's `M-x dirtree`.
* Most language specific tweaks are in the respective files in the
  [languages][] folder.
* There's a lot of stuff in here, dig through the config files manually :)

[Joe Bergantine]: http://joebergantine.com/
[Birds of Paradise]: http://joebergantine.com/werkstatt/birds-of-paradise
[my-theme]: https://github.com/jimeh/birds-of-paradise-plus-theme.el
[ori-theme]: https://gist.github.com/1130343
[keybindings.el]: https://github.com/jimeh/.emacs.d/blob/master/keybindings.el
[languages]: https://github.com/jimeh/.emacs.d/tree/master/languages


## Todo ##

* Improve ReadMe.
* Come up with more todos.
