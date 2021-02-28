class Mice {
  PVector location;
  PVector velocity;
  PVector acceleration;

  float r;
  float maxforce;
  float maxspeed;
  DNA dna;

  Mice(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(x, y);
    r = 5.0;

    maxspeed = 10;
    maxforce = 5;
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
    float theta = velocity.heading() + PI/2;
    fill(255, 0, 0);
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

  void distinguish (ArrayList<Mice> Mice, ArrayList<Cheese> cheese) {
    float smellRange = 300;
    int count = 0;
    PVector sum = new PVector(0, 0);

    for (Cheese smell : cheese) {
      float distance = PVector.dist(location, smell.location);

      if ((distance > 0) && (distance < smellRange)) {
        //PVector desired = smell.lookup(location);
        //desired.mult(maxspeed);

        //PVector steer = PVector.sub(desired, velocity);
        //steer.limit(maxforce);
        //applyForce(steer);
        //
        PVector difference = PVector.sub(location, smell.location);
        difference.normalize();
        sum.add(difference);
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);

      sum.setMag(maxspeed);

      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      applyForce(steer);
    }
  }

  void getDNA() {
    print(dna.getShape());
    //print(dna.getColor());
  }
}
