#!/usr/bin/perl

# ==========================================================================
use strict;
use warnings;

# ==========================================================================
use File::Spec;

# ==========================================================================
use Test::Perl::Critic;
use Test::More tests => 1;

# ==========================================================================
my $rcfile = File::Spec -> catfile( 'xt', 'perlcriticrc' );
Test::Perl::Critic -> import( '-profile' => $rcfile );
critic_ok( 'lib/CPU/Mic1/Microassembler.pm', 'Perl-criticize module' );

