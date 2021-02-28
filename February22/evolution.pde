
PImage trap, noTrap;
int g;
int cols, rows;
int check;
PImage[][] wholeTrap;

void trap(int grid) {
  g = grid;
  cols = width/grid;
  rows = height/grid;
  wholeTrap = new PImage[cols][rows];

  randomTrap();
}

void randomTrap() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      check = int(random(0, 3));
      if (check == 0) {
        wholeTrap[i][j] = trap;
      } else {
        wholeTrap[i][j] = noTrap;
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



FlowField f;
Mice m;
Cheese c;

ArrayList<Mice> mouse = new ArrayList<Mice>();
ArrayList<Cheese> cheese = new ArrayList<Cheese>();


void setup() {
  size(1300, 800);
  trap = loadImage("trap.jpg");
  noTrap = loadImage("noTrap.jpg");
  f = new FlowField(20);
  trap(20);
  mouse.add(new Mice(random(0, 1300), random(0, 800), int(random(0,3))));
  cheese.add(new Cheese(random(0, 1300), random(0, 800)));
}

void mouseClicked() {
  mouse.add(new Mice(random(0, 1300), random(0, 800), int(random(0,3))));
}

void draw() {
  background(255);
  displayTrap();
  fill(255, 255, 255, 0);
  rect(0, 0, 1300, 800);
  f.perlinFlowField();
  f.display();

  for (Mice m : mouse) {
    m.follow(f);
    m.update();
    m.checkEdges();
    m.display();
    //m.
    //m.distinguish(cheese, mouse);
  }
  
  for (Cheese c : cheese) {
    c.display();
  }
}
