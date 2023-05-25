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
  
  void display(int x, int y){
    if(player == 1){
      if(pieceType.equals("king")){
        PImage redKing = loadImage("redKing.png");
        redKing.resize(50, 0);
        image(redKing, x, y);
      }
      else{
        PImage redPawn = loadImage("redPawn.png");
        redPawn.resize(50, 0);
        image(redPawn, x, y);
      }
    }
    else{
      if(pieceType.equals("king")){
        PImage blueKing = loadImage("blueKing.png");
        blueKing.resize(50, 0);
        image(blueKing, x, y);
      }
      else{
        PImage bluePawn = loadImage("bluePawn.png");
        bluePawn.resize(50, 0);
        image(bluePawn, x, y);
      }
    }
  }
}
