
import java.util.ArrayList;

//SoundFile file;
Board theBoard;
BoardItem item1;
TriangleItem triangle;
Sticky guy;
BlackChecker blackChecker;
RedChecker   redChecker;


boolean blackMoveRight = false;//
boolean blackMoveLeft = false;//
boolean blackTurn = true;//
boolean blackReady;//
boolean blackKillLeft;//
boolean blackKillRight;//

boolean redMoveRight = false;//
boolean redMoveLeft = false;//
boolean redTurn = false;//
boolean redReady;
boolean redKillLeft;
boolean redKillRight;

int diff = 0;
int outCol = 10;

ArrayList<BlackChecker> bCheckers = new ArrayList<BlackChecker>();
ArrayList<RedChecker>   rCheckers = new ArrayList<RedChecker>();
ArrayList<GreenSquare> greenSquares = new ArrayList<GreenSquare>();
ArrayList<RedChecker> rSelected = new ArrayList<RedChecker>();

GreenSquare leftSquare;
GreenSquare rightSquare;

int[][] layer = {
  {125, 125, 125, 125, 125, 125, 125, 125, 125, 125}, 
  {100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100}, 
  {75, 75, 75, 75, 75, 75, 75, 75, 75, 75}
};


void setup() {

  size(640, 640);

  theBoard = new Board(width + (-width) + 64, height +(-height) + 64, 8, 8, 64);

  item1 = new BoardItem(2, 5);
  triangle = new TriangleItem(3, 8);
  guy = new Sticky(2, 5);
  //bChecker = new BlackChecker(0, 4);


  //Setting up black checkers



  int col = 1;
  int col2 = 0;
  int col3 = 1;


  int col4 = 0;
  int col5 = 1;
  int col6 = 0;




  int[][] bCheckerData = 
    {{0}};
  for (int i = 0; i < 4; i++) {
    bCheckers.add(new BlackChecker(0, col));
    bCheckers.get(i).setData(bCheckerData);
    theBoard.addItem(bCheckers.get(i));
    col+=2;
  }
  for (int i = 4; i < 8; i++) {
    bCheckers.add(new BlackChecker(1, col2));
    bCheckers.get(i).setData(bCheckerData);
    theBoard.addItem(bCheckers.get(i));
    col2+=2;
  }
  for (int i = 8; i < 12; i++) {
    bCheckers.add(new BlackChecker(2, col3));
    bCheckers.get(i).setData(bCheckerData);
    theBoard.addItem(bCheckers.get(i));
    col3+=2;
  }



  //setting up red checkers
  int[][] rCheckerData = 
    {{0}};
  for (int i = 0; i < 4; i++) {
    rCheckers.add(new RedChecker(5, col4));
    rCheckers.get(i).setData(rCheckerData);
    theBoard.addItem(rCheckers.get(i));
    col4+=2;
  }
  for (int i = 4; i < 8; i++) {
    rCheckers.add(new RedChecker(6, col5));
    rCheckers.get(i).setData(rCheckerData);
    theBoard.addItem(rCheckers.get(i));
    col5+=2;
  }
  for (int i = 8; i < 12; i++) {
    rCheckers.add(new RedChecker(7, col6));
    rCheckers.get(i).setData(rCheckerData);
    theBoard.addItem(rCheckers.get(i));
    col6+=2;
  }





  //int[][]item1Data = 
  //  {{-1, 0, -1}, 
  //  {0, 0, 0}, 
  //  {-1, 0, -1}};
  //int[][] triangleData = 
  //  {{-1, 0, -1}, 
  //  { 0, 0, 0}, 
  //  {-1, 0, -1}};
  int[][] guyData = 
    {{255, 255, 255}, 
    {255, 255, 255}};







  //item1.setData(item1Data);
  //theBoard.addItem(item1);

  //triangle.setData(triangleData);
  //theBoard.addItem(triangle);

  guy.setData(guyData);
  theBoard.addItem(guy);
}

void draw() {
  background(255);
  theBoard.show();
}

int[][] greenSquareData = 
  {{0}, 
  {0}};



void mousePressed() {
  Cell clicked = theBoard.getCell(mouseX, mouseY);
  //println(clicked);
  //BlackChecker r = new BlackChecker(0,1);
  //theBoard.removeItem(r);
  //if(true)
  //  return;

  //mouseX, mouseY
  //theBoard.getCell(mouseX, mouseY).colID() - 3, theBoard.getCell(mouseX, mouseY).rowID() +2)
  println(theBoard.getCell(mouseX, mouseY));
  //Cell c = theBoard.getCell(mouseX, mouseY);
  //println("blackMoveRight is: " + blackMoveRight);
  //c.rowID()/colID
  //println(greenSquares.size());

  //redCells = new ArrayList<Cell>();
  //for (int k = 0; k < rCheckers.size(); k++) {
  //  redCells.add(new Cell(rCheckers.get(k).row(), rCheckers.get(k).col()));
  //}


  boolean leftPath = true;
  boolean rightPath = true;
  boolean lSquareThere;
  boolean rSquareThere;



  if (blackTurn) {
    redTurn = false;
    redMoveRight = false;
    redMoveLeft = false;
    redReady = false;
    redKillLeft = false;
    redKillRight = false;

    for (int i = 0; i < bCheckers.size(); i++) {
      if ((clicked.colID() == bCheckers.get(i).col() && clicked.rowID() == bCheckers.get(i).row()) ) {
        blackChecker = bCheckers.get(i);
        blackReady = true;
        println("bChecker col: " + blackChecker.col() + " bChecker row: " + blackChecker.row());

        for (int j = 0; j < bCheckers.size(); j++) {

          theBoard.removeItem(leftSquare);
          theBoard.removeItem(rightSquare);
          //move right
          if ((blackChecker.col() + 1  == bCheckers.get(j).col() && blackChecker.row() + 1  == bCheckers.get(j).row())) {
            rightPath = false;
            if (clicked.colID() + 1 == 8) {
              rightPath = false;
            }
          }

          //move left
          if ((blackChecker.col() - 1  ==  bCheckers.get(j).col() && blackChecker.row() + 1  ==  bCheckers.get(j).row())) {
            leftPath = false;
            if (clicked.colID() == 0) {
              leftPath = false;
            }
          }
          if (leftPath) {
            if (clicked.colID() !=0) {
              leftSquare = new GreenSquare(clicked.rowID() + 1, clicked.colID() - 1);
              leftSquare.setData(greenSquareData);
              theBoard.addItem(leftSquare);
            }
            if (bCheckers.size() > rCheckers.size()) {
              diff = bCheckers.size() - rCheckers.size();
              if (diff <= j) {
                if (leftSquare != null && leftSquare.rowID == rCheckers.get(j-diff).row() && leftSquare.colID == rCheckers.get(j-diff).col()) {
                  blackKillLeft = true;
                  blackMoveRight = false;
                  redChecker = rCheckers.get(j-diff);
                }
              }
            } else {
              if (leftSquare != null && leftSquare.rowID == rCheckers.get(j).row() && leftSquare.colID == rCheckers.get(j).col()) {
                blackKillLeft = true;
                blackMoveRight = false;
                redChecker = rCheckers.get(j);
              }
            }
          }

          if (rightPath) {
            if (clicked.colID() + 1 != 8) {
              rightSquare = new GreenSquare(clicked.rowID() + 1, clicked.colID() + 1);
              rightSquare.setData(greenSquareData);
              theBoard.addItem(rightSquare);
            }
            if (bCheckers.size() > rCheckers.size()) {
              diff = bCheckers.size() - rCheckers.size();
              if (diff <=j) {
                if (rightSquare != null &&rightSquare.rowID == rCheckers.get(j-diff).row() && rightSquare.colID == rCheckers.get(j-diff).col()) {
                  blackKillRight = true;
                  blackMoveLeft = false;
                  redChecker = rCheckers.get(j-diff);
                }
              }
            } else {
              if (rightSquare != null &&rightSquare.rowID == rCheckers.get(j).row() && rightSquare.colID == rCheckers.get(j).col()) {
                blackKillRight = true;
                blackMoveLeft = false;
                redChecker = rCheckers.get(j);
              }
            }
          }
        }//END OF LOOP "j"
      } else if (blackReady && (clicked.colID() == leftSquare.col() && clicked.rowID() == leftSquare.row())) {
        blackMoveLeft = true;
      } else if (blackReady && (clicked.colID() == rightSquare.col() && clicked.rowID() == rightSquare.row()) ) {
        blackMoveRight = true;// <-- if gate at top
      }
    }//END OF LOOP "i"
    if (!blackKillRight && blackMoveRight) {
      blackChecker.setRow(rightSquare.row());
      blackChecker.setCol(rightSquare.col());
      theBoard.addItem(blackChecker);
      theBoard.removeItem(leftSquare);
      theBoard.removeItem(rightSquare);
      blackTurn = false;
      redTurn = true;
    } else if (blackKillRight && blackMoveRight) {
      blackChecker.setRow(redChecker.row() + 1);
      blackChecker.setCol(redChecker.col() + 1);
      theBoard.addItem(blackChecker);
      theBoard.removeItem(leftSquare);
      theBoard.removeItem(rightSquare);
      redChecker.setRow(5);
      redChecker.setCol(outCol);
      outCol++;
      theBoard.removeItem(redChecker);
      rCheckers.remove(redChecker);
      blackTurn = false;
      redTurn = true;
    }
  }
  //println("blackMoveLeft is " + blackMoveLeft);
  if (!blackKillLeft && blackMoveLeft) {
    blackChecker.setRow(leftSquare.row());
    blackChecker.setCol(leftSquare.col());
    theBoard.addItem(blackChecker);
    theBoard.removeItem(leftSquare);
    theBoard.removeItem(rightSquare);
    blackTurn = false;
    redTurn = true;
  } else if (blackKillLeft && blackMoveLeft) {

    blackChecker.setRow(redChecker.row() + 1);
    blackChecker.setCol(redChecker.col() - 1);
    theBoard.addItem(blackChecker);
    theBoard.removeItem(leftSquare);
    theBoard.removeItem(rightSquare);
    redChecker.setRow(5);
    redChecker.setCol(outCol);
    outCol++;
    theBoard.removeItem(redChecker);
    println("removing red checker: " + redChecker);
    rCheckers.remove(redChecker);
    blackTurn = false;
    redTurn = true;
  }




  if (redTurn) {
    blackTurn = false;
    blackMoveRight = false;//
    blackMoveLeft = false;//
    blackReady = false;//
    blackKillLeft = false;//
    blackKillRight = false;//
    for (int i = 0; i < rCheckers.size(); i++) {
      if ((clicked.colID() == rCheckers.get(i).col() && clicked.rowID() == rCheckers.get(i).row()) ) {
        redChecker = rCheckers.get(i);
        redReady = true;
        println("bChecker col: " + redChecker.col() + " bChecker row: " + redChecker.row());

        for (int j = 0; j < rCheckers.size(); j++) {

          theBoard.removeItem(leftSquare);
          theBoard.removeItem(rightSquare);
          //move right
          if ((redChecker.col() + 1  == rCheckers.get(j).col() && redChecker.row() - 1  == rCheckers.get(j).row())) {
            rightPath = false;
            if (clicked.colID() + 1 == 8) {
              rightPath = false;
            }
          }

          //move left
          if ((redChecker.col() - 1  ==  rCheckers.get(j).col() && redChecker.row() - 1  ==  rCheckers.get(j).row())) {
            leftPath = false;
            if (clicked.colID() == 0) {
              leftPath = false;
            }
          }

          if (leftPath) {
            if (clicked.colID() !=0) {
              leftSquare = new GreenSquare(clicked.rowID() - 1, clicked.colID() - 1);
              leftSquare.setData(greenSquareData);
              theBoard.addItem(leftSquare);
            }
            if (rCheckers.size() > bCheckers.size()) {
              diff = rCheckers.size() - bCheckers.size();
              if (diff <= j) {
                if (leftSquare != null && leftSquare.rowID == bCheckers.get(j-diff).row() && leftSquare.colID == bCheckers.get(j-diff).col()) {
                  redKillLeft = true;
                  blackChecker = bCheckers.get(j-diff);
                }
              }
            } else {
              if (leftSquare != null && leftSquare.rowID == bCheckers.get(j).row() && leftSquare.colID == bCheckers.get(j).col()) {
                redKillLeft = true;
                blackChecker = bCheckers.get(j);
              }
            }
          }
          if (rightPath) {
            if (clicked.colID() + 1 != 8) {
              rightSquare = new GreenSquare(clicked.rowID() - 1, clicked.colID() + 1);
              rightSquare.setData(greenSquareData);
              theBoard.addItem(rightSquare);
            }
            if (rCheckers.size() > bCheckers.size()) {
              diff = rCheckers.size() - bCheckers.size();
              if (diff <= j) {
                if (rightSquare != null && rightSquare.rowID == bCheckers.get(j-diff).row() && rightSquare.colID == bCheckers.get(j-diff).col()) {
                  redKillRight = true;
                  blackChecker = bCheckers.get(j-diff);
                }
              }
            } else { 
              if (rightSquare != null && rightSquare.rowID == bCheckers.get(j).row() && rightSquare.colID == bCheckers.get(j).col()) {
                redKillRight = true;
                blackChecker = bCheckers.get(j);
              }
            }
          }
        }//END OF LOOP "j"
      } else if (redReady && (clicked.colID() == leftSquare.col() && clicked.rowID() == leftSquare.row())) {
        redMoveLeft = true;
      } else if (redReady && (clicked.colID() == rightSquare.col() && clicked.rowID() == rightSquare.row()) ) {
        redMoveRight = true;// <-- if gate at top
      }
    }//END OF LOOP "i"

    if (!redKillRight && redMoveRight) {
      redChecker.setRow(rightSquare.row());
      redChecker.setCol(rightSquare.col());
      theBoard.addItem(redChecker);
      theBoard.removeItem(leftSquare);
      theBoard.removeItem(rightSquare);
      redTurn = false;
      blackTurn = true;
    } else if (redKillRight && redMoveRight) {    
      redChecker.setRow(blackChecker.row() - 1);
      redChecker.setCol(blackChecker.col() + 1);
      theBoard.addItem(redChecker);
      theBoard.removeItem(leftSquare);
      theBoard.removeItem(rightSquare);
      blackChecker.setRow(5);
      blackChecker.setCol(outCol);
      outCol++;
      theBoard.removeItem(blackChecker);
      bCheckers.remove(blackChecker);
      redTurn = false;
      blackTurn = true;
    }

    if (!redKillLeft && redMoveLeft) {
      redChecker.setRow(leftSquare.row());
      redChecker.setCol(leftSquare.col());
      theBoard.addItem(redChecker);
      theBoard.removeItem(leftSquare);
      theBoard.removeItem(rightSquare);
      redTurn = false;
      blackTurn = true;
    } else if (redKillLeft && redMoveLeft) {
      redChecker.setRow(blackChecker.row() - 1);
      redChecker.setCol(blackChecker.col() - 1);
      theBoard.addItem(redChecker);
      theBoard.removeItem(leftSquare);
      theBoard.removeItem(rightSquare);
      blackChecker.setRow(5);
      blackChecker.setCol(outCol);
      outCol++;
      theBoard.removeItem(blackChecker);
      bCheckers.remove(blackChecker);
      redTurn = false;
      blackTurn = true;
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      guy.updateRow(-1);
      theBoard.addItem(guy);
    } else if (keyCode == DOWN) {
      guy.updateRow(1);
      theBoard.addItem(guy);
    } else if (keyCode == LEFT) {
      guy.updateCol(-1);
      theBoard.addItem(guy);
    } else if (keyCode == RIGHT) {
      guy.updateCol(1);
      theBoard.addItem(guy);
    }
  }
}
