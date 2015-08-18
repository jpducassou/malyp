#!/usr/bin/perl

# ============================================================================
use strict;
use warnings;

# ============================================================================
use Test::More;
use CPU::Mic1::Microassembler;
use Data::Dumper;

# ============================================================================
my $directory = 't/data';

# ============================================================================
while (my $file_name = glob 't/data/*.in') {

	$file_name =~ s/\.in$//;
	my $output_buffer = '';

	open my $output_fh ,  '>', \$output_buffer  or die 'Cannot open output buffer';
	open my $expected_fh, '<', "$file_name.out" or die "Cannot open $file_name.out for reading";

	my $parser = CPU::Mic1::Microassembler -> new();
	$parser -> process("$file_name.in", $output_fh);

	open $output_fh ,  '<', \$output_buffer  or die 'Cannot open output buffer';
	my $i = 1;

	while (defined(my $expected = <$expected_fh>) and defined(my $output = <$output_fh>)) {
		chomp $expected;
		chomp $output;
		is($output, $expected, 'file: ' . $file_name . ' line: ' . $i++);
	}

	close $expected_fh;
	close $output_fh;

}

# ============================================================================
done_testing();

