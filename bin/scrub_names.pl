#!/usr/bin/perl
use strict;
use warnings;
use Getopt::Long;

#-----------------------------------------------------------------------------
#----------------------------------- MAIN ------------------------------------
#-----------------------------------------------------------------------------
my $usage = "

Synopsis:

scrub_names.pl p-contigs.fa h-contigs.fa > name_mapping.txt

Description:

This code removes \"|arrow\" from the sequence names and creats the name 
mapping file for the snakemake pipeline. FALCON-Phase expects the p-contig 
names start with *.F and the h-contigs names follow the *.F_[0-9]+ convention. 

";


my ($help);
my $opt_success = GetOptions('help'    => \$help,
			      );

die $usage if $help || ! $opt_success;

my $file = shift;
die $usage unless $file;
open (my $IN, '<', $file) or die "Can't open $file for reading\n$!\n";

my %primaries;
my @haplotigs;

my @fname = split /\./, $file;
pop @fname;
push @fname, "clean.fasta";
my $oname = join ".", @fname; 

open (my $OUT, '>', $oname) or die "Can't open $oname for reading\n$!\n";

PRI: while (<$IN>) {
    if($_ !~ />/){
	print $OUT $_; next PRI;
    }
    else{
	chomp;
	$_ =~ /^>(.*)F/;
	my $p_name = "$1F";
	print $OUT ">$p_name\n";
	$primaries{$p_name} = 1;
    }
}

close $IN;
close $OUT;

my $fileb = shift;
die $usage unless $fileb;
open (my $INB, '<', $fileb) or die "Can't open $fileb for reading\n$!\n";

my @fnameb = split /\./, $fileb;
pop @fnameb;
push @fnameb, "clean.fasta";
my $onameb = join ".", @fnameb;

open (my $OUTB, '>', $onameb) or die "Can't open $onameb for reading\n$!\n";

HAP: while (<$INB>) {
    if($_ !~ />/){
        print $OUTB $_ ; next HAP;
    }
    else{
        chomp;
	$_ =~ /^>(.*F_[0-9]+)/;
        my $h_name = "$1";
        print $OUTB ">$h_name\n";
        push @haplotigs, $h_name;
    }
}

foreach my $k (@haplotigs){
    my @sname = split /_/, $k;
    if(defined $primaries{$sname[0]}){
	print "$sname[0]\t$k\n";
}
}

#-----------------------------------------------------------------------------
#-------------------------------- SUBROUTINES --------------------------------
#-----------------------------------------------------------------------------

sub {

}

