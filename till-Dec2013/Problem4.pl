=head
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
Find the largest palindrome made from the product of two 3-digit numbers.
=cut

use strict;
use warnings;

my $max = 999;
#my $upperLimit = 999;
my $upperLimit = 990;
my $variableNum = 999;
my $counter = 0;
my $product = 0;
my $palindrome = 0;
my $num1 = 0;
my $num2 = 0;
my $cnt=0;

while(1){
	$cnt++;
	$product = $upperLimit * $variableNum;
	$counter = checkPalindrome($product);
	if($counter==1 && $product>$palindrome){
		$palindrome = $product;
		$num1 = $upperLimit;
		$num2 = $variableNum;
	}
			
	#For changing numbers
	if($variableNum <= $upperLimit){
#		$upperLimit--;
		$upperLimit-=11;
		$variableNum = $max;
		last if($counter==1);
		next;
	}
	$variableNum--;
}
print "LARGEST PALINDROME MADE FROM THE PRODUCT OF TWO 3-DIGIT NUMBERS = ".$num1." x ".$num2." = ".$palindrome."\n";
print "Found in ".$cnt." operations!\n";

sub checkPalindrome{
	my $num = $_[0];
	if(length($num) % 2 == 0){
		my $revNum = reverse($num);
		$num eq $revNum ? return 1 : return 0;
	}else{
		return 0;
	}
}