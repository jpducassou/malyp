#!/usr/bin/perl

# ============================================================================
use strict;
use warnings;

# ============================================================================
use Test::More;
use Parse::MAL;
use IO::String;
use IO::Scalar;

# ============================================================================
my $directory = 't/data';

# ============================================================================
#my $dir_handle;
#opendir $dir_handle, $directory || die "can't opendir $directory: $!";
#my @files = grep { /\.in$/ && -f "$directory/$_" } readdir($dir_handle);
#closedir $dir_handle;

# ============================================================================
my $parser = Parse::MAL -> new();
my $file_name;
while($file_name = glob 't/data/*.in') {
	$file_name =~ s/\.in$//;
	diag "Testing $file_name ...";
	# my $output_fh = IO::Scalar -> new;
	my $output_buffer = '';
	# my $output_fh = IO::String -> new($output_buffer);

	open my $output_fh ,  '+<', \$output_buffer  or die 'Cannot open output buffer';
	open my $expected_fh, '<',  "$file_name.out" or die "Cannot open $file_name.out for reading";

	$parser -> process("$file_name.in", $output_fh);

	while (my $expected = <$expected_fh>) {
		# my $output = <$output_fh>;
		is($output_buffer, $expected);
	}
	close $expected_fh;
	close $output_fh;

}

# ============================================================================
done_testing();

