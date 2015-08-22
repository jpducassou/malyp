#!/usr/bin/env perl

# ============================================================================
use strict;
use warnings;

# ============================================================================
use ExtUtils::MakeMaker;

# ============================================================================
WriteMakefile(
	'NAME'           => 'CPU::Mic1::Microassembler',
	'VERSION_FROM'   => 'lib/CPU/Mic1/Microassembler.yp',
	'ABSTRACT_FROM'  => 'lib/CPU/Mic1/Microassembler.yp',
	'AUTHOR'         => 'Jean Pierre Ducassou',
	'LICENSE'        => 'perl',
	'BUILD_REQUIRES' => { 'Parse::Yapp' => 0, 'Test::More' => 0 },
	'PREREQ_PM'      => { 'Parse::Yapp' => 0 },
	'PL_FILES'       => { 'yp_to_pm.PL' => 'lib/CPU/Mic1/Microassembler.pm' },
	'PM'             => { 'lib/CPU/Mic1/Microassembler.pm' => '$(INST_LIBDIR)/CPU/Mic1/Microassembler.pm' },
	'EXE_FILES'      => [ 'bin/asm' ],
);

# ============================================================================
__END__

