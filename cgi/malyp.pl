#!/usr/bin/perl
package main;

# ==============================================================================
use strict;
use warnings;

use Data::Dumper;

# ==============================================================================
use lib '../lib';
use MAL;

# ==============================================================================
sub run {

	my $tags;
	my @lines;

	my $parser = MAL -> new();

	# ==========================================================================

	my $i = 0;
	while (<>) {
		chomp;
		goto PARSER if $_ eq 'quit';

		# Remove line numbers:
		s/^\s*\d+\s*:\s*//;

		# Remove comments:
		s/[\{]\s*(.*?)[\}]\s*//;
		s/\#\s*(.*)$//i;

		# Remove \s
		s/^\s*//;

		# Skip empty lines
		next() if (length($_) == 0);

		# Extract tags:
		$tags -> {$1} = $i if (s/^\s*[\<]\s*(\w+)\s*[\>]\s*:\s*//);

		# Add line:
		push @lines, $_;

		# Increment line number:
		$i++;

	}

PARSER:

	$parser -> set_tags($tags);

	$i = 1;
	foreach my $line (@lines) {

		my $sent = $parser -> run($line);
		next() unless $sent;

		# Errores
		my $errores_parser = $parser -> get_errors();

		if (@$errores_parser) {
			print "Error en la linea $i: ";
			foreach my $msg (@$errores_parser) {
					print($msg, "\t");
			}
			print "\n";
		}

		my $strbin = sprintf "%032b", $sent;
		my $strpp = '';

		$strpp .= substr( $strbin, 0,  1 ) . ' '; # AMUX
		$strpp .= substr( $strbin, 1,  2 ) . ' '; # COND
		$strpp .= substr( $strbin, 3,  2 ) . ' '; # ALU
		$strpp .= substr( $strbin, 5,  2 ) . ' '; # SH
		$strpp .= substr( $strbin, 7,  1 ) . ' '; # MBR
		$strpp .= substr( $strbin, 8,  1 ) . ' '; # MAR
		$strpp .= substr( $strbin, 9,  1 ) . ' '; # RD
		$strpp .= substr( $strbin, 10, 1 ) . ' '; # WR
		$strpp .= substr( $strbin, 11, 1 ) . ' '; # ENC
		$strpp .= substr( $strbin, 12, 4 ) . ' '; # C
		$strpp .= substr( $strbin, 16, 4 ) . ' '; # B
		$strpp .= substr( $strbin, 20, 4 ) . ' '; # A
		$strpp .= substr( $strbin, 24, 8 ) . ' '; # ADDR
		$strpp =~ s/(\d)/$1 /g;
		$strpp =~ s/\s*$//;

		print "$strpp\n";

		$i++;

	}
}

run(@ARGV) unless caller();
