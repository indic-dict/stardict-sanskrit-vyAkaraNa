STARDICT_TOOLS_DIR=~/stardict/tools/src/
TABFILE=$(STARDICT_TOOLS_DIR)/tabfile
DICT_TOOLS_BIN_BASH=~/indic-dict/stardict-sanskrit/bin

# make all DICTS=xyz
DICTS=.*

URL=https://github.com/indic-dict/stardict-sanskrit-vyAkaraNa/raw/master/tars

.PHONY: all stardict tars

all:final_babylon stardict tars

final_babylon:
	bash $(DICT_TOOLS_BIN_BASH)/babylon_add_optitrans.sh DICTS=$(DICTS)

stardict:
	bash $(DICT_TOOLS_BIN_BASH)/tsv_to_stardict.sh DICTS=$(DICTS)


tars:
	bash $(DICT_TOOLS_BIN_BASH)/make_tarballs.sh $(URL) DICTS=$(DICTS)

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))
# Let the URL not end with /.
tarlist:
	bash $(DICT_TOOLS_BIN_BASH)/update_tars_md.sh $(current_dir)tars $(URL)
