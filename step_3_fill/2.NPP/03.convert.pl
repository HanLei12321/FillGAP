#!usr/bin/perl -w
use strict;

=head1  Name

        03.convert.pl
=head1 Description

        This program is mainly used to removes the newline character for each line.
=head1 example

        perl 03.convert.pl in.txt


=head1 Information

        Author:         Lei Han           hanl12321@163.com
        Version:        1.0
        Data:           2020-3-10
        Update:         2020-3-10_v1      (First version)

=cut

open IN,$ARGV[0];

my $i;
my @NPP=<IN>;

for ($i=5;$i<@NPP;$i=$i+6){
chomp($NPP[$i]);
chomp($NPP[$i-1]);
chomp($NPP[$i-2]);
chomp($NPP[$i-3]);
chomp($NPP[$i-4]);
chomp($NPP[$i-5]);
print "$NPP[$i-5]:$NPP[$i-4]\t$NPP[$i-3]\t$NPP[$i-2]\t$NPP[$i-1]\t$NPP[$i]\n";
}

close IN;
