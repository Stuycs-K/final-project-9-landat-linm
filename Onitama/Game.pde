public class Game{
  private Piece[][] board;
  private Cards[] deck;

  public Game(){
    Piece[][] board = {{new Piece(2, "pawn"), new Piece(2, "pawn"), new Piece(2, "king"), new Piece(2, "pawn"), new Piece(2, "pawn")},
    {null, null, null, null, null},
    {null, null, null, null, null},
    {null, null, null, null, null},
    {new Piece(1, "pawn"), new Piece(1, "pawn"), new Piece(1, "king"), new Piece(1, "pawn"), new Piece(1, "pawn")}
    };
    Cards[] deck = {new Cards("DRAGON"), new Cards("RABBIT"), new Cards("GOOSE"), new Cards("TIGER")};
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
          str += "   ";
        }
        else{
          str += board[i][j].getPieceType() + board[i][j].getPlayer() + " ";
        }
      }
    }
    return str;
  }
}
