#ifndef PROJ5_PLAYLIST_H
#define PROJ5_PLAYLIST_H
#include<iostream>
#include"song.h"

using namespace std;
void doublesize(Song *&,int &);
void halfsize(Song *&,int &);
class PlayList{
	Song *plist;
	int songsno;
	int capacity;
	int currentsongindex;
	public:
PlayList();
void AddSong(const Song&);
bool DeleteSong(const Song&);

void ShowAll()const;
void Play(int num=1)const  ;
void ShowStatus() const;
friend PlayList& operator +(PlayList&,Song&);
friend PlayList& operator -(PlayList&,Song&); 
};
#endif
