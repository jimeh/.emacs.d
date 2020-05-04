#
# Default target.
#

default: vendor

.PHONY: new-version
new-version:
	$(if $(shell which npx),,\
		$(error No npx found in PATH, please install NodeJS))
	$(if $(shell which standard-version),,\
		$(error No standard-version found in PATH, install with: \
			npm install -g standard-version))

	npx standard-version


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


#
# Main targets.
#

vendor: $(VENDORED)
update_vendor: $(foreach file,$(VENDORED),update_$(file))
remove_vendor: $(foreach file,$(VENDORED),remove_$(file))

.PHONY: backup-elpa
backup-elpa:
	tar -cjf elpa_$(shell date "+%Y-%m-%d").tar.bz2 elpa
