module purge
module load git
module load python/3
module load gcc
module load ccache
module load htslib
module load zlib libbz2
#module load ncurses lzma

module load snakemake
module load bwa/0.7.17
module load bedtools/2.25.0
module load samtools/1.7
module load mummer/4.0.0

export PYTHONUSERBASE=$(pwd)/.git/LOCAL3
