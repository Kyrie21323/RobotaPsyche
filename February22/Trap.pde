class Trap {
  int traps [][];
  int g;
  int cols, rows;

  Trap(int grid) {
    g = grid;
    cols = width/grid;
    rows = height/grid;

    randomTrap();
  }

  void randomTrap() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        int check = int(random(0, 3));
        if (check == 0) {
          fill(255, 100, 100, 50);
          rect(i*g, j*g, g, g);
          //traps [i][j] = 1;
        } else {
          fill(255, 255, 255, 50);
          rect(i*g, j*g, g, g);
          //traps [i][j] = 0;
        }
        //print(traps [i][j]);
      }
    }
  }
}
