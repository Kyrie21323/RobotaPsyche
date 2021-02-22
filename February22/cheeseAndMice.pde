

FlowField f;
Vehicle v;
Trap t;
Cheese c;

ArrayList<Vehicle> vehicles = new ArrayList<Vehicle>();
ArrayList<Cheese> cheese = new ArrayList<Cheese>();


void setup() {
  size(1300, 800);
  f = new FlowField(20);
  t = new Trap(20);
  cheese.add(new Cheese(random(0, 1300), random(0, 800)));

  vehicles.add(new Vehicle(width/2, height/2));
}

void mouseClicked() {
  vehicles.add(new Vehicle(random(0, 1300), random(0, 800)));
}

void draw() {
  background(255);
  fill(255, 255, 255, 0);
  rect(0, 0, 1300, 800);
  f.perlinFlowField();
  f.display();

  for (Vehicle v : vehicles) {
    v.follow(f);
    v.update();
    v.checkEdges();
    v.display();
    v.getDNA();
    v.distinguish(vehicles, cheese);
  }
  for (Cheese c : cheese) {
    c.display();
  }
}
