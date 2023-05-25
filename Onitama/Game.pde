public class Game{
  private Piece[][] board;
  private Cards[] deck;

  public Game(){
    board = new Piece[][]{{new Piece(2, "pawn"), new Piece(2, "pawn"), new Piece(2, "king"), new Piece(2, "pawn"), new Piece(2, "pawn")},
    {null, null, null, null, null},
    {null, null, null, null, null},
    {null, null, null, null, null},
    {new Piece(1, "pawn"), new Piece(1, "pawn"), new Piece(1, "king"), new Piece(1, "pawn"), new Piece(1, "pawn")}
    };
    deck = new Cards[]{new Cards("DRAGON"), new Cards("RABBIT"), new Cards("GOOSE"), new Cards("TIGER")};
  }

  public Cards[] getDeck(){
    return deck;
  }

  private boolean canMove(int cardNum, int startRow, int startCol, int endRow, int endCol, int currentPlayer){
    return deck[cardNum].isValid(startRow, startCol, endRow, endCol) && board[endRow][endCol].getPlayer()!=currentPlayer;
  }

  private boolean move(int startRow, int startCol, int endRow, int endCol, int currentPlayer){
    Piece temp = board[endRow][endCol];
    board[endRow][endCol] =  board[startRow][startCol];
    board[startRow][startCol] = null;
    if (temp.getPieceType().equals("king")){
      return true;
    }
    if (currentPlayer==1 && endRow==0 && endCol==2){
      return true;
    }
    if (currentPlayer==2 && endRow==4 && endCol==2){
      return true;
    }
    return false;
  }
  
  public String toString(){
    String str = "";
    for (int i = 0; i < 5; i++){
      for (int j = 0; j < 5; j++){
        if (board[i][j].equals(null)){
          str += "0  ";
        }
        else{
          str += board[i][j].getPieceType() + board[i][j].getPlayer() + " ";
        }
      }
    }
    return str;
  }
  
  public ArrayList<int[]> highlight(int pieceRow, int pieceCol, int currentPlayer, Cards card){
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
    for (int i = 0; i < vectors.length; i++){
      int[] rowCol = new int[2];
      rowCol[0] = pieceRow - vectors[i][1];
      rowCol[1] = pieceCol + vectors[i][0];
      possibleMoves.add(rowCol);
    }
    return possibleMoves;
  }
  
  void display(int x, int y){
    stroke(#757575);
    fill(#2e2b37);
    int SQUARE_SIZE = 80;
    for (int i = 0; i < 5; i++){
      for (int j = 0; j < 5; j++){
        rect(SQUARE_SIZE * j + x, SQUARE_SIZE * i + y, SQUARE_SIZE, SQUARE_SIZE);
        if(this.board[i][j] != null){
          this.board[i][j].display(j * SQUARE_SIZE + x, i * SQUARE_SIZE + y);
        }
      }
    }
  }
}
