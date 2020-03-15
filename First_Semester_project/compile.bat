g++.exe -Wall -m32 -g -IC:\MinGW\include -c main.cpp -o main.o
g++.exe -LC:\MinGW\lib -o Graphics.exe main.o -m32 -lgdi32
