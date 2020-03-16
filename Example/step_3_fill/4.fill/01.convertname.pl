#!usr/bin/perl -w
use strict;

=head1  Name

        01.convertname.pl
=head1 Description

        This program is mainly used to convert the scaffold name to a standard format.
=head1 example

        perl 01.convertname.pl in.txt


=head1 Information

        Author:         Lei Han           hanl12321@163.com
        Version:        1.0
        Data:           2020-3-10
        Update:         2020-3-10_v1      (First version)

=cut

open IN,$ARGV[0];

my $name;
my $p;
my $base;
my $i;
my @a=<IN>;
my $name1;
my $name2;

for($i=0;$i<@a;$i=$i+3){
my $name = $a[$i];
chomp($name);
my $p = $a[$i+1];
chomp($p);
my $base = $a[$i+2];
chomp($base);
my $name1 = lc ($name);
chomp($name1);
my $name2 = ucfirst ($name1);
chomp($name2);
print "$name2\n$p\n$base\n";
}
