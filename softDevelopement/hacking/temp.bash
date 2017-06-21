found="True"
pass=1
while [ $pass -lt 10 ] && [ $found == "False" ]
do echo $pass
pass=$[$pass+1]
done
