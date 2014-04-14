=head
The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?
=cut
use strict;
use warnings;

my $num=600851475143;
my @primeFactors = ();
my $divider=2;

while(1){
	if($num % $divider == 0){
		push(@primeFactors, $divider);
		$num = $num / $divider ;
	}else{
		$divider++;
	}
	last if($divider > $num)
}
print "@primeFactors\n";
print $primeFactors[-1]."\n";