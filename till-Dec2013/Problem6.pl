=head
The sum of the squares of the first ten natural numbers is,
12 + 22 + ... + 102 = 385
The square of the sum of the first ten natural numbers is,
(1 + 2 + ... + 10)2 = 552 = 3025
Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640.
Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
=cut

use strict;
use warnings;

my $limit = 100;

my $diff1 = 0;
for(my $i=1; $i <= $limit; $i++){
	$diff1 += ($i*$i);
}
my $diff2 = ($limit*($limit+1)/2) ** 2;

my $answer =  $diff2 - $diff1;

print "The difference between the sum of the squares of the first one hundred natural numbers and the square of their sum is\n";
print $answer;

=head
(1 + 2 + ... + n)^2 = n^2 * (n+1)^2 * 1/4 
1^2 + 2^2 + ... + n^2 = n * (n+1) * (2n+1) * 1/6 
