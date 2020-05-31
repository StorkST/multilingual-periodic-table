#
# makefile for adjmulticol package
#
# this file is in public domain
#
# $id$
#

langs := en fr ru

today := $(shell date +%Y/%m/%d)
version_en := v1.0 - $(today)
version_fr := v1.0 - $(today)
version_ru := v1.0 - $(today)

output_dir := output
OUT_DIR := $(output_dir)

# Ex: pdflatex -jobname=periodic_table "\def\target{fr} \def\withExtra{no} \input{languages.tex} \input{periodic_table.tex}"
TEX = \
	pdflatex -output-directory $(output_dir) -jobname=$(1) \
	"\def\target{$(2)} \
	\def\withExtra{$(3)} \
	\def\refvar{$(1)} \
	\def\version{$(4)} \
	\input{periodic_table.tex}"

suffix_files := PeriodicTable.pdf PeriodicTable-extra.pdf

files_lang = $(addprefix $(1)-,$(suffix_files))
files_langs = $(foreach lang,$(1),$(call files_lang,$(lang)))

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

all: dir $(call files_langs,$(langs))

# ex EN FR RU
$(langs): dir
	$(MAKE) $(call files_langs,$@)

%.pdf:
	$(call TEX,$(basename $@),$(lang),$(extra),$(version))


# Other rules

$(OUT_DIR):
	mkdir -p $(OUT_DIR)

dir: $(OUT_DIR) # Create output directories

clean:
	$(RM) -r $(output_dir)/*.aux
	$(RM) -r $(output_dir)/*.log

veryclean:
	$(RM) -r $(output_dir)/*

