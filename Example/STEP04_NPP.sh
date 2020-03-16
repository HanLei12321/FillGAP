set -e
source ./profile
cd ./2.NPP
ln -s ../../step_1_align/BSsequence.txt
cat BSsequence.txt | sed 's/\s\+/\n/g' >BSsequence1.txt
perl 00.convert.pl BSsequence1.txt >BSsequence2.txt
split -l 926320 BSsequence2.txt -d -a 1 1.split_  ||exit 1

bash splitname.sh >splitname.txt && perl splitname_2.pl splitname.txt >runsplit_2.sh && bash runsplit_2.sh ||exit 2
bash 02.cat.sh
perl 03.convert.pl Nfake_realpos.txt >Nfake_final_realpos.txt
cd ..
echo ""All \"N\" location have been found...\nNext begin to check all \"N\" location can fill...\n"



