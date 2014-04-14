=head
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
a2 + b2 = c2
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
=cut

use strict;
use warnings;

print "Started....\n";
my $sum = 1000;
my $sumABC=0;
my $a = 1, my $b, my $c;
my $found = 0;
while(1){
	print "a=$a\n";
	for($b=$a+1; $b <= $sum; $b++){ # 1000 limit does not matter as because of 'last' condition we'll never reach there.
		$c = sqrt($a**2 + $b**2);
		if(($c - int($c)) == 0){	#check if $cTemp is an integer
			$sumABC = $a + $b + $c;
			if($sumABC == $sum){
				$found = 1;
				last;
			}elsif($sumABC > $sum){
				last;
			}	
		}  
	}
	if($found == 1){
		print "Pythagorean triplet for which a + b + c = ".$sum." is (".$a.", ".$b.", ".$c.")\n";
		print "Product is ".($a*$b*$c)."\n";
		last;
	}
	$a++;
	if($a >= $sum){
		last;
	}
}
print "....completed!!!\n";

if($found == 0){
	print "No results found!!\n";
}