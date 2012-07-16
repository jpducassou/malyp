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
	NAME         => 'Parse::MAL',
	VERSION_FROM => 'lib/Parse/MAL.yp',
	PREREQ_PM    => { 'Parse::Yapp' => 0 },
	EXE_FILES    => [ 'bin/mal' ],
	LICENSE      => 'perl',
	AUTHOR       => 'Jean Pierre Ducassou <jpducassou@gmail.com>',
 	PM           => { 'lib/Parse/MAL.pm' => '$(INST_LIBDIR)/MAL.pm' }
);

# ============================================================================
sub MY::postamble {
    my $postamble = <<'END';

include mal.mk

END
    $postamble;
}

__END__
