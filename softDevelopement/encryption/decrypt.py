#!/usr/bin/python3.4
#------------------------
sEnglish=['a','b','c','d','e','f','g','h','i','j','k','l',
'm','n','o','p','q','r','s','t','u','v','w','x','y','z']

cEnglish=['A','B','C','D','E','F','G','H','I','J','K','L',
'M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']

# symbols contains every symbol except '\' which is explicit EOF
symbols=['~','!','@','#','$','%','^','&','*','(',')','-',
'+','~','_','=','{','}','|','[',']',':','"',';',str("'"),
'<','>','?',',','.','/',' ']

numbers=['0','1','2','3','4','5','6','7','8','9']

def identify(x):
	#----------- today
	# majority chars belongs to alphabatics
	# therefore testing first
	if x.isalnum():

		if x.isalpha():
			# x is alphabatic char
			if x.islower():
				# x is small char
				index=sEnglish.index(x)
				type='sEnglish'
				return {'type': type, 'index': index}

			else:
				index=cEnglish.index(x)
				type='cEnglish'
				return {'type': type, 'index': index}
				# x is capital char
		else:
			# x is numeric
			index=numbers.index(x)
			type='number'
			return {'type': type, 'index': index}

	elif symbols.__contains__(x):
			index=symbols.index(x)
			type='symbol'
			return {'type': type, 'index': index}

	else:
		# x is escape char
		return {'type': "escape", 'index': "useless"}
	#------------

''' test identify
print(identify("a"))
print(identify("A"))
print(identify("$"))
print(identify("8"))
print(identify("\n"))
'''
#---------------------------------------------------------
def encodeC(x,engI=0,numI=0,symI=0):
	# encodeCharacter : it encodes one character at a time. 
	identification=identify(x)
	# identify returns dictionary of {'type': Type, 'index': value}
	type=identification['type']
	index=identification['index']
	#------in case of small english character ----------
	if type=='sEnglish':
		# give same increment for english letter
		inc=engI	# increment=englishIncrement
		newIndex=(inc+index)%26
		eChar=sEnglish[newIndex]	# encoded Chararacter
		return {'encodedChar': eChar,'englishIncrement': engI, 
		'numberIncrement': numI, 'symbolIncrement': symI}
	#------in case of capital english character----------
	elif type=='cEnglish':
		inc=engI
		newIndex=(inc+index)%26
		eChar=cEnglish[newIndex]	# encoded Chararacter
		return {'encodedChar': eChar,'englishIncrement': engI, 
		'numberIncrement': numI, 'symbolIncrement': symI}
	#------in case of symbol---------------------------
	elif type=='symbol':
		inc=symI	# increment= symboleIncrement
		# length of vector symbol is = 32
		newIndex=(inc+index)%len(symbols)
		eChar=symbols[newIndex]	# encoded Chararacter
		return {'encodedChar': eChar,'englishIncrement': engI, 
		'numberIncrement': numI, 'symbolIncrement': symI}
	#------in case of number --------------------------
	elif type=='number':
		inc=numI
		# length of number vector is 10
		newIndex=(inc+index)%10
		eChar=numbers[newIndex]	# encoded Chararacter
		return {'encodedChar': eChar,'englishIncrement': engI,
		 'numberIncrement': numI, 'symbolIncrement': symI}
	else:
		# if type does not fit, don't encode it
		eChar=x
		return {'encodedChar': eChar,'englishIncrement': engI, 
		'numberIncrement': numI, 'symbolIncrement': symI}
#********************************************************************
''' test encodeC
print(encodeC("a",engI=2))
print(encodeC("A",engI=2))
print(encodeC("9",numI=2))
print(encodeC("&",symI=2))
'''
#---------------------------------------------------------------------
def encodeS(string="zaeem",engI=0,symI=0,numI=0,hold=[],igPtrn=0):
	# will convert string into secret code
	# loops= length of string
	# igPtr -> Ignore Pattern ignores first and corressponding chars after certain period
	encodedString=""
	ptrnCounter=abs(igPtrn)
	for i in range(len(string)):
		char=string[i]
		#print(char)
		#print(ptrnCounter)
		#if contains(char,hold)==True or ptrnCounter!=0:
		if hold.__contains__(char) or ptrnCounter ==0:
			# if char is in hold list don't encode and simply append it.
			# also don't encode at specific pattern 
			encodedString+=char
		else:
                        encodedData=encodeC(char,engI=engI,symI=symI,numI=numI)
                        # encodedData is a dictionary
                        encodedChar=encodedData['encodedChar']
                        encodedString+=encodedChar
		ptrnCounter+=-1
		if ptrnCounter==-1:
			ptrnCounter=abs(igPtrn)
	return {'encodedString': encodedString,'englishIncrement': engI,
	'numberIncrement': numI, 'symbolIncrement': symI, 'ignorePattern': igPtrn, 'holdChar': hold}
#--------------------------------------------------------------------
# 
# print(encodeS("working\n",igPtrn=2,engI=2,symI=0,numI=1,hold=["e","n","d","o"," "])['encodedString'])
#-----------------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------
def decodeF(Name):
	print("decrypting ...\n")
	inputFileName=Name.split('_')[0]
	outputFileName=inputFileName+"_decrypted.txt"
	# out.write("parameters\t{0}\t{1}\t{2}\t{3}\t{4}\n".format(engI,symI,numI,hold,igPtrn))
	inp=open(Name,'r')
	parameters=inp.readline().split('\t')
	if parameters[0] != "parameters":
		print("it is not encrypted file or it does not have parameters")
	else:
		# scan parameters and assign value

		engI=int(parameters[1])
		symI=int(parameters[2])
		numI=int(parameters[3])
		hold=eval(parameters[4])
		igPtrn=int(parameters[5])

		out=open(outputFileName,'w')
		Line=inp.readline()
		while Line!='':
			result=encodeS(Line,engI=-1*engI,symI=-1*symI,hold=hold,igPtrn=igPtrn)['encodedString']
			out.write(result)
			Line=inp.readline()
		out.close()
		print("decrypted file is saved as {}\n".format(outputFileName))

	inp.close()		
# working fine 
# encodeF("simple.txt",engI=-1,symI=0,numI=0,hold=[],igPtrn=0)
import sys
decodeF(sys.argv[1])
