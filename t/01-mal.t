#!/usr/bin/perl

# ============================================================================
use strict;
use warnings;

# ============================================================================
use Test::More tests => 10;

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
done_testing();

