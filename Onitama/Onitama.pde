int selectedCard = -1;
int[] currentPiece = {-1, -1};
int currentPlayer = -1;
ArrayList<int[]> highlights;
boolean gameOver = false;
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
  game.deck[4].display(530, 350, 0); //3 should change to 4 at some point
}

void mouseClicked(){
  if(currentPlayer == 1){
    if(mouseX > 100 && mouseX < 290 && mouseY > 662 && mouseY < 812){
      selectedCard = 0;
    }
    if(mouseX > 310 && mouseX < 500 && mouseY > 662 && mouseY < 812){
      selectedCard = 1;
    }
  }
  if(currentPlayer == 2){
    if(mouseX > 100 && mouseX < 290 && mouseY > 38 && mouseY < 188){
      selectedCard = 2;
    }
    if(mouseX > 310 && mouseX < 500 && mouseY > 38 && mouseY < 188){
      selectedCard = 3;
    }
  }
    if(mouseX > 100 && mouseX < 500 && mouseY > 225 && mouseY < 625){
      int row = game.whichTile(mouseX, mouseY)[0];
      int col = game.whichTile(mouseX, mouseY)[1];
      if(game.board[row][col] != null && game.board[row][col].getPlayer() == currentPlayer){
        currentPiece[0] = row;
        currentPiece[1] = col;
      } else if(selectedCard != -1 && currentPiece[0] != -1){
        if (game.canMove(selectedCard, currentPiece[0], currentPiece[1], row, col, currentPlayer)){
          if(game.move(currentPiece[0], currentPiece[1], row, col, currentPlayer)){
            gameOver = true;
          } else{
            currentPiece[0] = -1;
            currentPiece[1] = -1;
            selectedCard = -1;
            if(currentPlayer == 1){
              currentPlayer++;
            } else{
              currentPlayer--;
            }
          }
        }
      }
  }
}
