source ../profile
$BWA_PATH/bwa index NCBIsequence.txt
$BWA_PATH/bwa mem -t 8 -k 30 -M  $R1/split_reads.1.fq.gz.clean.gz $R2/split_reads.2.fq.gz.clean.gz;
$Samtools_PATH/samtools view -bS -o NCBIsequence.bam
