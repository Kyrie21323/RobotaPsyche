public class Cheese {
  PVector location;
  PVector velocity;
  PVector acceleration;

  float r;
  float maxforce;
  float maxspeed;

  Cheese(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(x, y);
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
    fill(255, 255, 0);
    cheesePic.resize(0, 60);
    image(cheesePic, location.x, location.y);
  }
}
