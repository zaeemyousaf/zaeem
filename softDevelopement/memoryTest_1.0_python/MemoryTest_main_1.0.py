#!/usr/bin/python3.4
'''
Author: Zaeem Yousaf
version: 1.0
python: 3
Teacher: Sir Naghman At PakTurk
'''

print("Most welcome to this game to test your memory\nThis game is all about guessing card layed face down\n")
#----------------
from MemoryTest_Validations import howManyCards, get_nCards, get_cardsPos, get_dimensions, get_playerNames, get_ntypes,inRange
ncards=get_nCards()
#----------------
ntypes=get_ntypes(totalCards=ncards)
dimensions=get_dimensions(ncards)
rows=dimensions[0]
columns=dimensions[1]
#--------------------------
picked=howManyCards(deckSize=ncards,types=ntypes)

#--------------------------
playerNames=get_playerNames()
GameLevel=int(input("enter game level 1): easy 2): hard 3): supper hard  "))
#================================== import game_func.py
from MemoryTest_Functions import mkCards, mkGrid, shuffle,gridDisplay, cardsAtPos,areSame, removeCards
#++++++++++++++++++++++++++++++++++
cardsName=mkCards(ncards,ntypes)
#----------------------------------
unShuffledGrid=mkGrid(cardsList=cardsName,rows=rows,cols=columns)
#----------------------------------
shuffledGrid=shuffle(grid=unShuffledGrid,nplaces=GameLevel*20)
#----------------------------------
#----------------------------------
scores=[]	# corressponding scores
for i in range(len(playerNames)):
        # score initializing to zero
        scores.append(0)
Game="Continue"
# turn Counter
turnCounter=0
# pick counter
pickCounter=0
gridDisplay(grid=shuffledGrid,faceUp=False,exception=[])
while Game=="Continue":
        print(("corresponding Scores: {} {}".format(playerNames,scores)))
        usc=input("\n{} Enter space sep {} card pos 'row1 col1 row2 col2 ...': ".format(playerNames[turnCounter%len(playerNames)],picked))
        pos=get_cardsPos(usc,picked)
        while inRange(pos,dimensions) !=True:
                # to test whether user selected card are in range of dimensions of rows and cols
                usc=input("\n{} Out of Range, Enter {} card pos 'row1 col1 row2 col2 ...': ".format(playerNames[turnCounter%len(playerNames)],picked))
                pos=get_cardsPos(usc,picked)
        while len(pos) != (2*picked):
                usc=input("{} Enter space sep {} card pos 'row1 col1 row2 col2 ...' carefully: ".format(playerNames[turnCounter%len(playerNames)],picked))
                pos=get_cardsPos(usc,picked)
        # users selected cards
        cards=cardsAtPos(shuffledGrid,pos)
        # if areSame(cards) and ) ==0:
        rcards=ncards-(picked)*pickCounter
        if (cards.count("empty")) == 0:
                # to avoid picking empty cards
                if areSame(cards):
                        pickCounter+=1
                        removeCards(grid=shuffledGrid,pos=pos,replace="empty")
                        scores[turnCounter%len(playerNames)]=scores[turnCounter%len(playerNames)]+1
                        print((playerNames,scores))
                        # remaining cards
                        rcards=ncards-(picked)*pickCounter
                        # print(rcards)
                        gridDisplay(grid=shuffledGrid,faceUp=False,exception=[])
                if rcards==0:
                        Game="end"
                else:
                        gridDisplay(grid=shuffledGrid,faceUp=False,exception=pos)
                        turnCounter+=1
                        #print("congratulation! your guess is right")
                        # remove selected cards
        else:
                print("\n ***** At this position there is no card *******\n")
if scores.count(max(scores)) > 1:
	print("**************draw**************\n end of the game")
else:
	winner=playerNames[scores.index(max(scores))]                
	print("******** Winner of the Game is {} **********\n------------------- End of Game".format(winner))

