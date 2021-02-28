FlowField f;
Mice m;
Trap t;
Cheese c;

ArrayList<Mice> mouse = new ArrayList<Mice>();
ArrayList<Cheese> cheese = new ArrayList<Cheese>();


void setup() {
  size(1300, 800);
  f = new FlowField(20);
  //t = new Trap(20);
  cheese.add(new Cheese(random(0, 1300), random(0, 800)));

  mouse.add(new Mice(width/2, height/2));
}

void mouseClicked() {
  mouse.add(new Mice(random(0, 1300), random(0, 800)));
}

void draw() {
  background(255);
  t = new Trap(20);
  fill(255, 255, 255, 0);
  rect(0, 0, 1300, 800);
  f.perlinFlowField();
  f.display();

  for (Mice m : mouse) {
    m.follow(f);
    m.update();
    m.checkEdges();
    m.display();
    m.getDNA();
    m.distinguish(mouse, cheese);
  }
  for (Cheese c : cheese) {
    c.display();
  }
}
