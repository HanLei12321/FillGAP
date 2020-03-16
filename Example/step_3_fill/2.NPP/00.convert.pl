#!/usr/bin/perl -w
use strict;

=head1  Name

        00.convert.pl
=head1 Description

        This program is mainly used to remove the > before the scaffold name,it helps to compare the name and print scaffold of next step.
=head1 example

        perl 00.convert.pl in.txt


=head1 Information

        Author:         Lei Han           hanl12321@163.com
        Version:        1.0
        Data:           2020-3-10
        Update:         2020-3-10_v1      (First version)

=cut

open IN,$ARGV[0];

my $i;
my @a=<IN>;

for($i=0;$i<@a;$i++){
$a[$i]=~ s/>//g;
chomp($a[$i]);
print "$a[$i]\n";
}


