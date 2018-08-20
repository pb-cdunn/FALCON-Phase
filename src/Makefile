.PHONY: all clean

OBJ = matrix.o bam_filt.o count_motif.o dna.o run_phasing.o string_parser.o 
SRC = matrix.c bam_filt.c count_motif.c dna.c run_phasing.c string_parser.c

CFLAG=-Wall -O3

INCLUDE:=-Isrc $(shell pkg-config --cflags zlib htslib)
LDFLAGS:=$(shell pkg-config --libs zlib htslib bzip2)
#-llzma

all: ../bin/falcon-phase
	@echo "\n\n[INFO] build OK, found falcon-phase!\n\n"

#../htslib/libhts.a:
#	cd ../htslib && $(MAKE)

../bin/falcon-phase: main.c $(OBJ) | ../bin
	gcc $(CFLAG) main.c $(OBJ) $(INCLUDE) $(LDFLAGS) -lbz2 -lm -lpthread  -o ../bin/falcon-phase

$(OBJ) : %.o : %.c
	gcc $(CFLAG) $(INCLUDE) -c $< -o $@

../bin:
	mkdir -p ../bin

clean:
	@rm -rf *.o; rm -rf ../bin/falcon-phase
