.SILENT:

.PHONY: backup-elpa
backup-elpa:
	tar -cjf elpa_$(shell date "+%Y-%m-%d").tar.bz2 elpa

.PHONY: vendor
vendor: \
	vendor/escreen.el \
	vendor/linum+.el \
	vendor/omnifmt.el \
	vendor/standardfmt.el

.PHONY: update_vendor
update_vendor: \
	update_vendor/escreen.el \
	update_vendor/linum+.el \
	update_vendor/omnifmt.el \
	update_vendor/standardfmt.el


vendor/escreen.el:
	echo "fetching vendor/escreen.el..." && \
	curl -s -L -o vendor/escreen.el \
	https://github.com/renard/escreen-el/raw/master/escreen.el

.PHONY: remove_vendor/escreen.el
remove_vendor/escreen.el:
	( \
		test -f "vendor/escreen.el" && rm "vendor/escreen.el" && \
		echo "removed vendor/escreen.el" \
	) || exit 0

.PHONY: update_vendor/escreen.el
update_vendor/escreen.el: remove_vendor/escreen.el vendor/escreen.el


vendor/linum+.el:
	echo "fetching vendor/linum+.el..." && \
	curl -s -L -o vendor/linum+.el \
	http://www.emacswiki.org/emacs/download/linum%2b.el

.PHONY: remove_vendor/linum+.el
remove_vendor/linum+.el:
	( \
		test -f "vendor/linum+.el" && rm "vendor/linum+.el" && \
		echo "removed vendor/linum+.el" \
	) || exit 0

.PHONY: update_vendor/linum+.el
update_vendor/linum+.el: remove_vendor/linum+.el vendor/linum+.el


vendor/omnifmt.el:
	echo "fetching vendor/omnifmt.el..." && \
	curl -s -L -o vendor/omnifmt.el \
	https://raw.githubusercontent.com/omnitools/omnifmt-emacs/master/omnifmt.el

.PHONY: remove_vendor/omnifmt.el
remove_vendor/omnifmt.el:
	( \
		test -f "vendor/omnifmt.el" && rm "vendor/omnifmt.el" && \
		echo "removed vendor/omnifmt.el" \
	) || exit 0

.PHONY: update_vendor/omnifmt.el
update_vendor/omnifmt.el: remove_vendor/omnifmt.el vendor/omnifmt.el


vendor/standardfmt.el:
	echo "fetching vendor/standardfmt.el..." && \
	curl -s -L -o vendor/standardfmt.el \
	https://raw.githubusercontent.com/jimeh/standardfmt.el/master/standardfmt.el

.PHONY: remove_vendor/standardfmt.el
remove_vendor/standardfmt.el:
	( \
		test -f "vendor/standardfmt.el" && rm "vendor/standardfmt.el" && \
		echo "removed vendor/standardfmt.el" \
	) || exit 0

.PHONY: update_vendor/standardfmt.el
update_vendor/standardfmt.el: remove_vendor/standardfmt.el vendor/standardfmt.el
