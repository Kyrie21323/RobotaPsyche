class Mice {
  Trap t;
  Cheese c;
  PVector location;
  PVector velocity;
  PVector acceleration;

  int r, g, b;
  boolean contactTrap, eatCheese;
  float maxforce;
  float maxspeed;
  int size;
  int count = 0;
  DNA dna;

  Mice(float x, float y, int size, int R, int G, int B) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(x, y);

    r = R;
    g = G;
    b = B;
    dna = new DNA(size, R, G, B);
    maxspeed = 15;
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
    fill(0, 0, 0);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    beginShape();
    tint(dna.getColorR(), dna.getColorG(), dna.getColorB());
    image(mice, 0, 0); 
    noTint();
    mice.resize(0, dna.getSize()*10);
    endShape(CLOSE);
    popMatrix();
  }

  boolean isDead() {
    contactTrap = false;
    for (Trap t : trapList) {
      if (abs(dist(t.getLocationX(), t.getLocationY(), location.x, location.y)) < 30) {
        contactTrap = true;
      }
    }
    return contactTrap;
  }

  boolean eatCheese() {
    eatCheese = false;
    for (Cheese c : cheese) {
      if (abs(dist(c.getLocationX(), c.getLocationY(), location.x, location.y)) < 40) {
        eatCheese = true;
      }
    }
    return eatCheese;
  }

  void distinguish () {
    float smellRange = 300;
    PVector sum = new PVector(0, 0);

    for (Cheese c : cheese) {
      for (Mice m : mouseList) {
        float distance = abs(PVector.dist(c.location, m.location));

        if ((distance > 0) && (distance < smellRange)) {
          PVector difference = PVector.sub(c.location, m.location);
          difference.normalize();
          sum.add(difference);
          sum.setMag(maxspeed);

          PVector steer = PVector.sub(sum, velocity);
          steer.limit(maxforce);
          applyForce(steer);
        }
      }
    }
  }

  DNA getDNA() {
    return(dna.getDNA());
  }
}
