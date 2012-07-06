#/bin/sh
perl -I../lib ../bin/mal < data/$1.in | diff data/$1.out -

