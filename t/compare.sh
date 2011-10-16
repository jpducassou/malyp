#/bin/sh
perl ../cgi/malyp.pl < data/$1.in | diff data/$1.out -

