#!/usr/bin/perl -w
#
# S. Jester 2/17/04
# chTitle.pl
# Purpose: Change the content of <title> tags in DRx web sites to DRx+1 - see PR 5787
#
#
# Steps: read a file into an array
#        apply the regexp 
#        s%<title>(.*)( - )?SDSS DR1( - )?(.*)</title>%<title>${1}${4}${2}${3}SDSS DR2</title>%
#        to the entire array
#        write array back to original file
#
# Usage: chTitle.pl filename [oldrelease newrelase]
#
# if oldrelease is not specified, defaults to DR3 and newrelease defaults to DR4
# else must specify both

$infile=$ARGV[0];
if ($#ARGV > 0) {
    $oldrel = $ARGV[1];
    if ($#ARGV > 1) {
	$newrel = $ARGV[2];
    } else {
	die("Must specify both oldrelease and newrelease or neither\n");
    }
} else {
    $oldrel = "DR3";
    $newrel = "DR4";
}
open(IN,"$infile") or die("Could not open $infile for reading\n");
@lines = <IN>;
close(IN);

grep(s%<title>(.*)( - )?SDSS $oldrel( - )?(.*)</title>%<title>${1}${4}${2}${3}SDSS $newrel</title>%,@lines);

open(OUT,">$infile") or die("Could not open $infile for writing\n");
print OUT @lines;
close(OUT);
