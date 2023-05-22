public class Cards{
  private int[][] validMoves;
  private String Grid;
  private final int[][] DRAGON = new int[][]{{-2, 1},{2, 1},{-1, -1},{1, -1}};
  private final int[][] RABBIT = new int[][]{{1, 1},{2, 0},{-1, -1}};
  private final int[][] GOOSE = new int[][]{{-1, 1},{-1, 0},{1, 0},{1, -1}};
  private final int[][] TIGER = new int[][]{{0, 2},{0, -1}};
  
  public Cards(String name){
    if (name.equals("DRAGON")){
      validMoves = DRAGON;
      Grid = "Dragon";
    } else if (name.equals("RABBIT")){
      validMoves = RABBIT;
      Grid = "Rabbit";
    } else if (name.equals("GOOSE")){
      validMoves = GOOSE;
      Grid = "Goose";
    } else if (name.equals("TIGER")){
      validMoves = TIGER;
      Grid = "Tiger";
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
    int deltaX = endRow-startRow;
    int deltaY = endCol-startCol;
    for (int i = 0; i < validMoves.length; i++){
      if (validMoves[i][0]==deltaX && validMoves[i][1]==deltaY){
        return true;
      }
    }
    return false;
  }
}
