public class Game {
  private Piece[][] board;
  private Cards[] deck;
  private String[] cardPool = {"DRAGON", "RABBIT", "GOOSE", "TIGER", "ELEPHANT", "CRAB", "MONKEY", "CRANE", "MANTIS", "BOAR", "FROG", "HORSE", "EEL", "ROOSTER", "OX", "COBRA"};
  public Game() {
    board = new Piece[][]{{new Piece(2, "pawn"), new Piece(2, "pawn"), new Piece(2, "king"), new Piece(2, "pawn"), new Piece(2, "pawn")},
      {null, null, null, null, null},
      {null, null, null, null, null},
      {null, null, null, null, null},
      {new Piece(1, "pawn"), new Piece(1, "pawn"), new Piece(1, "king"), new Piece(1, "pawn"), new Piece(1, "pawn")}
    };
    deck = new Cards[]{new Cards(cardPool[int(random(16))]), new Cards(cardPool[int(random(16))]), new Cards(cardPool[int(random(16))]), new Cards(cardPool[int(random(16))]), new Cards(cardPool[int(random(16))])};
    deck[2].flip();
    deck[3].flip();
  }
  public Cards[] getDeck() {
    return deck;
  }
  
  public int[] rand5(){
    int[] sequence = new int[5];
    int x = 0;
    for (int i = 0; i < 5; i++){
      boolean diff = false;
      while (!diff){
        x=(int)(random(16));
        diff = true;
        for (int j = 0; j < i; j++){
          if (sequence[j]==x){
            diff = false;
          }
        }
      }
      sequence[i]=x;
    }
    return sequence;
  }

  private boolean canMove(int cardNum, int startRow, int startCol, int endRow, int endCol, int currentPlayer) {
    if (deck[cardNum].isValid(startRow, startCol, endRow, endCol)) {
      if (board[endRow][endCol] != null) {
        return board[endRow][endCol].getPlayer()!=currentPlayer;
      }
      return true;
    }
    return false;
  }

  private boolean move(int startRow, int startCol, int endRow, int endCol, int currentPlayer) {
    Piece temp = board[endRow][endCol];
    board[endRow][endCol] =  board[startRow][startCol];
    board[startRow][startCol] = null;
    if (temp != null && temp.getPieceType().equals("king")) {
      return true;
    }
    if (currentPlayer==1 && endRow==0 && endCol==2 && board[endRow][endCol].getPieceType().equals("king")) {
      return true;
    }
    if (currentPlayer==2 && endRow==4 && endCol==2 && board[endRow][endCol].getPieceType().equals("king")) {
      return true;
    }
    return false;
  }

  public String toString() {
    String str = "";
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 5; j++) {
        if (board[i][j].equals(null)) {
          str += "0  ";
        } else {
          str += board[i][j].getPieceType() + board[i][j].getPlayer() + " ";
        }
      }
    }
    return str;
  }

  public ArrayList<int[]> highlight(int pieceRow, int pieceCol, int currentPlayer, Cards card) {
    ArrayList<int[]> possibleMoves = new ArrayList<int[]>();
    int[][] vectors = card.getValidMoves();
    /*
    if (currentPlayer == 2){
     for (int i = 0; i < vectors.length; i++){
     for (int j = 0; j < 2; j++){
     vectors[i][j] = -1 * vectors[i][j];
     }
     }
     }
     */
    for (int i = 0; i < vectors.length; i++) {
      int[] rowCol = new int[2];
      rowCol[0] = pieceRow - vectors[i][1];
      rowCol[1] = pieceCol + vectors[i][0];
      if (rowCol[0]>-1 && rowCol[0]<5 && rowCol[1]>-1 && rowCol[1]<5) {
        if (board[rowCol[0]][rowCol[1]] == null || board[rowCol[0]][rowCol[1]].getPlayer()!=currentPlayer) {
          possibleMoves.add(rowCol);
        }
      }
    }
    return possibleMoves;
  }

  public int[] whichTile(int mousex, int mousey) {
    return new int[]{(mousey - 225) / 80, (mousex - 100) / 80};
  }

  void display(int x, int y) {
    stroke(#41464e);
    fill(#282c34);
    int SQUARE_SIZE = 80;
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 5; j++) {
        stroke(#41464e);
        fill(#282c34);
        if (i == 0 && j==2) {
          fill(#263848);
        } else if (i==4 && j==2) {
          fill(#3c2f34);
        }
        rect(SQUARE_SIZE * j + x, SQUARE_SIZE * i + y, SQUARE_SIZE, SQUARE_SIZE, 3);
        if (this.board[i][j] != null) {
          this.board[i][j].display(j * SQUARE_SIZE + x, i * SQUARE_SIZE + y);
        }
      }
    }
  }
}
