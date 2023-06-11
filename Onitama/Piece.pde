class Piece{
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
    if (player==1){
      fill(#f44336);
      stroke(#f44336);
    } else{
      fill(#2196f3);
      stroke(#2196f3);
    }
    if (pieceType.equals("pawn")){
      drawPawn(x, y);
    } else{
      drawKing(x, y);
    }
  }

  
  void drawPawn(int x, int y){
    circle(x+40, y+22, 25);
    rect(x+28, y+33, 24, 8, 2);
    quad(x+32, y+41, x+48, y+41, x+52, y+58, x+28, y+58);
    rect(x+20, y+62, 40, 7, 2);
  }
  
  void drawKing(int x, int y){
    rect(x+20, y+62, 40, 7, 2);
    quad(x+18, y+32, x+62, y+32, x+52, y+58, x+28, y+58);
    rect(x+18, y+31, 44, 3, 2);
    rect(x+38, y+16, 4, 16, 2);
    rect(x+32, y+22, 16, 4, 2);
    
  }
}
