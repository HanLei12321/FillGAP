#!usr/bin/perl -w
use strict;

=head1  Name

        02.sort_select.pl
=head1 Description

        This program is mainly used to find the max coverage base in specific location,then print them.
=head1 example

        perl 02.sort_select.pl in.txt


=head1 Information

        Author:         Lei Han           hanl12321@163.com
        Version:        1.0
        Data:           2020-3-10
        Update:         2020-3-10_v1      (First version)

=cut

use List::Util qw/max/;

open IN,$ARGV[0];

my $i;
my @vcf=<IN>;
my $scaff;
my $p;
my $base1;
my $base2_4;
my $base2;
my $base3;
my $base4;
my $cov;
my $PL;
my $DP;
my $AD;
my $base1c;
my $base2c;
my $base3c;
my $base4c;
my $ADmax;

for($i=4;$i<@vcf;$i=$i+5){
my $scaff=$vcf[$i-4];
chomp($scaff);
my $p=$vcf[$i-3];
chomp($p);
my $base1=$vcf[$i-2];
chomp($base1);
my $base2_4=$vcf[$i-1];
chomp($base2_4);
my @base2x=split/,/,$base2_4;
my $base2=$base2x[0];
chomp($base2);
my $base3=$base2x[1];
chomp($base3);
my $base4=$base2x[2];
chomp($base4);
my $cov=$vcf[$i];
chomp($cov);
my @PLDPAD=split/:/,$cov;
my $AD=$PLDPAD[2];
my @ADx=split/,/,$AD;
my $base1c=$ADx[0];
my $base2c=$ADx[1];
my $base3c=$ADx[2];
my $base4c=$ADx[3];

my @array=($base1c,$base2c,$base3c,$base4c);
my $max = max @array;

if(($max=$base1c)and($max != 0)){
print "$scaff:$p $base1\n";
next;
}
if(($max=$base2c)and($max != 0)){
print "$scaff:$p $base2\n";
next;
}
if(($max=$base3c)and($max != 0)){
print "$scaff:$p $base3\n";
next;
}
if(($max=$base4c)and($max != 0)){
print "$scaff:$p $base4\n";
next;
}
if($max == 0){
next;
}
}
