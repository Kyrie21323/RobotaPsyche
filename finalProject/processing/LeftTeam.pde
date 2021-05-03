class LeftTeam {
  PVector location;
  PVector velocity;
  PVector acceleration;

  float maxforce;
  float maxspeed;
  //int count = 0;

  boolean ifDefend = false;

  LeftTeam(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(x, y);

    maxspeed = 5;
    maxforce = 20;
  }

  void reset() {
    acceleration.set(0, 0);
    velocity.set(0, 0);
  }

  void nextGame() {
    ifDefend = false;
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

    for (Ball b : ball) {
      if (b.touchRT() && !b.touchLT()) {
        ifDefend = true;
      } else {
        ifDefend = false;
      }
    }
  }

  // maybe check edges?

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  //void seek(PVector target) {
  //  PVector desired = PVector.sub(target, location);
  //  desired.normalize();
  //  desired.mult(maxspeed);
  //  PVector steer = PVector.sub(desired, velocity);
  //  steer.limit(maxforce);
  //  applyForce(steer);
  //}

  void follow(FlowField flow) {
    if (!ifDefend) {
      reset();
      //println("blue follows flowfield");
      PVector desired1 = flow.lookupL(location);
      desired1.mult(2);

      PVector steer1 = PVector.sub(desired1, velocity);
      steer1.limit(3);
      applyForce(steer1);
    }

    //towards the ball -> but then this happens when they are defending
    if (ifDefend) {
      reset();
      //println("blue follows ball");
      float help = 1000;
      PVector sum = new PVector(0, 0);

      for (Ball b : ball) {
        float distance = abs(PVector.dist(b.location, location));

        if ((distance > 0) && (distance < help)) {
          PVector difference = PVector.sub(b.location, location);
          difference.normalize();
          sum.add(difference);
          sum.setMag(maxspeed);

          PVector steer2 = PVector.sub(sum, velocity);
          steer2.limit(maxforce);
          applyForce(steer2);
        }
      }
    }
    // towards rim
  }

  void display() {
    fill(0, 0, 255);
    stroke(0);
    circle(location.x, location.y, 30);
  }
}
