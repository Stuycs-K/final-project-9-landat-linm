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
  
  public display(int x, int y){
    if(player = 1){
      if(pieceType.equals("king"){
        PImage redKing = loadImage("redKing.png");
        image(x, y, redKing);
      }
      else{
        PImage redPawn = loadImage("redPawn.png");
        image(x, y, redPawn);
      }
    }
    else{
      if(pieceType.equals("king"){
        PImage blueKing = loadImage("blueKing.png");
        image(x, y, blueKing);
      }
      else{
        PImage bluePawn = loadImage("bluePawn.png");
        image(x, y, bluePawn);
      }
    }
  }
}
