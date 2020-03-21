#include<iostream>
#include"proj5_playlist.h"
using namespace std;
void doublesize(Song *&ptr,int &size)
{
	Song *temp=new Song[size*2];
	for(int i=0;i<size;i++)
		{
			(temp[i])=(ptr[i]);
		}
		delete [] ptr;
	ptr=temp;
	temp=0;
	size*=2;
}
void halfsize(Song *&ptr,int &size)
{
	Song *temp=new Song[size/2];
	for(int i=0;i<size/2;i++)
		{
			(temp[i])=(ptr[i]);
		}
	delete [] ptr;
	ptr=temp;
	temp=0;
	size/=2;
}
PlayList::PlayList()
		{
			capacity=2;
			plist=new Song[2];
			songsno=0;
			currentsongindex=1;
		}
void PlayList:: AddSong(const Song &s)
		{
			songsno++;
			if(songsno==(capacity+1))
			{
				doublesize(plist,capacity);
				plist[songsno-1]=s;
			}
			else
			plist[songsno-1]=s; 
		}
bool PlayList:: DeleteSong(const Song &s)
		{
			for(int i=0;i<capacity;i++)
			{
				if(s==(plist[i]))
				{
					for(int j=i;j<songsno-1;j++)
					{
						(plist[i])=(plist[i+1]);
					}
					songsno--;
					if(songsno==(capacity/2))
					{
						halfsize(plist,capacity);
					}
					return 1;
				}
			}
			return 0;
		}
void PlayList:: ShowAll()const
		{
			for(int i=0;i<songsno;i++)
			{
				cout<<(plist[i])<<endl;
			}
		}
void PlayList:: Play(int num)  const
	{
            cout<<plist[num];		
	}
void PlayList:: ShowStatus() const
		{
			cout<<"Total slots allocated = "<<capacity<<endl;
			cout<<"No of songs = "<<songsno<<endl;
			cout<<"Current song index = "<<currentsongindex<<endl;
		}

PlayList&  operator +(PlayList& obj1,Song &obj2)
{
	obj1.AddSong(obj2);
	return obj1; 

}
//	playList obj3;
//	while(obj3.capacity<obj1.songsno)
//	{
//		doublesize(obj3.ptr,obj3.capacity);
//	}
//    for(int i=0;i<obj1.songsno;i++)
//		{
//			obj3.((ptr[i]))=obj1.((ptr[i]));
//		}
//	songsno++;
//	if(obj3.songsno==(capacity+1))
//	{
//		doublesize(obj3.ptr,obj3.capacity);
//	    obj3.((ptr[songsno-1]))=obj2;
//	}
//	else
//	obj3.((ptr[songsno-1]))=obj2;
//	return obj3; 
//}

PlayList& operator -(PlayList &obj1,Song &obj2)
{
	obj1.DeleteSong(obj2);
	return obj1;
}
