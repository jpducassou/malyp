#!/usr/bin/perl
# ============================================================================
use strict;
use warnings;

# ============================================================================
use Test::More tests => 11;
use Test::Output;
use lib '../cgi';

# ============================================================================
BEGIN { require_ok('malyp.pl') }

# can_ok();

# ============================================================================
my $directory = 'data';
my $dh;
opendir($dh, $directory) || die "can't opendir $directory: $!";
my @files = grep { /\.in$/ && -f "$directory/$_" } readdir($dh);
closedir $dh;

# ============================================================================
foreach my $file_id (@files) {
	$file_id =~ s/\.in$//;
	system('sh', 'compare.sh', $file_id);
	is($? >> 8, 0, 'Diff exited with 0 for compare ' . $file_id);
}

# ============================================================================
# THE END
done_testing();
