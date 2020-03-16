set -e 
echo "check profile ... "
source ./profile
export PATH=$lastz:$PATH
cd ./step_1_align
lastz $REF_GENOME[multiple] $GENOME --format=maf --output=./align.maf  || exit 1
echo "Lastz align have been finished...Now begin to convert the format of align file..."

cat align.maf | egrep -v '^#|^$|^a score'|awk '{print $2,$3,$3+$4,$NF}' >data0_0.txt || exit 2
cat data0.txt | grep -v '^$' >data0.txt || exit 2
perl 01.remove.pl data0.txt >data1.txt || exit 2
echo "formate have been converted. Now generating .FASTA formate of ref. sequence for BWA ......"

split -l 18445878 ./data1.txt -d -a 1 1.split_ ||exit 1
#find seqences which bs have 'N',this step will generate a bsmapNpso.txt file,it is all 'N' positions of BS...
bash splitname.sh >splitname.txt && perl splitname_1.pl splitname.txt >runsplit_1.sh && bash runsplit_1.sh ||exit 2
cat  data2_1_*.txt >NCBI_BS_sequence.fa

#find sequences which bs have 'N',then output .FASTA only include NCBI sequence for BWA....
bash splitname.sh >splitname.txt && perl splitname_0.pl splitname.txt >runsplit_0.sh && bash runsplit_0.sh ||exit 2
cat data2_0_*.txt >data2_0.txt
cat data2_0.txt | sed 's/-//g' >NCBIsequence.txt

#find sequences which bs have 'N',then output .FASTA only include BS sequence 
bash splitname.sh >splitname.txt && perl splitname_2.pl splitname.txt >runsplit_2.sh && bash runsplit_2.sh ||exit 2
cat data2_2_*.txt >data2_2.txt
cat data2_2.txt | sed 's/-//g' >BSsequence.txt
echo "finished generate NCBIseqence.fa.Now begining to bwa mapping..."
cd ..


