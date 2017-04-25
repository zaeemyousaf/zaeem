''' Author: Zaeem Yousaf
Email: quaidzaeem@gmail.com
Date: 01-02-2017
version: 1.0
python: 3
Teacher: Sir Naghman at PakTurk
'''

''' Function list

1): mkCards(n,types) returns an array of size n, contains 'types' types of data
2): mkGrid(cardsArray,rows,cols) returns two dimensional array of size 'rows' and 'columns'
3): shuffle(grid,nplaces) returns shuffled two dimensional array, nplaces=1 means suffle only one card and so on
4): areSame(usc) boolean predicates whether user selected card are same.
5): cardsAtPos(grid,pos) returns cards array at positions
6): gridDisplay(grid,faceUp=False,except) provides user's interface
7): removeCards(grid,pos,replace) replaces cards at pos from grid with user defined value
8): contains(boxArray,elements) boolean predicates whether 'element list' is in boxArray
'''
def mkCards(n,types):
    ''' it makes n virtual cards of different types 
    it is ordered list'''
    identicals=int(n/types)
    Deck=[]
    for t in range(types):
        for identical in range(identicals):
            Deck.append(t)
    return Deck

deck=mkCards(64,32)
#--------------------------------------------
def mkGrid(cardsList,rows,cols):
    ''' makes two dimension grid into rows and columns '''
    grid=[]
    #loops=len(cardsList)+1
    loops=(rows*cols)+1
    rowElements=[]
    for l in range(1,loops):
        if l % cols !=0:
            rowElements.append(cardsList[l-1])
        else:
            rowElements.append(cardsList[l-1])
            grid.append(rowElements)
            rowElements=[]
    return grid
grid=mkGrid(deck,8,8)
#print(grid)            

#----------------------------------------------
def shuffle(grid,nplaces):
    ''' it rearranges the cards 
    nplaces tries to swap n cards to eachother's place'''
    shuffledGrid=grid
    # preserve the original grid
    m=len(grid)
    # number of rows
    n=len(grid[0])
    # number of columns
    from random import random
    for i in range(nplaces):
        # select one random coordinate
        rRow1=int((m)*random())
        #print(" random row1 is: {} ".format(rRow1))
        # random row 
        rCol1=int((n)*random())
        #print(" random col1 is: {} ".format(rCol1))
        #print(rCol1)
        # random column
        vAtCoordinate1=(grid[rRow1])[rCol1]
        #print(" value at {} is {} ".format((rRow1,rCol1),vAtCoordinate1))
        # value At Coodinate 1
        #-------------------------
        # select second random coordinate
        rRow2=int((m)*random())
        #print(" random row2 is: {} ".format(rRow2))
        #print(rRow2)
        rCol2=int((n)*random())
        #print(" random col2 is: {} ".format(rCol2))
        #print(rCol2)
        vAtCoordinate2=(grid[rRow2])[rCol2]
        #print(" value at {} is {} ".format((rRow2,rCol2),vAtCoordinate2))
        #print(" value at {}".format(vAtCoordinate1))
        #------------------------- swaping
        temp=vAtCoordinate1
        vAtCoordinate1=vAtCoordinate2
        vAtCoordinate2=temp
        # print(" after swaping value at {} is {} ".format((rRow2,rCol2),vAtCoordinate2))
        #------------------------- updating grid
        ((shuffledGrid[rRow2])[rCol2])=vAtCoordinate2
        ((shuffledGrid[rRow1])[rCol1])=vAtCoordinate1
    return shuffledGrid
sGrid=shuffle(grid=grid,nplaces=20)
#print(sGrid)

#------------------------------------- test whether all are same
def areSame(usc):
    # User's Selected Cards
    ''' if first matchs all other then all are same '''
    first=usc[0]
    loops=len(usc)
    same=True
    for remaining in range(1,loops):
        if first != usc[remaining]:
            same=False
    if same == True:
        return True
    else:
        return False
# print(areSame((1,1,1)))
#----------------------------------
def contains(boxArray,elements):
    ''' boxArray: array from which you are comparing
    elements: array that you are comparing
    note: order matters
    '''
    # for exceptions only
    loops=int(len(boxArray)/2)
    found=False
    for first in range(loops):
        block=[]
        row=2*first
        for others in range(2):
            block.append(boxArray[row+others])
        #print(block)
        if block==elements:
            found=True
    if found==True:
        return True
    else:
        return False
#print(contains(boxArray=[1,2,1,3,3,7],elements=[1,3]))
#print(contains(boxArray=[1,2,1,3,3,7],elements=[3,2]))

#----------------------------------
def cardsAtPos(grid,pos):
    ''' pos=(row1,col1,row2,col2....) 
    each consective pair is position of a card grid'''
    # assumes first index =1
    cards=[]
    loops=int(len(pos)/2)
    for i in range(loops):
        i=i*2
        row=pos[i]
        card=(grid[row-1])[pos[i+1]-1]
        cards.append(card)
    return cards
#print(cardsAtPos(grid,(1,1,8,8,0,5)))
#--------------------------------------------
def gridDisplay(grid,faceUp=False,exception=[]):
    ''' Display grid
    either faces up are layed down
    except those cards at positions in except list '''

    # Top border
    print("__________ Game for Memory Testing Designed at PakTurk School _______________\n\n")
    print("",end="\t\t")
    cloops=len(grid[0])
    rloops=len(grid)
    for cols in range(cloops):
        print("{}".format(cols+1),end="\t")
    for rows in range(1,rloops+1):
        print("\n")
        print("",end="\t")
        print("{}".format(rows),end="\t")
        if faceUp==True:
            # lay cards with their faces up except a list give
            for columns in range(cloops):
                if (grid[rows-1])[columns] =="empty":
                    print(" ",end="\t")
                    # in case of empty
                    #--------------------
                elif contains(boxArray=exception,elements=[rows,columns+1]) ==True:
                    # in case of exception
                    print("#",end="\t")
                else:
                    # show elements
                    print("{}".format((grid[rows-1])[columns]),end="\t")
        else:
            # lay cards with their faces down except a list given
            for columns in range(cloops):
                # in case, a card has been removed
                if (grid[rows-1])[columns] =="empty":
                    print(" ",end="\t")
                elif contains(boxArray=exception,elements=[rows,columns+1]) ==True:
                    print("{}".format((grid[rows-1])[columns]),end="\t")
                    # show card at this pos
                else:
                    # mask with this sign
                    print("#",end="\t")
                    
    print("\n")
    # return nothing if it runs successfully
    return 0
#gridDisplay(grid,faceUp=False,exception=[1,1,1,2])
#gridDisplay(sGrid,show=True)
#-------------------------------------------- select cards at pos
#usc=input("Enter cards pos coma separated: ")
#pos=eval(usc)
# users selected cards
#cards=cardsAtPos(sGrid,pos)
#if areSame(cards):
#  print("congratulation! your guess is right")
    
#print(cards)
#---------------------------------------------
def removeCards(grid,pos,replace="empty"):
    loops=int(len(pos)/2)
    for i in range(loops):
        i=i*2
        row=pos[i]
        (grid[row-1])[pos[i+1]-1]=replace
#print(grid)
#removeCards(grid,pos=[1,1,2,2])
#print(grid)
#=============================== user input functions

