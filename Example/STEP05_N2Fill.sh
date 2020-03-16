set -e
source ../profile 

echo "Now starting find \"N\"  to fill...\n"
cd ./3.findN2fill
ln -s ../1.max/NCBImaxread.txt
ln -s ../2.NPP/Nfake_final_realpos.txt
perl 01.findN2fill.pl Nfake_realpos.txt NCBImaxread.txt >fillNp.txt
awk '!a[$1,$2]++' fillNp.txt >fillNp_final0.txt  || exit 1
perl -ne 's/\t/\n/g;print' fillNp_final0.txt >fillNp_final.txt
cd ..
echo "All \"N\" location can fill have been found...\nFinally,we are ready to run the last step---Fill it...\n"



