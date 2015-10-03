#!/usr/bin/perl -w
use strict; 
my $html = "http://fun.coolshell.cn/n/";
my $mother = $html . "2014"; 
my $son = ""; 
while (1) {
   $son = `curl -s $mother`; 
   chomp $son; 
   print $son . "\t"; 
   $mother = $html . $son; 
}

