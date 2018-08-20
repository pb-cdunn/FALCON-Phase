run:
	snakemake -s snakefile --verbose -p
gen: config-template.bash
	bash $< >| config.json
