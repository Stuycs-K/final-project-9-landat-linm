static int START = 0;
static int TWOPLAYER = 1;
static int ONEPLAYER = 2;
static int TUTORIAL = -1;
static int END = 3;
static int MODE = START;
static int PASTMODE;
static int TUTORIALPAGE = 1;
int selectedCard = -1;
int[] currentPiece = {-1, -1};
int[] selectedDestination = {-1, -1};
int[] selectedStart = {-1, -1};
int currentPlayer = -1;
ArrayList<int[]> highlights;
boolean gameOver = false;
int winner = -1;
Game game;
PImage original, one, two, tutorial, blueWin, blueWinMenu, blueWinRematch, redWin, redWinMenu, redWinRematch, background, backgroundMenu;
PImage page1, page1a, page2, page2a, page2b, page3, page3a, page4, page5, page6, page7, page7a, page8, page8a, page9, page9a, page9b;
PImage[] tut;
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
  page1 = loadImage("page1.png");
  page1a = loadImage("page1a.png");
  page2 = loadImage("page2.png");
  page2a = loadImage("page2a.png");
  page2b = loadImage("page2b.png");
  page3 = loadImage("page3.png");
  page3a = loadImage("page3a.png");
  page4 = loadImage("page4.png");
  page5 = loadImage("page5.png");
  page6 = loadImage("page6.png");
  page7 = loadImage("page7.png");
  page7a = loadImage("page7a.png");
  page8 = loadImage("page8.png");
  page8a = loadImage("page8a.png");
  page9 = loadImage("page9.png");
  page9a = loadImage("page9a.png");
  page9b = loadImage("page9b.png");
  tut = new PImage[]{page1, page2, page3, page4, page5, page6, page7, page8, page9};
}

void newTwoPlayerGame() {
  selectedDestination[0] = -1;
  selectedDestination[1] = -1;
  selectedStart[0] = -1;
  selectedStart[1] = -1;
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
  if (MODE == TUTORIAL) {
    image(tut[TUTORIALPAGE-1], 0, 0);
    if (TUTORIALPAGE == 1) {
      if (mouseX < 740 && mouseX > 701 && mouseY > 392 && mouseY < 458) {
        image(page1a, 0, 0);
      }
    } else if (TUTORIALPAGE == 2) {
      if (mouseX < 740 && mouseX > 701 && mouseY > 392 && mouseY < 458) {
        image(page2b, 0, 0);
      } else if (mouseX < 49 && mouseX > 10 && mouseY > 392 && mouseY < 458) {
        image(page2a, 0, 0);
      }
    } else if (TUTORIALPAGE == 3) {
      if (mouseX > 200 && mouseX < 551 && mouseY > 424 && mouseY < 520) {
        image(page3a, 0, 0);
      }
    } else if (TUTORIALPAGE == 7) {
      if (mouseX > 700 && mouseX < 730 && mouseY > 648 && mouseY < 699) {
        image(page7a, 0, 0);
      }
    } else if (TUTORIALPAGE == 8) {
      if (mouseX < 740 && mouseX > 701 && mouseY > 392 && mouseY < 458) {
        image(page8a, 0, 0);
      }
    } else if (TUTORIALPAGE == 9) {
      if (mouseX > 200 && mouseX < 550 && mouseY > 452 && mouseY < 548) {
        image(page9a, 0, 0);
      } else if (mouseX > 200 && mouseX < 550 && mouseY > 585 && mouseY < 681) {
        image(page9b, 0, 0);
      }
    }
    if (TUTORIALPAGE == 4 || TUTORIALPAGE == 5 || TUTORIALPAGE == 6 || TUTORIALPAGE==7) {
      drawCards();
      game.display(100, 225);
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
    }
  }
  if (MODE == TWOPLAYER || MODE == ONEPLAYER) {
    if (menu) {
      image(backgroundMenu, 0, 0);
    } else {
      image(background, 0, 0);
    }
    drawCards();
    game.display(100, 225);
    if (selectedStart[0] != -1 && selectedStart[1] != -1 && selectedDestination[0] != -1 && selectedDestination[1] != -1) {
      arrow(selectedStart[0], selectedStart[1], selectedDestination[0], selectedDestination[1]);
    }
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
      if (MODE == ONEPLAYER) {
        botmove();
      }
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
      stroke(#72fcf2);
      rect(80*highlights.get(i)[1]+100, 80*highlights.get(i)[0]+225, 80, 80);
    }
  }
  if (currentPiece[0] != -1) {
    noFill();
    stroke(#fafbff);
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

void arrow(int startRow, int startCol, int endRow, int endCol) {
  int startX = 100 + 80 * startCol + 40;
  int startY = 225 + 80 * startRow + 40;
  int endX = 100 + 80 * endCol + 40;
  int endY = 225 + 80 * endRow + 40;
  stroke(255);
  fill(255);
  line(startX, startY, endX, endY);
  float slope = (float)(endY-startY)/ (float) (endX-startX);
  if (startX == endX && startY > endY) {
    triangle(endX, endY, endX + 3, endY + 15, endX - 3, endY + 15);
  } else if (startX == endX && startY < endY) {
    triangle(endX, endY, endX + 3, endY - 15, endX - 3, endY - 15);
  } else if (startY == endY && startX < endX) {
    triangle(endX, endY, endX - 15, endY - 3, endX - 15, endY + 3);
  } else if (startY == endY && startX > endX) {
    triangle(endX, endY, endX + 15, endY - 3, endX + 15, endY + 3);
  } else if (startX < endX) {
    triangle(endX, endY, endX - 15 + 3, endY -slope*15 - (1/slope)*3, endX - 15 - 3, endY -slope*15 + (1/slope)*3);
  } else if (startX > endX) {
    triangle(endX, endY, endX + 15 - 3, endY + slope*15 + (1/slope)*3, endX + 15 + 3, endY +slope*15 - (1/slope)*3);
  }
}

void mouseClicked() {
  if (MODE == TUTORIAL) {
    // right arrow: 701 - 740, 392 - 458
    // left arrow: 10 - 49, 792 - 458
    if (TUTORIALPAGE == 1) {
      if (mouseX < 740 && mouseX > 701 && mouseY > 392 && mouseY < 458) {
        TUTORIALPAGE++;
      }
    } else if (TUTORIALPAGE == 2) {
      if (mouseX < 740 && mouseX > 701 && mouseY > 392 && mouseY < 458) {
        TUTORIALPAGE++;
      } else if (mouseX < 49 && mouseX > 10 && mouseY > 392 && mouseY < 458) {
        TUTORIALPAGE--;
      }
    } else if (TUTORIALPAGE == 3) {
      if (mouseX > 200 && mouseX < 551 && mouseY > 424 && mouseY < 520) {
        newTwoPlayerGame();
        TUTORIALPAGE++;
      }
    } else if (TUTORIALPAGE == 4 || TUTORIALPAGE == 5 || TUTORIALPAGE == 6) { // choose card, piece, move
      if (mouseX > 100 && mouseX < 290 && mouseY > 662 && mouseY < 812) {
        selectedCard = 0;
        if (TUTORIALPAGE == 4) {
          TUTORIALPAGE++;
        }
      } else if (mouseX > 310 && mouseX < 500 && mouseY > 662 && mouseY < 812) {
        selectedCard = 1;
        if (TUTORIALPAGE == 4) {
          TUTORIALPAGE++;
        }
      }

      if (TUTORIALPAGE == 5 || TUTORIALPAGE == 6) { // choose piece
        if (mouseX > 100 && mouseX < 500 && mouseY > 225 && mouseY < 625) {
          int row = game.whichTile(mouseX, mouseY)[0];
          int col = game.whichTile(mouseX, mouseY)[1];
          if (row == 4) {
            currentPiece[0] = row;
            currentPiece[1] = col;
            if (TUTORIALPAGE == 5) {
              TUTORIALPAGE++;
            }
          } else {
            if (game.canMove(selectedCard, currentPiece[0], currentPiece[1], row, col, currentPlayer)) {
              game.move(currentPiece[0], currentPiece[1], row, col, currentPlayer);
              Cards used = game.deck[selectedCard];
              game.deck[selectedCard] = game.deck[4];
              game.deck[4] = used;
              game.deck[4].flip();
              currentPlayer++;
              currentPiece[0] = -1;
              currentPiece[1] = -1;
              selectedCard = -1;
              TUTORIALPAGE++;
            }
          }
        }
      }
    } else if (TUTORIALPAGE == 7) {
      if (mouseX > 700 && mouseX < 730 && mouseY > 648 && mouseY < 699) {
        TUTORIALPAGE++;
      }
    } else if (TUTORIALPAGE == 8) {
      if (mouseX < 740 && mouseX > 701 && mouseY > 392 && mouseY < 458) {
        TUTORIALPAGE++;
      }
    } else if (TUTORIALPAGE == 9) {
      if (mouseX > 200 && mouseX < 550 && mouseY > 452 && mouseY < 548) {
        TUTORIALPAGE = 1;
      } else if (mouseX > 200 && mouseX < 550 && mouseY > 585 && mouseY < 681) {
        TUTORIALPAGE = 1;
        MODE = START;
      }
    }
  } else if (MODE == START) {
    if (mouseX < 550 && mouseX > 200 && mouseY > 340 && mouseY < 435) {
      MODE = ONEPLAYER;
      PASTMODE = ONEPLAYER;
      newTwoPlayerGame();
    } else if (mouseX < 550 && mouseX > 200 && mouseY > 472 && mouseY < 567) {
      MODE = TWOPLAYER;
      PASTMODE = TWOPLAYER;
      newTwoPlayerGame();
    } else if (mouseX < 550 && mouseX > 200 && mouseY > 604 && mouseY < 699) {
      MODE = TUTORIAL;
    }
  } else if (MODE == TWOPLAYER) {
    if (mouseX > 717 && mouseX < 737 && mouseY > 11 && mouseY < 44) {
      menu = !menu;
    } else if (menu) {
      if (mouseX > 649 && mouseX < 734 && mouseY > 8 && mouseY < 39) {
        MODE = START;
      } else if (mouseX > 649 && mouseX < 734 && mouseY > 39 && mouseY < 70) {
        newTwoPlayerGame();
      } else if (mouseX > 649 && mouseX < 734 && mouseY > 70 && mouseY < 101) {
        winner = 2;
        MODE = END;
      } else if (mouseX > 649 && mouseX < 734 && mouseY > 101 && mouseY < 132) {
        winner = 1;
        MODE = END;
      } else if (mouseX > 649 && mouseX < 734 && mouseY > 132 && mouseY < 163) {
        newTwoPlayerGame();
        game = new Game("capture");
      } else if (mouseX > 649 && mouseX < 734 && mouseY > 163 && mouseY < 194) {
        newTwoPlayerGame();
        game = new Game("temple");
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
        selectedDestination[0] = -1;
        selectedDestination[1] = -1;
        selectedStart[0] = -1;
        selectedStart[1] = -1;
      } else if (selectedCard != -1 && currentPiece[0] != -1) {
        if (game.canMove(selectedCard, currentPiece[0], currentPiece[1], row, col, currentPlayer)) {
          Boolean won = game.move(currentPiece[0], currentPiece[1], row, col, currentPlayer);
          selectedDestination[0] = row;
          selectedDestination[1] = col;
          selectedStart[0] = currentPiece[0];
          selectedStart[1] = currentPiece[1];
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
      MODE = PASTMODE;
      newTwoPlayerGame();
    } else if (mouseX > 200 && mouseX < 550 && mouseY > 517 && mouseY < 612) {
      MODE = START;
    }
  } else if (MODE == ONEPLAYER) {
    if (mouseX > 717 && mouseX < 737 && mouseY > 11 && mouseY < 44) {
      menu = !menu;
    } else if (menu) {
      if (mouseX > 649 && mouseX < 734 && mouseY > 8 && mouseY < 39) {
        MODE = START;
      } else if (mouseX > 649 && mouseX < 734 && mouseY > 39 && mouseY < 70) {
        newTwoPlayerGame();
      } else if (mouseX > 649 && mouseX < 734 && mouseY > 70 && mouseY < 101) {
        winner = 2;
        MODE = END;
      } else if (mouseX > 649 && mouseX < 734 && mouseY > 101 && mouseY < 132) {
        winner = 1;
        MODE = END;
      } else if (mouseX > 649 && mouseX < 734 && mouseY > 132 && mouseY < 163) {
        newTwoPlayerGame();
        game = new Game("capture");
      } else if (mouseX > 649 && mouseX < 734 && mouseY > 163 && mouseY < 194) {
        newTwoPlayerGame();
        game = new Game("temple");
      }
    }
    if (currentPlayer == 1) {
      if (mouseX > 100 && mouseX < 290 && mouseY > 662 && mouseY < 812) {
        selectedCard = 0;
      }
      if (mouseX > 310 && mouseX < 500 && mouseY > 662 && mouseY < 812) {
        selectedCard = 1;
      }
      if (mouseX > 100 && mouseX < 500 && mouseY > 225 && mouseY < 625) {
        int row = game.whichTile(mouseX, mouseY)[0];
        int col = game.whichTile(mouseX, mouseY)[1];
        if (game.board[row][col] != null && game.board[row][col].getPlayer() == currentPlayer) {
          currentPiece[0] = row;
          currentPiece[1] = col;
          selectedDestination[0] = -1;
          selectedDestination[1] = -1;
          selectedStart[0] = -1;
          selectedStart[1] = -1;
        } else if (selectedCard != -1 && currentPiece[0] != -1) {
          if (game.canMove(selectedCard, currentPiece[0], currentPiece[1], row, col, currentPlayer)) {
            Boolean won = game.move(currentPiece[0], currentPiece[1], row, col, currentPlayer);
            selectedDestination[0] = row;
            selectedDestination[1] = col;
            selectedStart[0] = currentPiece[0];
            selectedStart[1] = currentPiece[1];
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
    }
  }
}
boolean botmove() {
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5; j++) {
      if (game.board[i][j] != null && game.board[i][j].getPlayer() == 2) { // chooses a piece
        for (int k = 2; k < 4; k++) { // chooses a card
          ArrayList<int[]> possibleMoves = game.highlight(i, j, 2, game.deck[k]); // all possible moves
          for (int l = 0; l < possibleMoves.size(); l++) { // iterate through all possible moves
            Piece temp = game.board[possibleMoves.get(l)[0]][possibleMoves.get(l)[1]];
            if (possibleMoves.get(l) == new int[]{4, 2} || (temp != null && temp.getPieceType().equals("king"))) { // if its a win
              game.move(i, j, possibleMoves.get(l)[0], possibleMoves.get(l)[1], 2); // then do that move
              selectedDestination[0] = possibleMoves.get(l)[0];
              selectedDestination[1] = possibleMoves.get(l)[1];
              selectedStart[0] = i;
              selectedStart[1] = j;
              gameOver = true;
              winner = 2;
              MODE = END;
              return true;
            }
          }
        }
      }
    }
  }
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5; j++) {
      if (game.board[i][j] != null && game.board[i][j].getPlayer() == 2) { //piece
        for (int k = 2; k < 4; k++) { //movecard
          ArrayList<int[]> possibleMoves = game.highlight(i, j, 2, game.deck[k]); // all possible moves
          for (int l = 0; l < possibleMoves.size(); l++) { // iterate through all moves
            Piece temp = game.board[possibleMoves.get(l)[0]][possibleMoves.get(l)[1]];
            if (temp != null && temp.getPlayer() == 1) { // if it captures a pawn
              game.move(i, j, possibleMoves.get(l)[0], possibleMoves.get(l)[1], 2);
              selectedDestination[0] = possibleMoves.get(l)[0];
              selectedDestination[1] = possibleMoves.get(l)[1];
              selectedStart[0] = i;
              selectedStart[1] = j;
              currentPiece[0] = -1;
              currentPiece[1] = -1;
              selectedCard = -1;
              currentPlayer--;
              Cards used = game.deck[k];
              game.deck[k] = game.deck[4];
              game.deck[4] = used;
              game.deck[4].flip();
              return true;
            }
          }
        }
      }
    }
  }

  int startRow = 0;
  int startCol = 0;
  int whichCard = 0;
  int minRow = 4;
  int whichMove = 0;
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5; j++) {
      if (game.board[i][j] != null && game.board[i][j].getPlayer() == 2) {
        for (int k = 2; k < 4; k++) {
          ArrayList<int[]> possibleMoves = game.highlight(i, j, 2, game.deck[k]);
          for (int l = 0; l < possibleMoves.size(); l++) {
            if (possibleMoves.get(l)[0] < minRow) {
              minRow = possibleMoves.get(l)[0];
              whichMove = l;
              startRow = i;
              startCol = j;
              whichCard = k;
            }
          }
        }
      }
    }
  }
  ArrayList<int[]> possibleMoves = game.highlight(startRow, startCol, 2, game.deck[whichCard]);
  game.move(startRow, startCol, possibleMoves.get(whichMove)[0], possibleMoves.get(whichMove)[1], 2);
  selectedDestination[0] = possibleMoves.get(whichMove)[0];
  selectedDestination[1] = possibleMoves.get(whichMove)[1];
  selectedStart[0] = startRow;
  selectedStart[1] = startCol;
  currentPiece[0] = -1;
  currentPiece[1] = -1;
  selectedCard = -1;
  currentPlayer--;
  Cards used = game.deck[whichCard];
  game.deck[whichCard] = game.deck[4];
  game.deck[4] = used;
  game.deck[4].flip();
  return true;
}
