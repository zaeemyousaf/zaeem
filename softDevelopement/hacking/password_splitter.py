# it reads a passwords_list.txt
# it makes their sublists in each run
# it requires two cmd arguments
# first telling the length of 
sub_password_list_handle=open("sub_password_list_index.txt",'r')
sub_password_list_index=str(sub_password_list_handle.readline().split('\n')[0])
print(sub_password_list_index)
sub_password_list_handle.close()
# after reading, updating the file
sub_password_list_handle=open("sub_password_list_index.txt",'w')
sub_password_list_handle.write(str(int(sub_password_list_index)+1))
sub_password_list_handle.close()
#-------------------------------
n_sub_processes_handle=open("n_sub_processes.txt",'r')
n_sub_processes=int(str(n_sub_processes_handle.readline().split('\n')[0]))
print(n_sub_processes)
n_sub_processes_handle.close()
#---------------------
n_passwords_handle=open("password_list.txt",'r')
n_passwords=len(n_passwords_handle.readlines())
n_sub_processes_handle.close()
#---------------------
# the above stuff just imported 'sub_password_list_index', 'n_sub_processes'
from math import ceil
n_passwords_to_each=ceil(n_passwords/float(n_sub_processes))
print(n_passwords_to_each)
# print(n_passwords)
#---------------------
major_passwords_handle=open("password_list.txt",'r')
sub_password_list_handle=open("sub_password_list.txt",'w')
for i in range(n_passwords_to_each):
	sub_password_list_handle.write(major_passwords_handle.readline())

	