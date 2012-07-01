#/bin/sh
perl ../bin/malyp.pl < data/$1.in | diff data/$1.out -
