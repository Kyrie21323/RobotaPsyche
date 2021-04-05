class Trap {
  PVector location;
  PVector velocity;
  PVector acceleration;
  int check;

  Trap(int grid, int x, int y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(x, y);
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
    image(trap, location.x, location.y);
  }
}
