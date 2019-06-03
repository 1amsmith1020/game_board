public class RedChecker extends BoardItem{
  
  public RedChecker(int rowAt, int colAt) {
    super(rowAt, colAt);
    this.kind = 1;
    
  }
  
  public void show(int xAt, int yAt, int cellSize) {
    for (int row = 0; row < glyphData.length; row++) {
      for (int col = 0; col < glyphData[row].length; col++) {
        //int fillColor = glyphData[row][col];
        //if (fillColor > -1) {
          fill(255,0,0);
          int x = xAt + col*(cellSize);
          int y = yAt + row* (cellSize);
          ellipse(x +cellSize/2, y + cellSize/2, cellSize * 0.8, cellSize*0.8);
        //}
      }
    }
  }
}
