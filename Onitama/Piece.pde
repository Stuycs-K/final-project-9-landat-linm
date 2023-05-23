public class Piece{
  private int player;
  private String pieceType;
  
  public int getPlayer(){
    return player;
  }
  
  public String getPieceType(){
    return pieceType;
  }
  
  public Piece(int newPlayer, String newPieceType){
    player = newPlayer;
    pieceType = newPieceType;
  }
}
