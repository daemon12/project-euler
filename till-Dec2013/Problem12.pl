=head
The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28.
The first ten terms would be:	1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

Let us list the factors of the first seven triangle numbers:
     1: 1
     3: 1,3
     6: 1,2,3,6
    10: 1,2,5,10
    15: 1,3,5,15
    21: 1,3,7,21
    28: 1,2,4,7,14,28
We can see that 28 is the first triangle number to have over five divisors.
What is the value of the first triangle number to have over five hundred divisors?
=cut
use strict;
use warnings;

print "Started....\n";
my $start =1;
while(1){
	my $triangleNum = getTriangleNumber($start);
	my @factors = getFactors($triangleNum);
	print $triangleNum." = ".@factors."\n";
	if(scalar(@factors) > 500){
		last;
	}
	$start++;
}
print "The value of the first triangle number to have over five hundred divisors is ".$start."\n";
print "....completed!!!\n";

sub getTriangleNumber{
	my $which = $_[0];
	return $which*($which+1)/2;
}

sub getFactors{
	my $num = $_[0];
	my @factors = (1, $num);
	my $sqrt = sqrt($num);
	for(my $i =2; $i <= $sqrt; $i++){
		if($num % $i == 0){
			push(@factors, $i, $num/$i);
		}
	}
	return sort{$a<=>$b}@factors;
}