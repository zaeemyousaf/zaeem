inputFiles=['fraz.txt','hamza.txt','aliNasir.txt','zaeem.txt','mAhmad.txt','M_k.txt','rahim.txt','sadeed.txt','uzair.txt','saad.txt','ahmadShahzad.txt','osama.txt']
for i in range(len(inputFiles)):
	ifileHandle=open(str(inputFiles[i]),'r')
	ofileHandle=open("table.txt",'a')
	lineOfText=ifileHandle.readline()
	totalChars=0
	totalWords=0
	totalUniquePosts=0
	preStatement=""
	totalSpam=0
	while lineOfText != '':
		statement=lineOfText.split(':')
		# each post started after ':'
		if len(statement) ==3:
			
			if preStatement != statement[2]:
				# not successive spam message
				totalUniquePosts+=1
				print(statement)
				chars=len(statement[2])
				print(chars)
				words=len(statement[2].split(" "))
				print(words)
				totalChars+=chars
				totalWords+=words
				preStatement=statement[2]
			else:
				totalSpam+=1
		lineOfText=ifileHandle.readline()

	ofileHandle.write("\n")
	name=inputFiles[i].split(".")[0]
	ofileHandle.write((name)+"\t")
	ofileHandle.write(str(totalUniquePosts)+"\t")
	ofileHandle.write(str(totalSpam)+"\t")	
	ofileHandle.write(str(totalWords)+"\t")
	ofileHandle.write(str(totalChars)+"\t")
	ifileHandle.close()
	ofileHandle.close()
