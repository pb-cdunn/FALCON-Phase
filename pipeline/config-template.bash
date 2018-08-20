cat <<END
{
	"env"		: "config.sh",
	"CPU"		: "20",
	"nucmer"	: "`which nucmer`",
	"delta-filter"	: "`which delta-filter`",
	"show-coords"	: "`which show-coords`",
	"samtools"	: "`which samtools`",
	"hp"		: "`which coords2hp.py`",
	"hpfilt"	: "`which filt_hp.py`",
	"falcon_phase"	: "`which falcon-phase`",
	"falcon_oi"	: "`which primary_contig_index.pl`",
	"bedtools"	: "`which bedtools`",
	"emit"		: "`which emit_haplotigs.pl`",
	"bwa"		: {
		"path"	: "`which bwa`",
		"cpu"	: "24"
	},
	"sample": {
		"name"			: "test_data",
		"output_format"		: "pseudohap",
		"min_aln_len"		: "5000",
		"p_to_h"		: "../test_data/name_mapping.txt",
		"p_ctgs"		: "../test_data/cns_p_ctg.clean.fasta",
		"h_ctgs"		: "../test_data/cns_h_ctg.clean.fasta",
		"r1"			: "../test_data/S3HiC_R1.fastq",
		"r2"			: "../test_data/S3HiC_R2.fastq",
		"enzyme"		: "GATC",
		"iter"			: "10000"
	}
}
END
