use strict;
use warnings;

my @permutations = ();
my @in=(1,2,3);
&permute("", @in);
print join("\n", @permutations);

sub permute{
	my ($perm, @set) = @_;
	if(@set == 0){
		push(@permutations, $perm);
		return 0;
	}
	foreach(0..$#set){
		&permute($perm.$set[$_], @set[0..$_-1],@set[$_+1..$#set]);
	}
}