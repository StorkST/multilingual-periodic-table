#
# makefile for adjmulticol package
#
# this file is in public domain
#
# $id$
#

langs := en fr ru

version := v1.0.1
zip_stem := periodic-table-$(version).zip

today := $(shell date +%Y/%m/%d)
version_en := $(version) - $(today)
version_fr := $(version) - $(today)
version_ru := $(version) - $(today)

build_dir := build
OUT_DIR := $(build_dir)

# Ex: pdflatex -jobname=periodic_table "\def\target{fr} \def\withExtra{no} \input{languages.tex} \input{periodic_table.tex}"
TEX = \
	pdflatex -output-directory $(build_dir) -jobname=$(1) \
	"\def\target{$(2)} \
	\def\withExtra{$(3)} \
	\def\refvar{$(1)} \
	\def\version{$(4)} \
	\input{periodic_table.tex}"

suffix_files := PeriodicTable.pdf PeriodicTable-extra.pdf

files_lang = $(addprefix $(1)-,$(suffix_files))
files_langs = $(foreach lang,$(1),$(call files_lang,$(lang)))

zip_lang = $(addprefix $(1)-,$(zip_stem))
zip_langs = $(foreach lang,$(1),$(call zip_lang,$(lang)))

# Specific variables. Configuration of Latex template.

en-%: lang := en
en-%: version := $(version_en)
fr-%: lang := fr
fr-%: version := $(version_fr)
ru-%: lang := ru
ru-%: version := $(version_ru)
extra := no
%extra.pdf: extra := yes


# MAIN: Rules to produce files
.PHONY: all dir $(langs) $(lang_level)

# for some reason doesn't work, pdf files are not found in the zip command
all: dir $(langs)

%-$(zip_stem):
	$(MAKE) $(call files_lang,$(lang))
	cd $(OUT_DIR) && zip -r -j $@ . -i $(OUT_DIR)/$(lang)*.pdf

# ex: en fr ru
$(langs): dir
	$(MAKE) $(call zip_langs,$@)

%.pdf:
	$(call TEX,$(basename $@),$(lang),$(extra),$(version))

# Other rules

$(OUT_DIR):
	mkdir -p $(OUT_DIR)

dir: $(OUT_DIR) # Create build directories

clean:
	$(RM) -r $(build_dir)/*.aux
	$(RM) -r $(build_dir)/*.log

veryclean:
	$(RM) -r $(build_dir)/*

