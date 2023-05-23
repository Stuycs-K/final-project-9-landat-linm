public class Game{
  private Piece[][] board;
  private Cards[] deck;
  
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
    if (temp.getPieceType().equals("Master")){
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
}
