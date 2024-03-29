/*
Board class
 */
public class Board {
  int x_pos, y_pos;
  int cellSize;
  int rows, cols;
  int[][] layer = 
   {{}};
  ArrayList<BoardItem> items;

  public Board(int x, int y, int numRows, int numCols, int cellSize) {
    x_pos = x;
    y_pos = y;
    this.cellSize = cellSize;
    rows = numRows;
    cols = numCols;
    layer = null;
    items = new ArrayList<BoardItem>();
  }

  public void addItem(BoardItem item) {
    items.add(item);
    item.setBounds(rows - 1, cols  +1);
  }
  
  public void removeItem(BoardItem item){
   println("removing item: " + item);
   items.remove(item);
  }
  
  

  public void show() {
    
    pushMatrix();
    translate(x_pos, y_pos);
    for (int j=0; j<rows; j++) {
      for (int i=0; i < cols; i++) {
        int xAt = i*cellSize;
        int yAt = j*cellSize;

        //Todo: think about what color we want
        //fill( ? );
        //stroke( ? ); // border color
        //strokeWeight( ? ); // thickness of cell border
        
        if ((j + i ) % 2 == 0) {
          fill(255);
          rect(xAt, yAt, cellSize, cellSize);
          
        } else {
          fill(75);
          rect(xAt, yAt, cellSize, cellSize);
         
        }

        drawLayerCell(j, i, xAt, yAt);
      }
    }

    for (BoardItem item : items) {
      int xAt = item.col()*cellSize;
      int yAt = item.row()*cellSize;
      item.show(xAt, yAt, cellSize);
      //item.show();
    }

    popMatrix();
  }

  protected void drawLayerCell(int rowID, int colID, int xPos, int yPos) {
    if (layer !=null) {
      if (layer.length > rowID) {
        if (layer[rowID].length > colID) {
          int cellColor = layer[rowID][colID];
          fill(cellColor);
          rect(xPos, yPos, cellSize, cellSize);
        }
      }
    }
  }

  public Cell getCell(int xClicked, int yClicked) {
    xClicked = xClicked - x_pos;
    yClicked = yClicked - y_pos;

    int xAt = xClicked/cellSize;
    int yAt = yClicked / cellSize;

    return new Cell(yAt, xAt);
  }
  
  public Cell getXCell(int xClicked, int yClicked) {
    xClicked = xClicked - x_pos;
    yClicked = yClicked - y_pos;

    int xAt = xClicked/cellSize;
    int yAt = yClicked / cellSize;

    return new Cell(xAt);
  }

  public void addLayer(int[][] theLayer) {
    this.layer = theLayer;
  }
}
