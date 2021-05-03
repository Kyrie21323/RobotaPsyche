class Ball {
  LeftTeam lt;
  RightTeam rt;

  PVector location;
  PVector velocity;
  PVector acceleration;

  float r;
  float maxforce;
  float maxspeed;

  int temp = int(random(0, 2));

  boolean ifTouchRT = false;
  boolean ifTouchLT = false;
  boolean ifRTScore = false;
  boolean ifLTScore = false;

  Ball() {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(650, 400);
    maxspeed = 5;
    maxforce = 10;
  }

  float getLocationX() {
    float locX = location.x;
    return locX;
  }

  float getLocationY() {
    float locY = location.y;
    return locY;
  }

  boolean touchRT() {
    for (RightTeam rt : rtplayers) {
      if (abs(location.x - rt.getLocationX()) <= 40 && abs(location.y - rt.getLocationY()) <= 40) {
        ifTouchRT = true; 
        //println("right touch", ifTouchRT);
      }
    }
    return ifTouchRT;
  }

  boolean touchLT() {
    for (LeftTeam lt : ltplayers) {
      if (abs(location.x - lt.getLocationX()) <= 40 && abs(location.y - lt.getLocationY()) <= 40) {
        ifTouchLT = true; 
        //println("left touch", ifTouchLT);
      }
    }
    return ifTouchLT;
  }

  int sendRTScore() {
    return rtScore;
  }
  
  int sendLTScore() {
    return ltScore;
  }

  void nextGame() {
    ifTouchRT = false;
    ifTouchLT = false;
    ifRTScore = false;
    ifLTScore = false;
  }

  void scoreCheck() {
    Rim leftRim = rim.get(0);
    Rim rightRim = rim.get(1);
    if (abs(location.x - leftRim.getLocationX()) <= 30 && abs(location.y - leftRim.getLocationY()) <= 30) {
      ifLTScore = true;
      ltScore += 1;
    }
    if (abs(location.x - rightRim.getLocationX()) <= 30 && abs(location.y - rightRim.getLocationY()) <= 30) {
      ifRTScore = true;
      rtScore += 1;
    }
  }

  void stealCheck() {
    if (ifTouchRT) {
      ifTouchLT = false;
    } else if (ifTouchLT) {
      ifTouchRT = false;
    }
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);

    stealCheck();
    scoreCheck();

    if (touchRT()) {
      for (RightTeam rt : rtplayers) {
        println("red stole ball");
        follow(rt.location);
      }
    } else if (touchLT()) {
      for (LeftTeam lt : ltplayers) {
        println("blue stole ball");
        follow(lt.location);
      }
    }
  }

  void follow(PVector playerLocation) {
    location = new PVector(playerLocation.x, playerLocation.y);
  }

  void display() {
    fill(255, 255, 0);
    bball.resize(20, 20);
    image(bball, location.x, location.y);
  }
}
