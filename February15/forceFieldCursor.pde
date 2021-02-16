
class FlowField {
  PVector[][] field;
  int g;
  int cols, rows;

  FlowField(int grid) {
    g = grid;
    cols = width/grid;
    rows = height/grid;

    field = new PVector[cols][rows];

    cursorFlowField();
  }

  void cursorFlowField() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        PVector mouse = new PVector(mouseX, mouseY);
        PVector location = new PVector(i*g, j*g);
        PVector finalVec = PVector.sub(mouse, location);

        //float xVec= mouseX-(i*g);
        //float yVec = mouseY-(j*g);
        finalVec.normalize();
        field[i][j] = finalVec;
      }
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
        print("col " + i + " row " + j + "  ");
        println(i*g, j*g, field[i][j].x, field[i][j].y);
        //float angle = field[i][j].heading();

        pushMatrix();
        translate(i*g, j*g);
        PVector f = field[i][j];

        f.mult(g);
        //rotate(angle);
        line(0, 0, f.x, f.y);
        ellipse(f.x, f.y, 5, 5);
        popMatrix();
      }
    }
  }
}


class Vehicle {
  PVector location;
  PVector velocity;
  PVector acceleration;

  float r;
  float maxforce;
  float maxspeed;

  Vehicle(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(x, y);
    r = 3.0;

    maxspeed = 10;
    maxforce = 0.01;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }

  void follow(FlowField flow) {
    PVector desired = flow.lookup(location);
    desired.mult(maxspeed);

    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }

  void display() {
    float theta = velocity.heading() + PI/2;
    fill(200);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }
}

FlowField f;
Vehicle v;

ArrayList<Vehicle> vehicles = new ArrayList<Vehicle>();

void setup() {
  size(1300, 800);
  f = new FlowField(50);

  vehicles.add(new Vehicle(width/2, height/2));
  //v = new Vehicle(width/2, height/2);
}

void mouseClicked() {
  vehicles.add(new Vehicle(mouseX, mouseY));
}

void draw() {
  background(255);
  f.cursorFlowField();
  f.display();

  for (Vehicle v : vehicles) {
    v.follow(f);
    v.update();
    v.display();
  }
}
