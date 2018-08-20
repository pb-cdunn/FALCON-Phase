source /mnt/software/Modules/current/init/bash
module purge
module load python/3
module load snakemake
module load bwa/0.7.17
module load bedtools/2.27.1
module load samtools/1.7
module load mummer/4.0.0
module load htslib zlib libbz2
module load gcc

export PYTHONUSERBASE=/scratch/cdunn/repo/sk/.git/LOCAL3
