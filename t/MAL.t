#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 3;

use lib '../lib';

use_ok( 'MAL' );

my $parser = MAL -> new();
isa_ok($parser, 'MAL');
isa_ok($parser, 'Parse::Yapp::Driver');
