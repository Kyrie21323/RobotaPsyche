class Rim {
  LeftTeam lt;
  RightTeam rt;

  PVector location;
  PVector velocity;
  PVector acceleration;

  float r;
  float maxforce;
  float maxspeed;

  Rim(PVector rimLocation) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(rimLocation.x, rimLocation.y);
    maxspeed = 0;
    maxforce = 0;
  }

  float getLocationX() {
    float locX = location.x;
    return locX;
  }

  float getLocationY() {
    float locY = location.y;
    return locY;
  }

  void display() {
    color(255, 255, 255);
    circle(location.x, location.y, 30);
  }

  //void
}
