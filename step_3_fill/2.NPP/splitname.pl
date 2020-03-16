#!/usr/bin/perl -w
use strict;

=head1  Name

        splitname.pl
=head1 Description

        This program is mainly used to print all splite work into a total bash file.
=head1 example

        perl splitname.pl in.txt


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
my $splitname=$a[$i];
chomp($splitname);
  if($splitname=~ m/1.split_/){
print "perl ./01.findNpos.pl $splitname >Nfake_realpos_$i.txt\n";
}}
close IN;
