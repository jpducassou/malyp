# NAME

CPU::Mic1::Microassembler - Mic1 micro assembly language parser and compiler

# SYNOPSIS

        use CPU::Mic1::Microassembler;

        # Create parser object:
        my $parser = CPU::Mic1::Microassembler -> new();

        # Process stdin
        $parser -> process();

# DESCRIPTION

CPU::Mic1::Microassembler is an assembler that turns micro assembly language (MAL) into Mic-1 microinstructions.
This program was designed for the Mic1 Microprogramming Simulator found in:
http://cis.stvincent.edu/carlsond/cs330/mic1/mic1.html

The process() method is called to process assembler input. The first parameter indicates the input as one of: a filename, if defined; a reference to a text string containing assembler text; or a file handle reference (e.g. IO::Handle or sub-class) or GLOB (e.g. \\\*STDIN), from which the input can be read.
By default, the processed output is printed to STDOUT.

# SOURCE

[https://github.com/jpducassou/perl-cpu_mic1_microassembler](https://github.com/jpducassou/perl-cpu_mic1_microassembler)

# AUTHOR

Jean Pierre Ducassou

# LICENSE

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

# NO WARRANTY

This software is provided "as-is," without any express or implied warranty. In no event shall the author be held liable for any damages arising from the use of the software.

# SEE ALSO

[Parse::Yapp](https://metacpan.org/pod/Parse::Yapp)

