inputFiles=['fraz.txt','hamza.txt','aliNasir.txt','zaeem.txt','mAhmad.txt','M_k.txt','rahim.txt','sadeed.txt','uzair.txt','saad.txt','ahmadShahzad.txt','osama.txt']
outputFiles=[(inputFiles[name].split(".")[0])+"_timeline.txt" for name in range(len(inputFiles))]
for i in range(len(inputFiles)):
	ifileHandle=open(str(inputFiles[i]),'r')
	ofileHandle=open(outputFiles[i],'a')
	lineOfText=ifileHandle.readline()
	# totalChars=0
	# totalWords=0
	totalUniquePosts=0
	# preStatement=""
	#totalSpam=0
	data=""
	# headers
	ofileHandle.write("Dates\t")
	ofileHandle.write("ComFreq\n")

	while lineOfText != '':
		statement=lineOfText.split(',')	# date is coma separated
		if len(statement) ==2:
			date=statement[0]	# date is in first column and
			totalUniquePosts+=1	# comulative posts
			print(statement)
			#chars=len(statement[2])
			# print(chars)
			#words=len(statement[2].split(" "))
			# print(words)
			# totalChars+=chars
			# totalWords+=words
			# preStatement=statement[2]
		lineOfText=ifileHandle.readline()

		# name=inputFiles[i].split(".")[0]
		ofileHandle.write(date+"\t")
		ofileHandle.write(str(totalUniquePosts))
		ofileHandle.write("\n")
	# ofileHandle.write(str(totalSpam)+"\t")	
	# ofileHandle.write(str(totalWords)+"\t")
	# ofileHandle.write(str(totalChars)+"\t")
	# ifileHandle.close()
	# ofileHandle.close()
