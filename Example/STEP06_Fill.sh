set -e
source ../profile
echo "Starting fill \"N\", Now begain to change the standard formate of input.fa..."
cd ./4.fill
ln -s ../2.NPP/Nfake_final_realpos.txt
ln -s ../3.findN2fill/fillNp_final.txt
perl 00.remove.pl BSscaffold.fa >BSscaffold1.fa
perl 01.convertname.pl fillNp_final.txt >fillNp_final1.txt
perl 02.fill.pl fillNp_final.txt BSscaffold1.fa  >BS_fill.fa
perl -ne 's/Scaffold/>Scaffold/g;print' BS_fill.fa >BS_fill_final.fa
echo "All steps have been finished, the file \"BS_fill_final.fa\" is the final genome file...good luck!!!"
