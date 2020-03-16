#!usr/bin/perl -w
use strict;

=head1  Name

        01.findN2fill.pl
=head1 Description

        This program is mainly used to find and select the best N can fill the gap,then print all of them.
=head1 example

        perl 01.findN2fill.pl in1.txt in2.txt


=head1 Information

        Author:         Lei Han           hanl12321@163.com
        Version:        1.0
        Data:           2020-3-10
        Update:         2020-3-10_v1      (First version)

=cut

open IN,$ARGV[0];
open IN1,$ARGV[1];

my %hashmax;

#my %hash1;
#my %hash2;
#my %hash3;
while(my $max=<IN>){
chop($max); 
 my @a = split/\t/, $max;
$hashmax{$a[0]}=$a[1];
}

while (my $NPP=<IN1>){
chop($NPP);
my @b=split/\t/, $NPP;
#print "$b[0] $b[2]";
if(exists $hashmax{$b[0]}){
print "$b[2]\t$b[4]\t$hashmax{$b[0]}\n";

}}

close IN;
close IN1;
