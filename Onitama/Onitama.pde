static int CHOOSECARD = 0;
static int CHOOSEPIECE = 1;
static int CHOOSEDEST = 2;
static int MODE = CHOOSECARD;
int startRow, startCol, endRow, endCol;
int currentPlayer;
ArrayList<int[]> highlights;
Game game;

void setup(){

}
void draw(){
  
}

void mouseClicked(){
  if (MODE==CHOOSECARD){
    // call whichCard() to determine which card
  } else if (MODE==CHOOSEPIECE){
    //
  } else if (MODE==CHOOSEDEST){
    //
  }
}
