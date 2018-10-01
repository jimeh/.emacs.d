#
# Default target.
#

default: vendor


#
# Functions.
#

define vendored
VENDORED = $(VENDORED) $(1)

.SILENT: $(1)
$(1):
	echo "fetching $(1)..." && curl -s -L -o "$(1)" "$(2)"

.PHONY: remove_$(1)
.SILENT: remove_$(1)
remove_$(1):
	(test -f "$(1)" && rm "$(1)" && echo "removed $(1)") || exit 0

.PHONY: update_$(1)
.SILENT: update_$(1)
update_$(1): remove_$(1) $(1)
endef


#
# Defined vendored dependencies.
#

$(eval $(call vendored,vendor/dired+.el,https://www.emacswiki.org/emacs/download/dired%2b.el))
$(eval $(call vendored,vendor/escreen.el,https://github.com/renard/escreen-el/raw/master/escreen.el))
$(eval $(call vendored,vendor/hideshowvis.el,https://www.emacswiki.org/emacs/download/hideshowvis.el))
$(eval $(call vendored,vendor/linum+.el,http://www.emacswiki.org/emacs/download/linum%2b.el))
$(eval $(call vendored,vendor/ruby-guard.el,https://github.com/zhangkaiyulw/ruby-guard/raw/master/ruby-guard.el))
$(eval $(call vendored,vendor/tomorrow-night-paradise-theme.el,https://github.com/jimeh/tomorrow-night-paradise-theme.el/raw/master/tomorrow-night-paradise-theme.el))


#
# Main targets.
#

vendor: $(VENDORED)
update_vendor: $(foreach file,$(VENDORED),update_$(file))
remove_vendor: $(foreach file,$(VENDORED),remove_$(file))

.PHONY: backup-elpa
backup-elpa:
	tar -cjf elpa_$(shell date "+%Y-%m-%d").tar.bz2 elpa
