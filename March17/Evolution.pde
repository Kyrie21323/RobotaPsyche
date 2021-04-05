FlowField f;
Mice m;
Cheese c;
Trap t;

PImage trap, noTrap, mice, cheesePic;

boolean noMice = false;

ArrayList<Mice> mouseList = new ArrayList<Mice>();
ArrayList<Cheese> cheese = new ArrayList<Cheese>();
ArrayList<Trap> trapList = new ArrayList<Trap>();

void setup() {
  size(1300, 800);
  trap = loadImage("trap.jpg");
  noTrap = loadImage("noTrap.jpg");
  mice = loadImage("mice.png");
  cheesePic = loadImage("cheese.png");
  f = new FlowField(20);
  for (int i = 0; i < 10; i++) {
    trapList.add(new Trap((50), int(random(0, 1300)), int(random(0, 800))));
  }
  for (int i = 0; i < 1; i++) {
    mouseList.add(new Mice(int(random(0, 1300)), int(random(0, 800)), int(random(1, 7)), int(random(200, 255)), int(random(200, 255)), int(random(200, 255))));
  }
  cheese.add(new Cheese(random(0, 1300), random(0, 800)));
}

void mouseClicked() {
  for (int i = 0; i < 5; i++) {
    mouseList.add(new Mice(int(random(0, 1300)), int(random(0, 800)), int(random(1, 7)), int(random(200, 255)), int(random(200, 255)), int(random(200, 255))));
  }
}

void draw() {
  background(255);

  for (Trap t : trapList) {
    t.display();
  }

  fill(255, 255, 255, 0);
  rect(0, 0, 1300, 800);
  f.perlinFlowField();
  f.display();

  for (int i = mouseList.size()-1; i>=0; i--) {

    Mice m = mouseList.get(i);

    m.follow(f);
    m.update();
    m.checkEdges();
    m.display();
    m.distinguish();

    if (m.eatCheese()) {
      DNA dna = m.getDNA();
      println("ate cheese");
      for (int j = 0; j < 20; j++) {
        mouseList.add(new Mice(int(random(0, 1300)), int(random(0, 800)), dna.miceSize, dna.colorR, dna.colorG, dna.colorB));
      }
    }

    if (m.isDead() || m.eatCheese()) {
      mouseList.remove(m);
    }
  }

  for (Cheese c : cheese) {
    c.display();
  }
}
