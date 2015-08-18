#!/usr/bin/env perl

# ============================================================================
use strict;
use warnings;

# ============================================================================
use Parse::Yapp;

# ============================================================================
my $filename = 'lib/CPU/Mic1/Microassembler.yp';
my $outfile  = 'lib/CPU/Mic1/Microassembler.pm';
my $package  = 'CPU::Mic1::Microassembler';

my $parser = new Parse::Yapp(inputfile => $filename);

my $warnings = $parser -> Warnings();
$warnings and print STDERR $warnings;

open(OUT, '>', $outfile) or die "Cannot open $outfile for writing.\n";

print OUT $parser -> Output(
	classname    => $package,
	template     => undef,
	standalone   => 0,
	linenumbers  => 0,
);

close(OUT);

# ============================================================================

