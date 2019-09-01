#!/usr/bin/python3.4
def mkBlocks(x,block_size=2,r2l=True):
	''' It takes an integer and splits it into blocks
	from right to left for square root purpose
	'''
	blocks_array=[]
	s_number = str(x)	#turning integer to string 
	remainder = len(s_number)%block_size

	if remainder ==0:
		loops = int(len(s_number)/block_size)
		even = True
	else:
		loops = int(len(s_number)/block_size)
		even = False

	if even:
		for i in range(loops):
			index=block_size*i
			block=int(s_number[index:index+block_size])
			#print(block)
			blocks_array.append(block)
	else:
		if r2l:
			# r2l: right two left
			block = int(s_number[0:remainder])
			#print(block)
			blocks_array.append(block)
			for i in range(loops):
				index=block_size*i + remainder
				block=int(s_number[index:index+block_size])
				#print(block)
				blocks_array.append(block)
		else:
			# from left to right grouping
			for i in range(loops):
				index=block_size*i
				block=int(s_number[index:index+block_size])
				#print(block)
				blocks_array.append(block)
			index=index+block_size
			block=int(s_number[index:index+remainder])
			blocks_array.append(block)
	return(blocks_array)

#print(mkBlocks("12346",2,r2l=False))
def findSqrt(x):
	blocks_array = mkBlocks(x,block_size=2,r2l=True)
	quotient=""
	difference=0 	# general difference in division
	prev_divider=0
	prev_trial_divider=0
	for i in blocks_array:
		trial_divider=1
		#print(i)
		dividend=int(str(difference)+ str(i))
		#print(dividend)
		divider = (prev_divider)+int(prev_trial_divider) # partial divider
		divider = int(str(divider)+str(trial_divider))	# whole divider
		while (trial_divider * divider) <= dividend:
			trial_divider +=1
			divider = (prev_divider)+int(prev_trial_divider) # partial divider
			divider = int(str(divider)+str(trial_divider))	# whole divider
			#print(divider)
			
		trial_divider = trial_divider -1 # last digit of divider
		quotient=quotient+str(trial_divider)

		divider = (prev_divider)+int(prev_trial_divider) # partial divider
		divider = int(str(divider)+str(trial_divider))	# whole divider

		difference = dividend - (divider * trial_divider)
		prev_divider = divider
		prev_trial_divider=trial_divider

	return(int(quotient))
print(findSqrt(19))
#--------------------------------------- writing display
def underHood(x,h=4,off_set=0):
	blocks_array = mkBlocks(x)
	hood_len=2*len(blocks_array)-1
	for i in range(off_set):
		# first line
		white_space=" "
		print(white_space,end="")
	print("") # line breakage
	for i in range(hood_len):
		#first line
		print("_",end="")
	print("")
	for i in range(off_set-1):
		# second line
		white_space=" "
		print(white_space,end="")
	print("")
	print("| ",end="")	# second line
	for i in blocks_array:
		print(i,end=" ")
	print("")
	for i in range(off_set-1):
		# second line
		white_space="_"
		print(white_space,end="")
	print("| ")

def interactiveSqrt(x):
	blocks_array = mkBlocks(x,block_size=2,r2l=True)
	quotient=""
	difference=0 	# general difference in division
	prev_divider=0
	prev_trial_divider=0
	for i in blocks_array:
		trial_divider=1
		#print(i)
		dividend=int(str(difference)+ str(i))
		#print(dividend)
		divider = (prev_divider)+int(prev_trial_divider) # partial divider
		divider = int(str(divider)+str(trial_divider))	# whole divider
		while (trial_divider * divider) <= dividend:
			trial_divider +=1
			divider = (prev_divider)+int(prev_trial_divider) # partial divider
			divider = int(str(divider)+str(trial_divider))	# whole divider
			#print(divider)
			
		trial_divider = trial_divider -1 # last digit of divider
		quotient=quotient+str(trial_divider)

		divider = (prev_divider)+int(prev_trial_divider) # partial divider
		divider = int(str(divider)+str(trial_divider))	# whole divider

		difference = dividend - (divider * trial_divider)
		prev_divider = divider
		prev_trial_divider=trial_divider

	return(int(quotient))

underHood("1234")
print(findSqrt(1323))