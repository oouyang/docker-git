#! /usr/bin/perl

print "$ARGV[0]:GitAccess:";
open(MD5, "|md5sum | cut -b -32") or die;
print MD5 "$ARGV[0]:GitAccess:$ARGV[1]";
close(MD5);
