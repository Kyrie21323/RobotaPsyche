class Mice {
  PVector location;
  PVector velocity;
  PVector acceleration;

  float maxforce;
  float maxspeed;
  int miceSize;
  int size;
  int count = 0;
  DNA dna;

  Mice(float x, float y, int size) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(x, y);

    dna = new DNA(size);
    maxspeed = 10;
    maxforce = 5;
    count+=1;
  }

  float getLocationX() {
    float locX = location.x;
    return locX;
  }

  float getLocationY() {
    float locY = location.y;
    return locY;
  }

  int getMiceNum() {
    return count;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
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
    int SIZE = dna.getSize();
    //print(SIZE);
    if (SIZE == 0) {
      size = 5;
    } else if (SIZE == 1) {
      size = 10;
    } else if (SIZE == 2) {
      size = 20;
    }
    float theta = velocity.heading() + PI/2;
    fill(0, 0, 0);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape();
    vertex(0, -size);
    vertex(-size, size);
    vertex(size, size);
    endShape(CLOSE);
    popMatrix();
  }

  //void getFishSize() {
  //  miceSize = dna.getSize();
  //}

  //void distinguish (ArrayList<Cheese> cheese, ArrayList<Mice> mice) {
  //  float smellRange = 1000;
  //  PVector sum = new PVector(0, 0);

  //  for (Cheese smell : cheese) {
  //    for (Mice follow : mice) {
  //    float distance = abs(PVector.dist(smell.location, follow.location));

  //    if ((distance > 0) && (distance < smellRange)) {
  //      PVector difference = PVector.sub(smell.location, follow.location);
  //      difference.normalize();
  //      sum.add(difference);
  //      sum.setMag(maxspeed);

  //      PVector steer = PVector.sub(sum, velocity);
  //      steer.limit(maxforce);
  //      applyForce(steer);
  //    }
  //  }
  //}
  //}
}
