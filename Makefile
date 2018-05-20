.SILENT:


#
# Main targets
#

.PHONY: backup-elpa
backup-elpa:
	tar -cjf elpa_$(shell date "+%Y-%m-%d").tar.bz2 elpa

.PHONY: vendor
vendor: \
	vendor/dired+.el \
	vendor/escreen.el \
	vendor/hideshowvis.el \
	vendor/linum+.el \
	vendor/rubocopfmt.el \
	vendor/tomorrow-night-paradise-theme.el

.PHONY: update_vendor
update_vendor: \
	update_vendor/dired+.el \
	update_vendor/escreen.el \
	update_vendor/hideshowvis.el \
	update_vendor/linum+.el \
	update_vendor/rubocopfmt.el \
	update_vendor/tomorrow-night-paradise-theme.el

#
# Internals
#

define vendored
$(1):
	echo "fetching $(1)..." && curl -s -L -o "$(1)" "$(2)"

.PHONY: remove_$(1)
remove_$(1):
	(test -f "$(1)" && rm "$(1)" && echo "removed $(1)") || exit 0

.PHONY: update_$(1)
update_$(1): remove_$(1) $(1)
endef


#
# Specify vendor targets
#

$(eval $(call vendored,vendor/dired+.el,"https://www.emacswiki.org/emacs/download/dired%2b.el"))
$(eval $(call vendored,vendor/escreen.el,"https://github.com/renard/escreen-el/raw/master/escreen.el"))
$(eval $(call vendored,vendor/hideshowvis.el,"https://www.emacswiki.org/emacs/download/hideshowvis.el"))
$(eval $(call vendored,vendor/linum+.el,"http://www.emacswiki.org/emacs/download/linum%2b.el"))
$(eval $(call vendored,vendor/rubocopfmt.el,"https://github.com/jimeh/rubocopfmt.el/raw/master/rubocopfmt.el"))
$(eval $(call vendored,vendor/tomorrow-night-paradise-theme.el,"https://github.com/jimeh/tomorrow-night-paradise-theme.el/raw/master/tomorrow-night-paradise-theme.el"))
