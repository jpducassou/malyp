#!/usr/bin/perl

# ==========================================================================
use strict;
use warnings;

# ==========================================================================
use Test::More tests => 7;

# ==========================================================================
BEGIN { use_ok( 'Parse::MAL' ); }

my $parser = Parse::MAL -> new();

isa_ok($parser, 'Parse::MAL');
isa_ok($parser, 'Parse::Yapp::Driver');

can_ok($parser, 'run');
can_ok($parser, 'get_errors');
can_ok($parser, '_lexer');
can_ok($parser, '_error');

