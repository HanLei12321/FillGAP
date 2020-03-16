set -e
#step_2,bWA mapping...
source ./profile
export PATH=$BWA_PATH:$PATH
export PATH=$Samtools_PATH:$PATH
echo "step_2,Starting BWA mapping..."
cd ./step_2_mapping
ln -s ../step_1_align/NCBIsequence.txt 
bash ./map1.sh
$Samtools_PATH/samtools sort -@ 3 -o NCBIsequence_sort.bam ./NCBIsequence.bam
$Samtools_PATH/samtools mpileup -vu -t DP,AD -o NCBIsequence.vcf NCBIsequence_sort.bam --reference $REF_GENOME 
cd ..
echo "BWA mapping have been finished. Now perparing maxbase.txt..."












