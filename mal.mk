
lib/Parse/MAL.pm: lib/Parse/MAL.yp
	yapp -m Parse::MAL -o lib/Parse/MAL.pm lib/Parse/MAL.yp

