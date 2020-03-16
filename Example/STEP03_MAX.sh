set -e
source ./profile
echo "Now Starting generate max coverage base of \"N\" site...\n"
cd ./step_3_fill/1.max
ln -s ../../step_2_mapping/NCBIsequence.vcf
cat NCBIsequence.vcf |grep -v '^#' |awk '{print $1,$2,$4,$5,$10}'|sed 's/\s\+/\n/g' >NCBI1.vcf 
#replace <*> to "N"
perl 01.replace.pl NCBI1.vcf >NCBI2.vcf
#find best N to fill. Note:There will be a lot of prompts in this step, don't worry, just the prompts that do not match the corresponding location. Just wait for it to finish.
perl 02.sort_select.pl NCBI2.vcf >NCBImaxread.txt
echo "The best base file have been generated...\nNext begin to obtain the \"N\" location file...\n"
cd ..


