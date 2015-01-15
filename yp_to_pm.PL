#!/usr/bin/perl

# ============================================================================
use strict;
use warnings;

# ============================================================================
use Parse::Yapp;

# ============================================================================
my $filename = 'lib/Parse/MAL.yp';
my $outfile  = 'lib/Parse/MAL.pm';
my $package  = 'Parse::MAL';

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

