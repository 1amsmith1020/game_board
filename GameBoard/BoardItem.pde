public class BoardItem {

  protected int colID, rowID;
  protected int maxRow, maxCol;

  protected int[][] glyphData;
  
  protected int[][][] checkerGlyphData;
  
  protected int kind;
  

  public BoardItem(int rowAt, int colAt) {
    this.rowID = rowAt;
    this.colID = colAt;
    this.kind = -1;
  }

  public void setData(int[][] data) {
    glyphData = data;
  }
  
  public void setData3D(int[][][] data){
    checkerGlyphData = data;
  }

  public int row() {
    return rowID;
  }
  public int col() {
    return colID;
  }

  public void show(int xAt, int yAt, int cellSize) {
    for (int row = 0; row < glyphData.length; row++) {
      for (int col = 0; col < glyphData[row].length; col++) {
        int fillColor = glyphData[row][col];
        if (fillColor > -1) {
          fill(fillColor);
          int x = xAt + col*cellSize;
          int y = yAt + row* cellSize;
          rect(x, y, cellSize, cellSize);
        }
      }
    }
  }

  public void setBounds(int rows, int cols) {
    maxRow = rows + 2;
    maxCol = cols + 1;
  }

  public void updateCol(int by) {
    if (colID + by <= maxCol - glyphData[0].length && colID + by >= 0) {
      colID+=by;
    }
  }
  
  public void setRow(int row){
   rowID = row; 
  }
  
  public void setCol(int col){
    colID = col;
  }

  public void updateRow(int by) {
    if (rowID + by <= maxRow - glyphData.length  && rowID + by >= 0) {
      rowID+=by;
    }
  }
  
  public boolean equals(Object other){
      if(other instanceof BoardItem){
          BoardItem that = (BoardItem)other;
          if(this.colID == that.colID && this.rowID == that.rowID && this.kind == that.kind){          
            return true;
          }
      }
      return false;
  }
  
  public String toString(){
    String kStr = "undef";
      if (kind == 0)
        kStr = "green highlight";
      else if(kind == 1)
        kStr = "red checker";
      else if (kind == 2)
        kStr = "black checker";
     return kStr + " at " + rowID + " , " + colID;
  }
  
  
   public Cell[] getVanguard( char direction ){
    ArrayList<Cell> result = new ArrayList<Cell>();

    //deal with the up direction
    if(direction == 'u'){
      for(int i = 0; i < glyphData[0].length; i++){
         if( glyphData[0][i] > -1 ){
           int colVal = i + colID;
           int rowVal = rowID - 1;
           Cell c = new Cell(rowVal, colVal);
           result.add(c);
         }
      }
    }

    return result.toArray(new Cell[0]);
  }
}
