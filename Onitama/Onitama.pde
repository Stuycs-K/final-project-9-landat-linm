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
  background(#121115);
  game = new Game();
  game.display(100, 225);
  drawCards();
}
void draw(){
  
}
void drawCards(){
  game.deck[0].display(100, 662, 1);
  game.deck[1].display(310, 662, 1);
  game.deck[2].display(100, 38, 2);
  game.deck[3].display(310, 38, 2);
  game.deck[3].display(530, 350, 0); //3 should change to 4 at some point
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
