FlowField f;
Mice m;
Cheese c;

PImage trap, noTrap;
int g;
int cols, rows;
int check;
PImage[][] wholeTrap;
boolean[][] ifTrap;
int[][] checkTrapX;
int[][] checkTrapY;

ArrayList<Mice> mouse = new ArrayList<Mice>();
ArrayList<Cheese> cheese = new ArrayList<Cheese>();

void trap(int grid) {
  g = grid;
  cols = width/grid;
  rows = height/grid;
  wholeTrap = new PImage[cols][rows];
  ifTrap = new boolean[cols][rows];
  checkTrapX = new int[cols][rows];
  checkTrapY = new int[cols][rows];

  randomTrap();
}

void randomTrap() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      check = int(random(0, 10));
      if (check == 0) {
        wholeTrap[i][j] = trap;
        ifTrap[i][j] = true;
        checkTrapX[i][j] = i+1;
        checkTrapY[i][j] = j+1;
      } else {
        wholeTrap[i][j] = noTrap;
        ifTrap[i][j] = false;
        checkTrapX[i][j] = 0;
        checkTrapY[i][j] = 0;
      }
    }
  }
}

void killMice() {
  for (Mice m : mouse) {
    float locX = m.getLocationX();
    float locY = m.getLocationY();
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        if (ifTrap[i][j] == true) {
          if ((checkTrapX[i][j]-1)*g < locX && locX < checkTrapX[i][j]*g && (checkTrapY[i][j]-1)*g < locY && locY < checkTrapY[i][j]*g) {
            mouse.remove(m.getMiceNum());
          }
        }
      }
    }
  }
}

void displayTrap() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      image(wholeTrap[i][j], i*g, j*g);
    }
  }
}

void setup() {
  size(1300, 800);
  trap = loadImage("trap.jpg");
  noTrap = loadImage("noTrap.jpg");
  f = new FlowField(20);
  //t.trap(20);
  trap(20);
  mouse.add(new Mice(random(0, 1300), random(0, 800), int(random(0, 3))));
  cheese.add(new Cheese(random(0, 1300), random(0, 800)));
}

void mouseClicked() {
  mouse.add(new Mice(random(0, 1300), random(0, 800), int(random(0, 3))));
}

void draw() {
  background(255);
  displayTrap();
  fill(255, 255, 255, 0);
  rect(0, 0, 1300, 800);
  f.perlinFlowField();
  f.display();

  killMice();

  for (Mice m : mouse) {
    m.follow(f);
    m.update();
    m.checkEdges();
    m.display();
    killMice();
    //m.distinguish(cheese, mouse);
  }

  for (Cheese c : cheese) {
    c.display();
  }
}
