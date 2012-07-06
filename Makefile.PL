#!/usr/bin/perl

# ============================================================================
use strict;
use warnings;

# ============================================================================
use ExtUtils::MakeMaker;

# ============================================================================
# my $YAPP_COMMAND = 'yapp -o lib/Parse/MAL.pm -m Parse::MAL lib/Parse/MAL.yp';

# ============================================================================
WriteMakefile(
	NAME          => 'Parse::MAL',
	VERSION_FROM  => 'lib/Parse/MAL.yp',
	PREREQ_PM     => { 'Parse::Yapp' => 0 },
	EXE_FILES     => [ 'bin/mal' ],
	AUTHOR        => 'Jean Pierre Ducassou <jpducassou@gmail.com>',
);

# ============================================================================
__END__
