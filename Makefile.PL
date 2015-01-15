#!/usr/bin/perl

# ============================================================================
use strict;
use warnings;

# ============================================================================
use ExtUtils::MakeMaker;

# ============================================================================
WriteMakefile(
	'NAME'           => 'Parse::MAL',
	'VERSION_FROM'   => 'lib/Parse/MAL.yp',
	'ABSTRACT_FROM'  => 'lib/Parse/MAL.yp',
	'AUTHOR'         => 'Jean Pierre Ducassou <jpducassou@gmail.com>',
	'LICENSE'        => 'perl',
	'BUILD_REQUIRES' => { 'Parse::Yapp' => 0 },
	'PREREQ_PM'      => { 'Parse::Yapp' => 0 },
	'PL_FILES'       => { 'yp_to_pm.PL' => 'lib/Parse/MAL.pm' },
	'PM'             => { 'lib/Parse/MAL.pm' => '$(INST_LIBDIR)/Parse/MAL.pm' },
	'EXE_FILES'      => [ 'bin/mal' ],
);

# ============================================================================
__END__

