#!usr/bin/perl -w
use strict;

=head1  Name

        02.fill.pl
=head1 Description

        This program is final step of whole pepiline,it fill the gap use best coverage base (N2fill.txt) and assemble scaffold.fasta file to run,finally,it will generate a fill.fa, it is what we want, good luck.
=head1 example

        perl 01.convertname.pl N2fill.txt scaffold.fa


=head1 Information

        Author:         Lei Han           hanl12321@163.com
        Version:        1.0
        Data:           2020-3-10
        Update:         2020-3-10_v1      (First version)

=cut

open IN1,$ARGV[0];
open IN2,$ARGV[1];

my @a=<IN1>;
my @b=<IN2>;
my $i;
my $n;

for($i=0;$i<@a-2;$i=$i+3){
 my $name1 = $a[$i];
 my $pos = $a[$i+1]-1;
my $basefill = $a[$i+2];
 chomp($basefill);
for($n=0;$n<@b-1;$n=$n+2){ 
 my $name2 = $b[$n];
if($name1 =~ $name2) {
my $pos2=index($b[$n+1],"N",$pos);
if($pos2 == $pos){
substr($b[$n+1],$pos,1,$basefill);
}}}}
print @b;

