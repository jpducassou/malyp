#!/usr/bin/env perl

# ============================================================================
use 5.010001;

# ============================================================================
use strict;
use warnings;

# ============================================================================
use ExtUtils::MakeMaker;

# ============================================================================
WriteMakefile(
	'NAME'               => 'CPU::Mic1::Microassembler',
	'VERSION_FROM'       => 'lib/CPU/Mic1/Microassembler.yp',
	'ABSTRACT_FROM'      => 'lib/CPU/Mic1/Microassembler.yp',
	'AUTHOR'             => 'Jean Pierre Ducassou <jpducassou@gmail.com>',
	'LICENSE'            => 'perl_5',
	'MIN_PERL_VERSION'   => 'v5.10.1',
	'CONFIGURE_REQUIRES' => { 'ExtUtils::MakeMaker' => 0 },
	'BUILD_REQUIRES'     => { 'Parse::Yapp' => 0, 'Test::More' => 0 },
	'PREREQ_PM'          => { 'Parse::Yapp' => 0 },
	'PL_FILES'           => { 'lib/CPU/Mic1/Microassembler.pm.pl' => 'lib/CPU/Mic1/Microassembler.pm' },
	'PM'                 => { 'lib/CPU/Mic1/Microassembler.pm'    => '$(INST_LIBDIR)/Microassembler.pm' },
	'EXE_FILES'          => [ 'script/mic1-masm' ],
	'META_MERGE'         => {
		'meta-spec' => { version => 2 },
		'resources' => {
			'repository' => {
				'type'  => 'git',
				'url'   => 'https://github.com/jpducassou/perl-cpu_mic1_microassembler.git',
				'web'   => 'https://github.com/jpducassou/perl-cpu_mic1_microassembler',
			},
		},
	},
	'dist'               => { 'COMPRESS' => 'gzip -9f', 'SUFFIX' => 'gz' },
	'clean'              => { 'FILES'    => ['CPU-Mic1-Microassembler-*.tar.gz', 'lib/CPU/Mic1/Microassembler.pm' ] },
);

# ============================================================================
__END__

