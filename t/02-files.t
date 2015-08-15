#!/usr/bin/perl

# ============================================================================
use strict;
use warnings;

# ============================================================================
use Test::More;
use Parse::MAL;
use Data::Dumper;

# ============================================================================
my $directory = 't/data';

# ============================================================================
my $parser = Parse::MAL -> new();
my $file_name;

while($file_name = glob 't/data/*.in') {

	$file_name =~ s/\.in$//;
	diag "Testing $file_name ...";

	my $output_buffer = '';

	open my $output_fh ,  '+<', \$output_buffer  or die 'Cannot open output buffer';
	open my $expected_fh, '<',  "$file_name.out" or die "Cannot open $file_name.out for reading";

	$parser -> process("$file_name.in", $output_fh);
	diag Dumper($parser -> get_errors()) if $parser -> get_errors();
	my $i = 1;

	while (my $expected = <$expected_fh>) {
		# my $output = <$output_fh>;
		chomp $expected;
		chomp $output_buffer;
		next unless $expected;
		is($output_buffer, $expected, 'file: ' . $file_name . ' line: ' . $i++);
	}
	close $expected_fh;
	close $output_fh;

}

# ============================================================================
done_testing();

