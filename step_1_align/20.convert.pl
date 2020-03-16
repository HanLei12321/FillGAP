#!usr/bin/perl -w
use strict;

=head1  Name

        20.convert.pl
=head1 Description

        This program is mainly used to find all scaffolds containing N and print them.
=head1 example

        perl 20.convert.pl in.txt

=head1 Information

        Author:         Lei Han           hanl12321@163.com
        Version:        1.0
        Data:           2020-3-10
        Update:         2020-3-10_v1      (First version)

=cut


open IN,$ARGV[0];

my $i;
my $data2=<IN>;
$data2=~ s/s+/ /;
my @a=split/\s+/,$data2;

   for ($b=7;$b<@a;$b=$b+8){
       my $scaffNCBI=$a[$b-7];
          chomp($scaffNCBI);
          my $start1=$a[$b-6];
          chomp($start1);
          my $end1=$a[$b-5];
          chomp($end1);
          my $scaffoldBS=$a[$b-3];
          chomp($scaffoldBS);
          my $start2=$a[$b-2];
          chomp($start2);
          my $end2=$a[$b-1];
           chomp($end2);
          my $ATCG1=$a[$b-4];
          chomp($ATCG1);
          my $ATCG2=$a[$b];
           chomp($ATCG2);

       if($ATCG2 =~ m/N/){
             print ">$scaffNCBI $start1 $end1 $scaffoldBS $start2 $end2\n$ATCG2\n";
                        }
                        }
close IN;
