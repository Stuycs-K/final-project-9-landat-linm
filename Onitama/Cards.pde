public class Cards{
  private int[][] validMoves;
  private String Grid;
  private final int[][] DRAGON = new int[][]{{-2, 1},{2, 1},{-1, -1},{1, -1}};
  private final int[][] RABBIT = new int[][]{{1, 1},{2, 0},{-1, -1}};
  private final int[][] GOOSE = new int[][]{{-1, 1},{-1, 0},{1, 0},{1, -1}};
  private final int[][] TIGER = new int[][]{{0, 2},{0, -1}};
  private final int[][] ELEPHANT = new int[][]{{-1,1},{1,1},{-1,0},{1,0}};
  private final int[][] CRAB = new int[][]{{0, 1},{-2, 0},{2, 0}};
  private final int[][] MONKEY = new int[][]{{-1, 1},{1,-1},{-1,-1},{1,-1}};
  private final int[][] CRANE = new int[][]{{0,1},{-1,-1},{1,-1}};
  private final int[][] MANTIS = new int[][]{{-1,1},{1,1},{0,-1}};
  private final int[][] BOAR = new int[][]{{0,1}{-1,0},{1,0}};
  private final int[][] FROG = new int[][]{{-1,1},{-2,0},{1,-1}};
  private final int[][] HORSE = new int[][]{{0,1},{-1,0},{0,-1}};
  private final int[][] EEL = new int[][]{{-1,1},{1,0},{-1,-1}};
  private final int[][] ROOSTER = new int[][]{{1, 1},{-1,0},{1,0},{-1,-1}};
  private final int[][] OX = new int[][]{{0,1},{1,0},0,-1}};
  private final int[][] COBRA = new int[][]{{1,1},{-1,0},{1,-1}};
  
  public Cards(String name){
    if (name.equals("DRAGON")){
      validMoves = DRAGON;
      Grid = "DRAGON";
    } else if (name.equals("RABBIT")){
      validMoves = RABBIT;
      Grid = "RABBIT";
    } else if (name.equals("GOOSE")){
      validMoves = GOOSE;
      Grid = "GOOSE";
    } else if (name.equals("TIGER")){
      validMoves = TIGER;
      Grid = "TIGER";
    } else if (name.equals("ELEPHANT")){
      validMoves = ELEPHANT;
      Grid = "ELEPHANT";
    } else if (name.equals("CRAB")){
      validMoves = CRAB;
      Grid = "CRAB";
    } else if (name.equals("MONKEY")){
      validMoves = MONKEY;
      Grid = "MONKEY";
    } else if (name.equals("CRANE")){
      validMoves = CRANE;
      Grid = "CRANE";
    } else if (name.equals("MANTIS")){
      validMoves = MANTIS;
      Grid = "MANTIS";
    } else if (name.equals("BOAR")){
      validMoves = BOAR;
      Grid = "BOAR";
    } else if (name.equals("FROG")){
      validMoves = FROG;
      Grid = "FROG";
    } else if (name.equals("HORSE")){
      validMoves = HORSE;
      Grid = "HORSE";
    } else if (name.equals("EEL")){
      validMoves = EEL;
      Grid = "EEL";
    } else if (name.equals("ROOSTER")){
      validMoves = ROOSTER;
      Grid = "ROOSTER";
    } else if (name.equals("OX")){
      validMoves = OX;
      Grid = "OX";
    } else if (name.equals("COBRA")){
      validMoves = COBRA;
      Grid = "COBRA";
    } else{
      validMoves = null;
      Grid = "N/A";
    }
  }
  
  public int[][] getValidMoves(){
    return validMoves;
  }
  
  public String toString(){
    String ans = "{";
    for (int i = 0; i < validMoves.length; i++){
      ans+="{"+validMoves[i][0]+", "+validMoves[i][1]+"}";
      if (i < validMoves.length-1){
        ans+=", ";
      }
    }
    return ans+"}";
  }
  
  public boolean isValid(int startRow, int startCol, int endRow, int endCol){
    int deltaY = startRow-endRow;
    int deltaX = endCol-startCol;
    for (int i = 0; i < validMoves.length; i++){
      if (validMoves[i][0]==deltaX && validMoves[i][1]==deltaY && endRow < 5 && endCol < 5){
        return true;
      }
    }
    return false;
  }
  
  void display(int x, int y, int player){
    stroke(#757575);
    int SQUARE_SIZE=30;
    for (int i = 0; i<5; i++){
      for (int j = 0; j<5; j++){
        if (i==2 && j==2){
          fill(#d7d7d7);
        } else{
          fill(#2b2e37);
        }
        rect(x+i*SQUARE_SIZE, y+j*SQUARE_SIZE, SQUARE_SIZE, SQUARE_SIZE);
      }
    }
    if (player == 1){
      fill(#d46579);
    } else if (player == 2){
      fill(#65b1d4);
    } else {
      fill(#d4c065);
    }
    for (int i = 0; i < validMoves.length; i++){
      int row = 2+validMoves[i][0];
      int col = 2-validMoves[i][1];
      rect(x+row*SQUARE_SIZE, y+col*SQUARE_SIZE, SQUARE_SIZE, SQUARE_SIZE);
    }
    rect(x+150, y, 40, 150);
    for (int i = 0; i < Grid.length(); i++){
      textAlign(CENTER);
      double head = (8-Grid.length())/2;
      fill(#ffffff);
      textSize(16);
      text(Grid.charAt(i), x+170, (int)(y+30+15*(i+head)));
    }
  }
}
