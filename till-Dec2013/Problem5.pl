=head
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
=cut
$,=" - ";
$\="\n";
use strict;
use warnings;
my $tillNow = 2;
my ($n1, $n2);
for(my $i=3; $i <= 20; $i++){
	$n1 = $tillNow;
	$n2 = $i;
	$tillNow = getGCD($n1, $n2);
	print "Calculating for $n1 & $n2 --> $tillNow";
}


sub getGCD{
	my($num1, $num2) = @_;
	my $gcd=1;
	my %pf1 = getPrimeFactors($num1);
	my %pf2 = getPrimeFactors($num2);
	my %commonFactors = ();
	map{ $commonFactors{$_}=0 } keys(%pf1);
	map{ $commonFactors{$_}=0 } keys(%pf2);
	my @commonFactors = keys(%commonFactors);
	foreach my $factor(@commonFactors){
		if(defined($pf1{$factor}) && defined($pf2{$factor})){
			my $cntOfFacInNum1 = @{$pf1{$factor}};
			my $cntOfFacInNum2 = @{$pf2{$factor}};
			if( $cntOfFacInNum1 > $cntOfFacInNum2 ){
				$gcd *= $factor ** $cntOfFacInNum1 ;
			}else{
				$gcd *= $factor ** $cntOfFacInNum2 ;
			}
		}elsif(defined($pf1{$factor})){
			my $cntOfFacInNum1 = @{$pf1{$factor}};
			$gcd *= $factor ** $cntOfFacInNum1;
		}elsif(defined($pf2{$factor})){
			my $cntOfFacInNum2 = @{$pf2{$factor}};
			$gcd *= $factor ** $cntOfFacInNum2;
		}
	}
	return $gcd;
}

sub getPrimeFactors{
	my $num = shift(@_);
	my %hash=();

	my $divider=2;
	while(1){
		if($num % $divider == 0){
			push(@{$hash{$divider}}, 1);
			$num = $num / $divider ;
		}else{
			$divider++;
		}
		last if($divider > $num)
	}
	return %hash;
}

=head solution1
This does not require programming at all. Compute the prime factorization of each number from 1 to 20, and 
multiply the greatest power of each prime together: 
20 = 2^2 * 5 19 = 19 18 = 2 * 3^2 17 = 17 16 = 2^4 15 = 3 * 5 14 = 2 * 7 13 = 13 11 = 11 
All others are included in the previous numbers. ANSWER: 2^4 * 3^2 * 5 * 7 * 11 * 13 * 17 * 19 = 232 792 560
