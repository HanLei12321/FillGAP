#!/usr/bin/perl -w
use strict;

=head1  Name

        01.findNpos.pl
=head1 Description

        This program is mainly used to find real N location here,it ignores the impact of gap.
=head1 example

        perl 01.findNpos.pl in.txt


=head1 Information

        Author:         Lei Han           hanl12321@163.com
        Version:        1.0
        Data:           2020-3-10
        Update:         2020-3-10_v1      (First version)

=cut

open IN,$ARGV[0];

my @seq=<IN>;
my $i;
my $e;
my $j;

for($e=7;$e<@seq;$e=$e+8){
my $NCBIname=$seq[$e-7];
chomp($NCBIname);
my $s1=$seq[$e-6];
chomp($s1);
my $BSname=$seq[$e-4];
chomp($BSname);
my $s2=$seq[$e-3];
chomp($s2);
my $atcg1=$seq[$e-1];
chomp($atcg1);
my $atcg2=$seq[$e];
chomp($atcg2);
my @a=split//,$atcg1;
my @b=split//,$atcg2;
my $count1=0;
my $count2=0;
for($i=0;$i<@b;$i++){
   if($b[$i] =~ m/-/){
    $count1++;
    #print "$count1 ";
}
   if($b[$i] =~ m/N/){
    my $realp1=$i-$count1+$s2;
      for($j=0;$j<@a;$j++){
        if($a[$j]=~ m/-/){
         $count2++;
 #       print "$count2 "; 
}
        if($j==$i){
        my $realp2=$j-$count2+$s1;
         print "$NCBIname\n$j\n$realp2\n$BSname\n$i\n$realp1\n";
          $count2=0;
}                   
}}}}
