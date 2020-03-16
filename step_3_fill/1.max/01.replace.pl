#!usr/bin/perl -w
use strict;

=head1  Name

        01.replace.pl
=head1 Description

        This program is mainly used to replace the <\*> to N, so we can regard <\*> as N for next solve step.
=head1 example

        perl 01.replace.pl in.txt


=head1 Information

        Author:         Lei Han           hanl12321@163.com
        Version:        1.0
        Data:           2020-3-10
        Update:         2020-3-10_v1      (First version)

=cut

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
my $p=$vcf[$i-3];
my $base1=$vcf[$i-2];
my $base2_4=$vcf[$i-1];
my @base2x=split/,/,$base2_4;
my $base2=$base2x[0];
my $base3=$base2x[1];
my $base4=$base2x[2];
my $cov=$vcf[$i];
my @PLDPAD=split/:/,$cov;
my $AD=$PLDPAD[2];
my @ADx=split/,/,$AD;
my $base1c=$ADx[0];
my $base2c=$ADx[1];
my $base3c=$ADx[2];
my $base4c=$ADx[3];


$base2_4 =~ s/<\*>/N/;
print "$scaff$p$base1$base2_4$cov";

}

