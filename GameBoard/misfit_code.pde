//if (redTurn) {
//    for (int i = 0; i < rCheckers.size(); i++) {
//      if ((clicked.colID() == rCheckers.get(i).col() && clicked.rowID() == rCheckers.get(i).row()) ) {
//        redChecker = rCheckers.get(i);
//        redReady = true;
//        println("bChecker col: " + redChecker.col() + " bChecker row: " + redChecker.row());

//        for (int j = 0; j < rCheckers.size(); j++) {

//          theBoard.removeItem(leftSquare);
//          theBoard.removeItem(rightSquare);
//          //move right
//          if (redChecker.col() + 1  == rCheckers.get(j).col() && redChecker.row() + 1  == rCheckers.get(j).row()) {
//            rightPath = false;
//            if (clicked.colID() + 1 == 8) {
//              rightPath = false;
//            }
//          }

//          //move left
//          if (redChecker.col() - 1  ==  rCheckers.get(j).col() && redChecker.row() + 1  ==  rCheckers.get(j).row()) {
//            leftPath = false;
//            if (clicked.colID() == 0) {
//              leftPath = false;
//            }
//          }



//          if (leftPath) {
//            if (clicked.colID() !=0) {
//              leftSquare = new GreenSquare(clicked.rowID() + 1, clicked.colID() - 1);
//              leftSquare.setData(greenSquareData);
//              theBoard.addItem(leftSquare);
//            }
//          }
//          if (rightPath) {
//            if (clicked.colID() + 1 != 8) {
//              rightSquare = new GreenSquare(clicked.rowID() + 1, clicked.colID() + 1);
//              rightSquare.setData(greenSquareData);
//              theBoard.addItem(rightSquare);
//            }
//          }
//        }

//        /* 
//         END OF FOR LOOP "j"
//         */
//      } else if (redReady && (clicked.colID() == leftSquare.col() && clicked.rowID() == leftSquare.row())) {
//        redMoveLeft = true;
//      } else if (redReady && (clicked.colID() == rightSquare.col() && clicked.rowID() == rightSquare.row()) ) {
//        redMoveRight = true;// <-- if gate at top
//      }
//      //else {
//      //  redReady = false;
//      //}
//      //println("redMoveRight is " + redMoveRight);
//    }//END OF LOOP "i"
//    if (redMoveRight) {
//      redChecker.setRow(rightSquare.row());
//      redChecker.setCol(rightSquare.col());
//      theBoard.addItem(redChecker);
//      println("right rChecker row: " + redChecker.row() + " rChecker col: " + redChecker. col());
//      redTurn = false;
//      blackTurn = true;
//    }
//    //println("redMoveLeft is " + redMoveLeft);
//    if (redMoveLeft) {
//      redChecker.setRow(leftSquare.row());
//      redChecker.setCol(leftSquare.col());
//      theBoard.addItem(redChecker);
//      println("left rChecker row: " + redChecker.row() + " rChecker col: " + redChecker. col());
//      redTurn = false;
//      blackTurn = true;
//    }
//  }

  
