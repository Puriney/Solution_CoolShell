#!/usr/bin/perl  -w 
use strict; 
use POSIX; 
use Scalar::Util qw(looks_like_number); 
my $source = "source.txt"; 
my $string = ""; 
open IN, $source; 
while (<IN>) {
	chomp; 
	my $info = $_; 
	$string .= $info; 
	my $out = &findCat($info); 
	print $out; 
}

# print &findCat("X3c3X"); 
# print &findCat($string); 
# print &findCat("S0nOe"); 

sub findCat {
	my $string = $_[0]; 
	my @string = split //, $string; 
	my $report = ""; 
	for (my $i = 0; $i < @string; $i++) {
		my $j = $i + 4; 
		my @word = @string[$i..$j]; 
		my $word = join("", @word); 
		# print $word . "\n"; 
		my $palindrome_tag = &palindrome(@word); 
		if ($palindrome_tag == 1){
			my $pass = &criteria(@word); 
			if ($pass == 1){
				$report .= $word[2]; 
				# print $word . "\n"; 
			}
		}
	}
	return($report)
}
sub palindrome {
	my @array = @_; 
	my $n = @array;
	# my $n = 5; 
	# my $m = 2;  
	my $m = floor($n / 2); ## 2
	my $tag1 = 0;
	for (my $i = 0; $i < $m; $i++) {
		my $j = -($i + 1); 
		if ($array[$i] eq $array[$j]){
			$tag1 ++; 
		}
	}
	if($m == $tag1 ){
		return(1); 
	}
	else {
		return(0); 
	}
}
# S0nOe
# print &palindrome(("1", 0, "n", "O", "1")) . "\n"; 

sub criteria {
	my @array = @_; 
	## 5-letter word
	my $x = $array[0]; 
	my $y = $array[1]; 
	my $z = $array[2]; 

	##
	## Criteria One
	##
	## 1-st letter: Upper case
	## 2-nd letter: Number
	## 3-rd letter: Lower case
	my $out = 0; 
	if ($x =~ m/[A-Z]/){
		if ($y =~ m/[0-9]/){
			if ($z =~ m/[a-z]/) {
				$out = 1; 
			}
		}
	}
	##
	## Criteria Two
	##
	## 1-st: Number
	## 2-nd: Upper Case
	## 3-rd: Lower Case
	if ($x =~ m/[0-9]/){
		if ($y =~ m/[A-Z]/){
			if ($z =~ m/[a-z]/){
				$out = 1; 
			}
		}

	}
	return($out); 
}
# print &criteria(("Z", 8, "Y", 8, "Z")); 
# print &criteria((5, "6", "a", "6", 5)); 
