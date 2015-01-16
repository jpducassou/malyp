#!/usr/bin/perl

# ==========================================================================
use strict;
use warnings;

# ==========================================================================
use Test::More tests => 6;

# ==========================================================================
BEGIN { use_ok( 'Parse::MAL' ); }

# ==========================================================================
can_ok('Parse::MAL', 'new');

# ==========================================================================
my $parser = Parse::MAL -> new();

# ==========================================================================
isa_ok($parser, 'Parse::MAL');
isa_ok($parser, 'Parse::Yapp::Driver');

# ==========================================================================
can_ok($parser, 'process');
can_ok($parser, 'get_errors');

# ==========================================================================
done_testing();

# ==========================================================================

