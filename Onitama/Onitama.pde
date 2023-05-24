static int CHOOSECARD = 0;
static int CHOOSEPIECE = 1;
static int CHOOSEDEST = 2;
static int MODE = CHOOSECARD;
int startRow, startCol, endRow, endCol;
int currentPlayer;
ArrayList<int[]> highlights;
Game game;

void setup(){
  size(750, 850);
  //rect(100, 225, 400, 400);
  game = new Game();
  game.deck[2].display(100, 38);
  game.deck[3].display(310, 38);
  //game.deck[4].display(530, 350);
  game.deck[0].display(100, 662);
  game.deck[1].display(310, 662);
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
