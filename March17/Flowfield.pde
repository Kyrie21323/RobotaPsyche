class FlowField {
  PVector[][] field;

  int g;
  int cols, rows;

  FlowField(int grid) {
    g = grid;
    cols = width/grid;
    rows = height/grid;

    field = new PVector[cols][rows];

    randomFlowField();
  }


  void randomFlowField() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        field[i][j] = PVector.random2D();
      }
    }
  }

  void perlinFlowField() {

    float xoff = 0;
    for (int i = 0; i < cols; i++) {
      float yoff = 0;
      for (int j = 0; j < rows; j++) {
        float theta = map(noise(xoff, yoff), 0, 1, 0, TWO_PI);
        field[i][j] = new PVector(cos(theta), sin(theta));
        yoff += 0.1;
      }
      xoff += 0.1;
    }
  }

  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/g, 0, cols-1));
    int row = int(constrain(lookup.y/g, 0, rows-1));

    return field[column][row].copy();
  }

  void display() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        float angle = field[i][j].heading();

        pushMatrix();
        translate(i*g, j*g);
        PVector f = field[i][j];

        f.mult(g);
        rotate(angle);
        line(0, 0, f.x, f.y);
        ellipse(f.x, f.y, 5, 5);
        popMatrix();
      }
    }
  }
}
