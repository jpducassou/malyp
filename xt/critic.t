#!/usr/bin/perl

# ==========================================================================
use strict;
use warnings;

# ==========================================================================
use Test::Perl::Critic;
use Test::More tests => 1;

# ==========================================================================
critic_ok( 'lib/CPU/Mic1/Microassembler.pm', 'Perl-criticize module' );

