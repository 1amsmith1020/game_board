public class GreenSquare extends BoardItem {

  public GreenSquare(int rowAt, int colAt) {
    super(rowAt, colAt);
    //rowAt = rowAt * 64;
    //colAt = colAt * 64;
    this.kind = 0;
  }
  
  public void show(int xAt, int yAt, int cellSize) {
    for (int row = 0; row < glyphData.length; row++) {
      for (int col = 0; col < glyphData[row].length; col++) {
        fill(18, 173, 42);
        int x = xAt + col*cellSize;
        int y = yAt + row* cellSize;
        rect(xAt,yAt, cellSize, cellSize);
        
      }
    }
  }
}
         //greenSquares.add(new GreenSquare(theBoard.getCell(mouseX, mouseY).colID() * 64, theBoard.getCell(mouseX, mouseY).rowID() * 64 - 1));
         //greenSquares.get(greenSquares.size() - 1).setData(greenSquareData);
         //theBoard.addItem(greenSquares.get(greenSquares.size() - 1));
