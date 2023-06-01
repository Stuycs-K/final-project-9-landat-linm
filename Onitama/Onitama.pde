static int START = 0;
static int TWOPLAYER = 1;
static int ONEPLAYER = 2;
static int TUTORIAL = -1;
static int END = 3;
static int MODE = START;
int selectedCard = -1;
int[] currentPiece = {-1, -1};
int currentPlayer = -1;
ArrayList<int[]> highlights;
boolean gameOver = false;
int winner = -1;
Game game;
PImage original, one, two, tutorial, blueWin, blueWinMenu, blueWinRematch, redWin, redWinMenu, redWinRematch, background, backgroundMenu;
boolean menu = false;

void setup() {
  size(750, 850);
  original = loadImage("defaultStart.png");
  one = loadImage("singlePlayerStart.png");
  two = loadImage("twoPlayerStart.png");
  background = loadImage("background.png");
  backgroundMenu = loadImage("backgroundMenu.png");
  tutorial = loadImage("tutorialStart.png");
  blueWin = loadImage("blueWin.png");
  blueWinMenu = loadImage("blueWinMenu.png");
  blueWinRematch = loadImage("blueWinRematch.png");
  redWin = loadImage("redWin.png");
  redWinMenu = loadImage("redWinMenu.png");
  redWinRematch = loadImage("redWinRematch.png");
}

void newTwoPlayerGame() {
  game = new Game();
  currentPlayer = 1;
  selectedCard = -1;
  currentPiece = new int[]{-1, -1};
  gameOver = false;
  winner = -1;
  menu = false;
}
void draw() {
  background(#121115);
  if (MODE == TWOPLAYER) {
    if (menu){
      image(backgroundMenu, 0, 0);
    } else{
      image(background, 0, 0);
    }
    drawCards();
    game.display(100, 225);
    //debugStrings();
    highlight();
    if (currentPlayer ==1) {
      fill(#f44336);
      stroke(#f44336);
      circle(50, 425, 30);
    } else if (currentPlayer ==2) {
      fill(#2196f3);
      stroke(#2196f3);
      circle(50, 425, 30);
    }
  } else if (MODE == START) {
    if (mouseX < 550 && mouseX > 200 && mouseY > 340 && mouseY < 435) {
      image(one, 0, 0);
    } else if (mouseX < 550 && mouseX > 200 && mouseY > 472 && mouseY < 567) {
      image(two, 0, 0);
    } else if (mouseX < 550 && mouseX > 200 && mouseY > 604 && mouseY < 699) {
      image(tutorial, 0, 0);
    } else {
      image(original, 0, 0);
    }
  } else if (MODE == END) {
    if (winner ==1) {
      image(redWin, 0, 0);
    } else if (winner==2) {
      image(blueWin, 0, 0);
    }
    if (mouseX > 200 && mouseX < 550 && mouseY > 384 && mouseY < 479) {
      if (winner ==1) {
        image(redWinRematch, 0, 0);
      } else if (winner==2) {
        image(blueWinRematch, 0, 0);
      }
    } else if (mouseX > 200 && mouseX < 550 && mouseY > 517 && mouseY < 612) {
      if (winner ==1) {
        image(redWinMenu, 0, 0);
      } else if (winner==2) {
        image(blueWinMenu, 0, 0);
      }
    }
  }
}

void highlight() {
  if (selectedCard != -1 && currentPiece[0] != -1) {
    highlights = game.highlight(currentPiece[0], currentPiece[1], currentPlayer, game.deck[selectedCard]);
    for (int i = 0; i < highlights.size(); i++) {
      noFill();
      stroke(#2f6662);
      rect(80*highlights.get(i)[1]+100, 80*highlights.get(i)[0]+225, 80, 80);
    }
  }
  if (currentPiece[0] != -1) {
    noFill();
    stroke(#5e70c4);
    rect(80*currentPiece[1]+100, 80*currentPiece[0]+225, 80, 80);
  }
  stroke(#5e70c4);
  noFill();
  if (selectedCard == 0) {
    rect(100, 662, 190, 150);
  } else if (selectedCard == 1) {
    rect(310, 662, 190, 150);
  } else if (selectedCard == 2) {
    rect(100, 38, 190, 150);
  } else if (selectedCard == 3) {
    rect(310, 38, 190, 150);
  } else if (selectedCard == 4) {
    rect(530, 350, 190, 150);
  }
}

void debugStrings() {
  textAlign(LEFT);
  text("selectedCard: " + selectedCard, 20, 20);
  text("selectedPiece: " + currentPiece[0] + ", "+currentPiece[1], 20, 40);
  if (mouseX > 100 && mouseX < 500 && mouseY > 225 && mouseY < 625) {
    int row = game.whichTile(mouseX, mouseY)[0];
    int col = game.whichTile(mouseX, mouseY)[1];
    text("Mouse: " + row + ", " + col, 20, 60);
    if (game.board[row][col] != null) {
      text("Player: " + game.board[row][col].getPlayer(), 20, 80);
    }
  }
  text("won? " + gameOver, 20, 100);
  text("current player: " + currentPlayer, 20, 120);
}

void drawCards() {
  game.deck[0].display(100, 662, 1);
  game.deck[1].display(310, 662, 1);
  game.deck[2].display(100, 38, 2);
  game.deck[3].display(310, 38, 2);
  game.deck[4].display(530, 350, 0); //3 should change to 4 at some point
}

void mouseClicked() {
  if (MODE == START) {
    if (mouseX < 550 && mouseX > 200 && mouseY > 340 && mouseY < 435) {
      // nothing for now but it'll lead to the bot later
    } else if (mouseX < 550 && mouseX > 200 && mouseY > 472 && mouseY < 567) {
      MODE = TWOPLAYER;
      newTwoPlayerGame();
    } else if (mouseX < 550 && mouseX > 200 && mouseY > 604 && mouseY < 699) {
      // nothing for now but it'll lead to instructions later
    }
  } else if (MODE == TWOPLAYER) {
    if (mouseX > 717 && mouseX < 737 && mouseY > 11 && mouseY < 44){
      menu = !menu;
    } else if (menu){
      if (mouseX > 649 && mouseX < 734 && mouseY > 8 && mouseY < 39){
        MODE = START;
      } else if (mouseX > 649 && mouseX < 734 && mouseY > 39 && mouseY < 70){
        newTwoPlayerGame();
      } else if (mouseX > 649 && mouseX < 734 && mouseY > 70 && mouseY < 101){
        winner = 2;
        MODE = END;
      } else if (mouseX > 649 && mouseX < 734 && mouseY > 101 && mouseY < 132){
        winner = 1;
        MODE = END;
      } else if (mouseX > 649 && mouseX < 734 && mouseY > 132 && mouseY < 163){
      } else if (mouseX > 649 && mouseX < 734 && mouseY > 163 && mouseY < 194){
      }
    }
    if (currentPlayer == 1) {
      if (mouseX > 100 && mouseX < 290 && mouseY > 662 && mouseY < 812) {
        selectedCard = 0;
      }
      if (mouseX > 310 && mouseX < 500 && mouseY > 662 && mouseY < 812) {
        selectedCard = 1;
      }
    }
    if (currentPlayer == 2) {
      if (mouseX > 100 && mouseX < 290 && mouseY > 38 && mouseY < 188) {
        selectedCard = 2;
      }
      if (mouseX > 310 && mouseX < 500 && mouseY > 38 && mouseY < 188) {
        selectedCard = 3;
      }
    }
    if (mouseX > 100 && mouseX < 500 && mouseY > 225 && mouseY < 625) {
      int row = game.whichTile(mouseX, mouseY)[0];
      int col = game.whichTile(mouseX, mouseY)[1];
      if (game.board[row][col] != null && game.board[row][col].getPlayer() == currentPlayer) {
        currentPiece[0] = row;
        currentPiece[1] = col;
      } else if (selectedCard != -1 && currentPiece[0] != -1) {
        if (game.canMove(selectedCard, currentPiece[0], currentPiece[1], row, col, currentPlayer)) {
          Boolean won = game.move(currentPiece[0], currentPiece[1], row, col, currentPlayer);
          Cards used = game.deck[selectedCard];
          game.deck[selectedCard] = game.deck[4];
          game.deck[4] = used;
          game.deck[4].flip();
          if (won) {
            gameOver = true;
            winner = currentPlayer;
            MODE = END;
          } else {
            currentPiece[0] = -1;
            currentPiece[1] = -1;
            selectedCard = -1;
            if (currentPlayer == 1) {
              currentPlayer++;
            } else {
              currentPlayer--;
            }
          }
        }
      }
    }
  } else if (MODE == END) {
    if (mouseX > 200 && mouseX < 550 && mouseY > 384 && mouseY < 479) {
      MODE = TWOPLAYER;
      newTwoPlayerGame();
    } else if (mouseX > 200 && mouseX < 550 && mouseY > 517 && mouseY < 612) {
      MODE = START;
    }
  }
}
