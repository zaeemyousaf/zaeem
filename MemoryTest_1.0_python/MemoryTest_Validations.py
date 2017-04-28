'''
Author: Zaeem Yousaf
Email: quaidzaeem@gmail.com
python: 3
Teacher: Sir Naghman

'''

''' function list 
1): howManyCards(deckSize,types) returns fool proof number of cards to pick
2): get_nCards() returns number of cards selected by users
3): tokenise(text, tokens,toStrArray) handles user's input in multiple ways
4): get_cardsPos(pos) returns cards pos validated by tokenise
5): get_dimensions() returns rows and columns of grid
6): get_playerNames() returns names players
7): get_ntypes(Deck) returns types of cards present in a deck
'''
from MemoryTest_Functions import contains

def howManyCards(deckSize,types):

    pCards=int(input("How many cards a user is required to pick: "))
    if  pCards < 2:
        pCards=int(input("please select at least two cards: "))
        if (int(deckSize /(types))) % pCards !=0:
            # some cards will be left at the end
            possibilities=[]
            uLimit=int(deckSize/types)
            for i in range(2,uLimit):
                if deckSize % i ==0:
                    possibilities.append((i,int(deckSize/i)))
            print("----------------------------------")
            pCards=int(input("Possible selection: {}\nHow many cards a user is required to pick: ".format(possibilities)))
    return pCards
#--------------------------------------------
def get_nCards():
    ncards=int(input("No of cards in you game INTEGER: "))
    while ncards < 2:
        ncards=int(input("At least 2 cards for this game: INTEGER: "))
    return ncards
#--------------------------------------------

def tokenise(text,tokens=['[',']',',',' ', ';','(', ')'],toStrArray=False):
    # converts 'token separated text' to an array
    # toStrArray Askes for text Array or numeric array
 
    text=str(text)
    result=[]
    word=""
    for i in range(len(text)):
        char=text[i]
        # matching Counter = 0
        mCounter=0
        for token in range(len(tokens)):
            
            if char == tokens[token]:
               
                mCounter+=1
                #print("matching dected")
                #print(word)
        if mCounter ==0:
            # if no token matchs
            word=word+char
            # print(word)
        else:
            # if token matchs
            # append result
            # set word to empty
            # print("comming here")
            if toStrArray == False:
                # numeric word
                if word != "":
                    nWord=int(word)
                    result.append(nWord)
                word=""
            else:
                if word != "":
                    result.append(word)
                word=""
                    
    if word != "":
        # append last word
        if toStrArray == False:
            nWord=int(word)
            result.append(nWord)
        else:
            result.append(word)
    return result
#print(tokenise(text="1 1 2 2 ",toStrArray=True))
#-----------------------------------------------
def sDivisors(x):
    # returns supper divisors
    sDivisors=[]
    divisor=2
    loops=x/2
    while divisor <= loops:
        if x % divisor==0:
                # if remainder is zero, than divisor is factor
            sDivisors.append((divisor,int(x/divisor)))
        divisor+=1
    return sDivisors
# print(sDivisors(30))
#-----------------------------------------------
def get_cardsPos(pos,xCards):
    # returns formated position
    fPos=tokenise(pos,toStrArray=False)
    # to avoid picking one card twice
    while areUnique(pos=fPos) !=True:
        pos=input("\n{} picking same cards: Try again 'row1 col1 row2 col2 ...': ")
        fPos=tokenise(pos,toStrArray=False)
    return fPos

#print(get_cardsPos("[1,2,3,4  ]"))
#-----------------------------------------------
def get_dimensions(totalCards):
    dimensions=input("Enter Space separated no. of rows and cols: ")
    # formated dimensions
    fDimensions=tokenise(dimensions,toStrArray=False)
    while fDimensions[0]*fDimensions[1] !=totalCards:
            dimensions=input("Enter Space separated no. of rows and cols carefully: ")
            fDimensions=tokenise(dimensions,toStrArray=False)
    return fDimensions
#-----------------------------------------------
def get_playerNames():
    playerNames=input("Enter Space separated Names of Players: ")
    # formated playerNames
    fPlayerNames=tokenise(playerNames,toStrArray=True)
    while len(fPlayerNames) < 1:
        # in case no player is provided
        playerNames=input("Please Enter at least one player Name: ")
        fPlayerNames=tokenise(playerNames,toStrArray=True)
    return fPlayerNames
#----------------------------------------------
def get_ntypes(totalCards):
    ntypes=int(input("How many types of cards are in your deck: "))
    while ntypes < 2 or ntypes > totalCards or (totalCards % ntypes) !=0:
        print("Please select from possible selection: {} ".format(sDivisors(totalCards)))
        ntypes=int(input("How many types there are in your deck: "))
    return ntypes

#-----------------------------------------------
def inRange(pos,Dimensions):
    allAreInRange=True
    row=Dimensions[0]
    col=Dimensions[1]
    loops=int(len(pos)/2)
    for i in range(loops):
        i=2*i
        if (pos[i] <1 or pos[i]> row) or (pos[i+1] <1 or pos[i+1] > col):
            allAreInRange=False
            return False
    if allAreInRange==True:
        return True

# print(inRange([1,2,1,5],[1,5]))
# print(inRange([1,2,1,5],[2,5]))
# print(inRange([1,2,1,5],[1,7]))
#-------------------------------------------------
def areUnique(pos):
    # will test whether positions of cards are unique
    unique=True
    loops=int(len(pos)/2)
    for i in range(loops-1):
        nthPair=[]
        first=2*i
        nthPair.append((pos[first],pos[first+1]))
        for j in range(i+1,loops):
            second=2*j
            otherPair=[]
            otherPair.append((pos[second],pos[second+1]))
            print((nthPair,otherPair))
            if nthPair==otherPair:
                unique=False
                return False
    if unique == True:
        return True
# print(areUnique(pos=[1,2,1,2]))