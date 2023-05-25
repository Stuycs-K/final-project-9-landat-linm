int startRow, startCol, endRow, endCol;
int selectedCard;
int[] currentPiece;
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
  if(currentPlayer == 1){
    if(mouseX > 100 && mouseX < 290 && mouseY > 662 && mouseY < 812){
      selectedCard = 0;
    }
    if(mouseX > 310 && mouseX < 500 && mouseY > 662 && mouseY < 812){
      selectedCard = 1;
    }
    if(mouseX > 100 && mouseX < 500 && mouseY > 225 && mouseY < 625){
      int row = whichTile(mouseX, mouseY)[0];
      int col = whichTile(mouseX, mouseY)[1];
      if(game.board[row][col] != null && game.board[row][col].getPlayer() == currentPlayer){
        currentPiece[0] = row;
        currentPiece[1] = col;
      }
}
