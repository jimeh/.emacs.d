#
# Default target.
#

default: vendor

#
# Functions.
#

define vendored
VENDORED += $(1)

.SILENT: $(1)
$(1):
	echo "fetching $(1)..." && \
	mkdir -p "$(dir $(1))" && \
	curl -s -L -o "$(1)" "$(2)" && \
	([[ "$(1)" == "bin/"* ]] && chmod +x "$(1)") || exit 0

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

$(eval $(call vendored,bin/rubocop-daemon-wrapper,https://github.com/fohte/rubocop-daemon/raw/master/bin/rubocop-daemon-wrapper))

#
# Main targets.
#

vendor: $(VENDORED)
update_vendor: $(foreach file,$(VENDORED),update_$(file))
remove_vendor: $(foreach file,$(VENDORED),remove_$(file))
