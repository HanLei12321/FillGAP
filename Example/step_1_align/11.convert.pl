#!usr/bin/perl -w
use strict;

=head1  Name

        11.convert.pl
=head1 Description

        This program is mainly used to convert the formate of the input file.
=head1 example

        perl 11.convert.pl in.txt

=head1 Information

        Author:         Lei Han           hanl12321@163.com
        Version:        1.0
        Data:           2020-3-10
        Update:         2020-3-10_v1      (First version)

=cut

open IN,$ARGV[0];
my $i;
my @a=<IN>;
my $b;
my $scaffNCBI;
my $scaffoldBS;
my $start1;
my $end1;
my $ATCG1;
my $start2;
my $end2;
my $ATCG2;

     for ($b=11;$b<@a;$b=$b+12){
 my $scaffNCBI=$a[$b-11];
          chomp($scaffNCBI);
          my $start1=$a[$b-10];
          chomp($start1);
          my $end1=$a[$b-10]+$a[$b-9];
          chomp($end1);
          my $scaffoldBS=$a[$b-5];
          chomp($scaffoldBS);
          my $start2=$a[$b-4];
          chomp($start2);
          my $end2=$a[$b-4]+$a[$b-3];
           chomp($end2);
          my $ATCG1=$a[$b-6];
          chomp($ATCG1);
          my $ATCG2=$a[$b];
           chomp($ATCG2);
             
print  ">$scaffNCBI $start1 $end1 $scaffoldBS $start2 $end2\n$ATCG1\n";
                        }
                        

