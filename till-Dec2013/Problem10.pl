=head
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million.
=cut
print "Started....\n";
use strict;
use warnings;

my $numPrimesFound = 0;
my $sum = 2;
my $newStart = 3;
while(1){
	if(isPrime($newStart)){
		$sum += $newStart;
		print $newStart."\n";
	}
	$newStart += 2;
	if($newStart > 2000000){
		print "The sum of all the prime numbers below 2M is ".$sum."\n";
		last;
	}
}
print "....completed!!!\n";

sub isPrime{
	my $input = $_[0];
    my $sqrt = $input ** 0.5;
    for( my $i = 3; $i <= $sqrt; $i+=2) {
        if( $input % $i == 0){
            return 0;        	
        }
    }
    return 1;
}
