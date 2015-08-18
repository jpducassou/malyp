#!/usr/bin/perl

# ==========================================================================
use strict;
use warnings;

# ==========================================================================
use Test::More; # tests => 6;

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
can_ok($parser, 'lexer');
can_ok($parser, 'set_input');

# ==========================================================================
my ($input, @output, $expected);

# ==========================================================================
$parser = Parse::MAL -> new();
$input    = 'ac := ac + 1;';
$expected = [
	['AC', '1'],
	['EQ', ':='],
	['AC', '1'],
	['PLUS', '+'],
	['ONE', '6'],
	['SEMICOLON', ';'],
	['', undef],
];

$parser -> set_input(\$input);

foreach my $expected_token (@$expected) {
	@output = $parser -> lexer();
	is_deeply(\@output, $expected_token, "'$input' lexical analysis. token: " . ($expected_token -> [0] || 'EOF'));
}

# ==========================================================================
$parser = Parse::MAL -> new();
$input    = 'ac := ac + 1; if n then goto 4;';
$expected = [
	['AC', '1'],
	['EQ', ':='],
	['AC', '1'],
	['PLUS', '+'],
	['ONE', '6'],
	['SEMICOLON', ';'],
	['JMPN', '4'],
	['SEMICOLON', ';'],
	['', undef],
];

$parser -> set_input(\$input);

foreach my $expected_token (@$expected) {
	@output = $parser -> lexer();
	is_deeply(\@output, $expected_token, "'$input' lexical analysis. token: " . ($expected_token -> [0] || 'EOF'));
}

# ==========================================================================
$parser = Parse::MAL -> new();
$input    = "0: mar := f; rd;\n1: rd;\n";
$expected = [
	['LINENUM', '0'],
	['MAR', 'mar'],
	['EQ', ':='],
	['F', '15'],
	['SEMICOLON', ';'],
	['RD', 'rd'],
	['SEMICOLON', ';'],
	['EOL', "\n"],
	['LINENUM', '1'],
	['RD', 'rd'],
	['SEMICOLON', ';'],
	['EOL', "\n"],
	['', undef],
];

$parser -> set_input(\$input);

foreach my $expected_token (@$expected) {
	@output = $parser -> lexer();
	is_deeply(\@output, $expected_token, "'0: mar := f; rd;\\n1: rd;\\n' lexical analysis. token: " . ($expected_token -> [0] || 'EOF'));
}

# ==========================================================================
done_testing();

# ==========================================================================

