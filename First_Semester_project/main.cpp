#include "mygraphics.h"
#include <iostream>
// Author:
// Zaeem Yousaf
// University: FAST-NUCES LAHORE

// No classes allowed
// using windows cmd display and graphics.h library

//----------------global variables
int game_level=1; // game level easy, hard, supper hard
int defender_power=5;//variable power of defender
int life;//original power of defender
int space=30;//distance between invaders
int target_error=10;//accuracy measure according to game level
int invader_width=30;//width of invader shape
int invader_height=30;//height of invader shape
int score=0;//initial score
int w =500;//screen width variable
int h = 300;//screen height variable
int delta_x=0;//shift across x axis of invaders
int delta_y=0;//shift across y axis of invaders
int defender_x=50;//left top position of defender
int defender_y=30;//left top position of defender
int defender_width=50;//width of defender shape
int defender_height=25;//height of defender shape
int left_margin=50;//leftmost boundary of shape
int top_margin=20;//uppermost boundary of shape
int invader_missile_speed=10;//missile speed of invader
int defender_missile_speed=10;//missile speed of defender
int ltime=0;//local time
int def_missiles[5][3]={0};//defender's missiles record of 5 with zero as death
int invaders_missiles[5][3]={0};//invaders's missiles. record of 5 at a time
// assuming 5 invaders in a row
const int n_invaders=20;//fixed no of invaders initially drawn
const int n_properties=10;//properties of invaders

int invaders[n_invaders][n_properties]={0}; // 20 invaders, each with its data
//inex. 0: x, 1:y, 2: exist
void show_life_bar();//it updates remaining life of defender
void set_up_game_level();//asks for game level user want to choose
void init_invaders(); //sets life of all invaders to true
void update_invaders(); //update their position after each iteration
void draw_invaders(int);//color parameter to display 255 as appear and 0 as disappear
void show_exit();//it will display game over
void draw_region();//it draws the boundary of entire game

void insert_defender_missile(int);//it adds initial position of missile into missile defender array
void insert_invader_missile(int,int);//it adds initial position of missile into missile defender array

void draw_defender(int);//color parameter;draw shape of defender
void update_defender_missiles();//propagate the positions of defender missiles
void draw_defender_missiles(int); // color;255 as display and 0 as disappear

void update_invader_missiles();//missiles position is updated after each iteration
void draw_invader_missiles(int); // color parameter 255 as appear and 0 as disappear


using namespace std;
int main(){
    	cls();

	getWindowDimensions(w,h);//it will update global variable
    defender_x=w/2; // setting in middle at start
	init_invaders();// initialize the life of invaders
	cout << "adjust your screen\nEnter Game Level 1: easy 2: hard 3: supper hard ";
	cin >> game_level;
	set_up_game_level();
	cls();
	getWindowDimensions(w,h);
	showConsoleCursor(false);

char c;
int dt=1;

defender_width=w/10; //effective width of defender

while(score < 20 && defender_power >0){

cls();//score update
gotoxy(0,0);

cout << "                             score: " << score;
//====================== controlling the movement of invader
delta_x+=10*dt;
if(delta_x > 100) {dt=-1;delta_y+=20;}
else if(delta_x <=10) dt=1;
//====================== getting key
 c = getKey();
if(c == 'a') defender_x=defender_x-30;
else if(c=='f') defender_x=defender_x+30;
else if(c== ' ') {if(ltime%2==0) insert_defender_missile(defender_x);}
else if(c == 'q') break;
else{;}
//==================keeping the defender within margin
if(defender_x < left_margin ) defender_x=left_margin;
else if(defender_x > w-left_margin-defender_width) defender_x=w-left_margin-defender_width;
//==================start drawing
draw_region();
show_life_bar();
update_defender_missiles();
update_invaders();
update_invader_missiles();
        //--------------------------
draw_defender(255);
draw_defender_missiles(255);
draw_invaders(255);
draw_invader_missiles(255);
        //-----------------------


delay(100);
//======================removing the shapes
draw_defender(0);
draw_defender_missiles(0);
draw_invaders(0);
draw_invader_missiles(0);
ltime++;

    }
    cls();
    show_exit();

  system("pause");
	return 0;
}
//------------------- init_invaders
void init_invaders(){
    for(int i=0; i<20; i++){
        //set life status of all to alive
        invaders[i][8]=1;// set life true
        invaders[i][6]=i;//row of invader
        invaders[i][7]=i%5;//column of invader

    }
}

//--------------------
void update_invaders(){

    int life_status=0;//life of invader;

    invader_width = (w-2*left_margin-4*space)/5;//reserve some area for horizontal movement
    invader_height=invader_width/2;
    for(int i=0; i < n_invaders; i++){

    life_status=invaders[i][8];//life status of invader is at 9th place

    if(life_status==1){


    invaders[i][0]=left_margin+(invader_width*(i%5))+delta_x+space;//x1
    invaders[i][1]=left_margin+invader_width+invader_width*(i%5)+delta_x;//x2
    invaders[i][2]=left_margin+invader_width/2+(invader_width*(i%5))+delta_x+space/2;//x3
    invaders[i][3]=invader_height*((i/5)+1)+delta_y+top_margin;//y1

    invaders[i][4]=invader_height*((i/5)+1)+delta_y+top_margin;//y2
    invaders[i][5]=invader_height*(i/5)+delta_y+top_margin;//y3
    if(invaders[i][3]> h-defender_height) {defender_power=0; break;}// touched the ground
        }
    } // updated coordinates

    //----------------------------
    //----------------------------

    for(int i=19; i>=0; i--){

        if(invaders[i][8] == 1){
            //cout << "updated\n";
            //cout << "invaders making missile entry";
            if(invaders[i][0] < (defender_x + target_error) && invaders[i][1] > (defender_x - target_error)){
            insert_invader_missile(invaders[i][2],invaders[i][3]);
            // take middle points
            }
        }
    } // updated their missiles


}
//-----------------------
void draw_invaders(int c){
    int delta=invader_width/10;
    for(int inv=0; inv < 20; inv++){
    if(invaders[inv][8] ==1){
        //drawing face
        drawEllipse(invaders[inv][0],invaders[inv][5],invaders[inv][1],invaders[inv][4],c,0,0,0,0,0);
        // making eyes
        drawEllipse(invaders[inv][2]-2*delta,invaders[inv][5]+delta,invaders[inv][2]-delta,invaders[inv][5]+2*delta,c,0,0,0,0,0);
        drawEllipse(invaders[inv][2]+2*delta,invaders[inv][5]+delta,invaders[inv][1]-delta,invaders[inv][5]+2*delta,c,0,0,0,0,0);

    }

}

}
//-----------------------
void draw_defender(int c){
    drawRectangle(defender_x,h-defender_height,defender_x+defender_width,h,0,0,0,0,c,0);
}
//-------------------
void insert_defender_missile(int x){
    int i=0;
    bool free=false;
    for(; i< 5; i++){
        if(def_missiles[i][2] == 0){
            free=true;
            break;
        }
        //break;
    }

    if(free){
            def_missiles[i][0]=x + defender_width/2;// x position of defender missile
            def_missiles[i][1]=h-defender_height; // y-position of defender missile
            def_missiles[i][2]=1;// set life to true
    }
}
//------------------------
void insert_invader_missile(int x,int y){
    int i=0;
    bool free=false;
    //-------------- find if any free space
    for(; i< 5; i++){
        if(invaders_missiles[i][2] == 0){
            free=true;
            break; // location has been found
        }

    }

    if(free){
            invaders_missiles[i][0]=x; // set x-pos of invader missile
            invaders_missiles[i][1]=y; // set y-pos of invader missile
            invaders_missiles[i][2]=1; // set life to true
    }
}
//------------------------
void update_defender_missiles(){

    int x1,y1;//y2,x2;

    for(int i=0; i< 5;i++){
        if(def_missiles[i][2] ==1){
        // if defender missile exists

            if(def_missiles[i][1] > 0){
            def_missiles[i][1]-=defender_missile_speed;
            // if defender missile is within range of screen

            x1=def_missiles[i][0];
            y1=def_missiles[i][1];

            //------------------
            bool death_occured=false;
            int inv=0;
            for(; inv < 20; inv++){
                if(invaders[inv][8] != 0){
                // if invader is alive
            if(x1 >= invaders[inv][0] && x1 <= invaders[inv][1]\
    && y1 >= invaders[inv][5] && y1 <= invaders[inv][3] ){
        death_occured=true;
        def_missiles[i][2]=0; // kill the missile
        invaders[inv][8]=0; // kill the invaer

        }
                }


}
if(death_occured) {score++;}
// if there is death of invader than increment invader
    else{}
}
        else{def_missiles[i][2]=0;}// killing missile

        }
    }
}
//--------------------------
void update_invader_missiles(){
        int x1,y1;
    for(int i=0; i< 5;i++){
        if(invaders_missiles[i][2] ==1){
            // if invader missile exists

            if(invaders_missiles[i][1] < h){
            // if invader missile is within range of screen
            invaders_missiles[i][1]+=invader_missile_speed;
            x1=invaders_missiles[i][0];
            y1=invaders_missiles[i][1];

            // if missile hits the invader
          if(x1 >= (defender_x ) && x1 <= (defender_x + defender_width) &&
        y1 >= (h-defender_height) && y1 <= h ){

    invaders_missiles[i][2]=0;
    defender_power--;
}
else{;}

        }// end if
        else{invaders_missiles[i][2]=0;}// killing missile

        }
    }
}
//---------------------------
void draw_defender_missiles(int c){
 int x1,y1,m_l=5; // missile length
    for(int i=0; i< 5;i++){
        if(def_missiles[i][2] ==1){
            // if defender missile exists
            x1=def_missiles[i][0];
            y1=def_missiles[i][1];
            drawLine(x1,y1,x1,y1-m_l,0,c,0);//drawing missile
            drawLine(x1-5,y1+m_l-2,x1,y1-m_l,0,c,0);//arrow
            drawLine(x1+5,y1+m_l-2,x1,y1-m_l,0,c,0);//arrow
        }
    }
}
//--------------------
void draw_invader_missiles(int c){
 int x1,y1,m_l=3; // missile length        defender_x=w/2;
    for(int i=0; i< 5;i++){
    //cout << "invaders missile \n";
        if(invaders_missiles[i][2] ==1){
            // if invader missile exists
            x1=invaders_missiles[i][0];
            y1=invaders_missiles[i][1];
            drawLine(x1,y1,x1,y1+m_l,c,0,0);
            drawLine(x1,y1+m_l,x1-5,y1-m_l-2,c,0,0);//arrow
            drawLine(x1,y1+m_l,x1+5,y1-m_l-2,c,0,0);//arrow
        }
    }
}
//----------------------
void set_up_game_level(){
    if(game_level == 1){
        target_error=200;
        defender_power=15;
        life=defender_power;
        defender_missile_speed=10;
        invader_missile_speed=10;
    }
    else if(game_level == 2){
    target_error=100;
    defender_power=10;
    life=defender_power;
    defender_missile_speed=10;
    invader_missile_speed=15;
    }
    else if(game_level == 3){
        target_error=50;
        defender_power=10;
        life=defender_power;
        defender_missile_speed=15;
        invader_missile_speed=35;
    }
}
//-------------------
void show_life_bar(){
     int bar_length=200,bar_height=15,active_length=200;
    active_length=(bar_length*defender_power/life);

    drawRectangle(0,0,active_length,bar_height,0,0,0,0,255,0);
    drawRectangle(active_length,0,bar_length,bar_height,0,0,0,0,0,0);
}
//---------------
void show_exit(){
    char c;
    while(true){
    drawLine(left_margin+50,top_margin+50,w-left_margin,top_margin+50,255);
    cout << "               Score is " << score << endl <<endl;
    if(score == 20) cout << "               you are winner\n\n";
    else if( score <20 && defender_power == 0) cout << "\n               you lost\n\n\n";
    else{cout << "               draw.\n\n";}
    cout << "               Enter q to quit the game.\n";
    c=getKey();
    if(c=='q') break;
    delay(100);
    cls();
    gotoxy(0,0);
    }

    }
//-----------------
void draw_region(){
    drawLine(left_margin,top_margin,w-left_margin,top_margin,255);//top
    drawLine(left_margin,top_margin,left_margin,h,255);//left
    drawLine(w-left_margin,top_margin,w-left_margin,h,255);//right

    }
