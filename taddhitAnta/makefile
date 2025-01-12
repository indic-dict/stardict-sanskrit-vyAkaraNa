SUBDIRS := $(shell find . -mindepth 1 -maxdepth 1 -type d ! -name vidyut_* ! -name .)
# SUBDIRS := $(wildcard */.)  # e.g. "foo/. bar/."
TARGETS := full all tars tarlist  # whatever else, but must not contain '/'

# foo/all bar/all foo/clean bar/clean
SUBDIRS_TARGETS := $(foreach t,$(TARGETS),$(addsuffix /%,$(SUBDIRS)))

.PHONY : $(TARGETS) $(SUBDIRS_TARGETS)

# static pattern rule, expands into:
# all clean : % : foo/% bar/%
$(TARGETS) : % :
	@$(foreach dir,$(SUBDIRS),$(MAKE) -C $(dir) $(@) || exit $$?;)

# here, for foo/all:
#   $(@D) is foo
#   $(@F) is all
$(SUBDIRS_TARGETS) :
	$(MAKE) -C $(@D) $(@F)
