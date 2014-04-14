use warnings;

@input = (1,2,3);

&permutation('',@input);

sub permutation(){
	my ($perm,@set) = @_;

	print "B1: perm=$perm\tset=@set\n";
	
	print "noUnless:$perm\n" || return unless (@set);

	print "B2: perm=$perm\tset=@set\n";
	
	foreach (0..$#set){
		print "calling it: <$perm$set[$_],       @set[0..$_-1],@set[$_+1..$#set]>\n";
		&permutation($perm.$set[$_],@set[0..$_-1],@set[$_+1..$#set]);
	}
	print "B3: perm=$perm\tset=@set\n";
}
