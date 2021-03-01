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

  void display() {
    fill(255, 255, 0);
    triangle(width/2 - 50, height/2 + 50, width/2, height/2 - 50, width/2 + 50, height/2 + 50);
  }
}
