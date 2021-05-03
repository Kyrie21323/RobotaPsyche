class FlowField {
  PVector[][] fieldR, fieldL, fieldRRim, fieldLRim;

  int g;
  int cols, rows;

  FlowField(int grid) {
    g = grid;
    cols = width/grid;
    rows = height/grid;

    fieldR = new PVector[cols][rows];
    fieldL = new PVector[cols][rows];
    fieldRRim = new PVector[cols][rows];
    fieldLRim = new PVector[cols][rows];

    rightTeamFF();
    leftTeamFF();
  }

  void rightTeamFF() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        float theta = random(PI*3/4, PI*5/4);
        //println(theta);
        fieldR[i][j] = PVector.fromAngle(theta);
      }
    }
  }
  void leftTeamFF() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        float theta = random(-PI/4, PI/4);
        //println(theta);
        fieldL[i][j] = PVector.fromAngle(theta);
      }
    }
  }
  //void rightTeamRF() {
  //  for (int i = 0; i < cols; i++) {
  //    for (int j = 0; j < rows/2; j++) {
  //      float theta = random();
  //      //println(theta);
  //      fieldR[i][j] = PVector.fromAngle(theta);
  //    }
  //    for (int j = 0; j < rows/2; j++) {

  //  }
  //}
  //void leftTeamRF() {
  //  for (int i = 0; i < cols; i++) {
  //    for (int j = 0; j < rows; j++) {
  //      float theta = random(-PI/4, PI/4);
  //      //println(theta);
  //      fieldL[i][j] = PVector.fromAngle(theta);
  //    }
  //  }
  //}

  PVector lookupR(PVector lookupr) {
    int column = int(constrain(lookupr.x/g, 0, cols-1));
    int row = int(constrain(lookupr.y/g, 0, rows-1));

    return fieldR[column][row].copy();
  }
  PVector lookupL(PVector lookupl) {
    int column = int(constrain(lookupl.x/g, 0, cols-1));
    int row = int(constrain(lookupl.y/g, 0, rows-1));

    return fieldL[column][row].copy();
  }

  void displayR() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {

        pushMatrix();
        translate(i*g, j*g);
        PVector f = fieldR[i][j];

        f.mult(g);
        ellipse(0, 0, 5, 5);
        stroke(255, 0, 0);
        line(0, 0, f.x, f.y);
        stroke(0, 0, 0);
        popMatrix();
      }
    }
  }
  void displayL() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {

        pushMatrix();
        translate(i*g, j*g);
        PVector f = fieldL[i][j];

        f.mult(g);
        ellipse(0, 0, 5, 5);
        stroke(0, 0, 255);
        line(0, 0, f.x, f.y);
        stroke(0, 0, 0);
        popMatrix();
      }
    }
  }
  //void displayRRim() {
  //  for (int i = 0; i < cols; i++) {
  //    for (int j = 0; j < rows; j++) {

  //      pushMatrix();
  //      translate(i*g, j*g);
  //      PVector f = fieldRRim[i][j];

  //      f.mult(g);
  //      ellipse(0, 0, 5, 5);
  //      stroke(0, 0, 255);
  //      line(0, 0, f.x, f.y);
  //      stroke(0, 0, 0);
  //      popMatrix();
  //    }
  //  }
  //}
}
