#!/usr/bin/perl -w
use strict;

=head1  Name

        splitname_2.pl
=head1 Description

        This program is mainly used to generate a merge work file to run of all splite tmp file.
=head1 example

        perl splitname_2.pl in.txt


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
print "perl ./20.convert.pl $splitname >data2_2_$i.txt\n";
}}
close IN;
