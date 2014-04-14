=head
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
What is the 10001st prime number?
=cut
print "Started....\n";
use strict;
use warnings;
my $thousandthPrime = "";
my @f1000 = ();
#########################
my $whichPrime = 10001;##
#########################
my %first1000Primes = getFirst1000Primes();

if($whichPrime <= 1000){
	print "The ".$whichPrime."th prime number is ".$f1000[$whichPrime-1]."\n";
}else{
	my $numPrimesFound = 1000;
	my $newStart = $f1000[1000-1]+2;
	while(1){
		if(isPrime($newStart)){
			$numPrimesFound++;
			print "$numPrimesFound\n";
		}
		if($whichPrime == $numPrimesFound){
			print "The ".$whichPrime."th prime number is ".$newStart."\n";
			last;
		}
		$newStart += 2;
	}
}

print "....completed!!!\n";

sub isPrime{
	my $input = $_[0];
    my $i;
    if( defined($first1000Primes{$input}) ){		# First check: is the input number in the first 1000 primes?
    	return 1;    	
    }
	my @first1000Primes = sort{$a <=> $b}keys(%first1000Primes);
    foreach my $i(@first1000Primes) {				# Second check: is the number divisible by any of the first 1000 primes?
		if( $input % $i == 0){
			return 0;
		}
	    my $sqrt = $input ** 0.5;					# Final check: we fall back to earlier strategy
	    for( my $i = $thousandthPrime+2; $i < $sqrt; $i+=2) {
	        if( $input % $i == 0){
	            return 0;        	
	        }
	    }
    }
    return 1;
}

sub getFirst1000Primes{
	my %hash = ();
	my $line = "";
	my $cnt = 0;
	open FH, "<first_1000_primes.txt" || die $!;
	while($line=<FH>){
		chomp($line);
		$hash{$line}=1;
		$f1000[$cnt++]=$line;
		$thousandthPrime = $line;
	}
	close FH;
	if(@f1000 != 1000){print "Err: read less than 1000 values from file!!\n";}
	return %hash;
}