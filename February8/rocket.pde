//Robota Psyche Assignment 1
//Kyrie Park
//Description: Draw a rocket that moves toward the cursor, but with using arrow keys, you can slower, faster or even change dirrections of the rocket!
//============================================================================================================================
//============================================================================================================================


//claiming direction vectors for when the arrow keys are pressed
PVector right = new PVector(.1, 0);
PVector left = new PVector(-.1, 0);
PVector up = new PVector(0, -.1);
PVector down = new PVector(0, .1);

//checking if arrow keys are pressed
boolean pressed = false;

Rocket rocket = new Rocket();

void setup() {
  size(600, 600);
}

class Rocket {
  //Declare variables
  PVector position;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  //float lengthVelocity = velocity.mag();

  //initial rocket's position, velocity, and acceleration
  Rocket() {
    position = new PVector(300, 300);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topspeed =20;
  }

  //check if arrow keys are pressed, and accelerate to the acccording direction
  void skrrt(PVector direction) {
    if (pressed == true) {
      acceleration.add(direction);
    }
  }

  //move the rocket by updating its position every time the rocket is drawn
  void move() {
    position.add(velocity);
    velocity.add(acceleration);
    velocity.limit(topspeed);
    acceleration.mult(0);
  }

  //display rocket and rotate accordingly
  void displayRocket() {
    noStroke();
    pushMatrix();
    translate(position.x, position.y);
    rotate(velocity.heading());

    fill(255, 0, 0);
    rect(0, 40, 40, 10);
    rect(0, 55, 40, 10);
    rect(0, 70, 40, 10);
    translate(30, 0);
    fill(255, 0, 0);
    triangle(80, 45, 80, 75, 120, 60);
    fill(150, 150, 150);
    rect(0, 45, 80, 30);
    //triangle(0, 40, 0, 50, -1*lengthVelocity, 45);
    //triangle(0, 55, 0, 65, -1*lengthVelocity, 60);
    //triangle(0, 70, 0, 80, -1*lengthVelocity, 75);

    popMatrix();
  }

  //If rocket goes out of the canvas, it will pop out of the otherside
  void connectEdges() {
    if (position.x > width) {
      position.x = 0;
    } else if (position.x < 0) {
      position.x = width;
    }
    if (position.y > height) {
      position.y = 0;
    } else if (position.y < 0) {
      position.y = height;
    }
  }
}

void draw() {
  background(255);
  //Draw/move rocket
  rocket.move();
  rocket.connectEdges();
  rocket.displayRocket();

  //Check if arrow keys are pressed, and move the rocket according to the pressed key
  if (keyPressed == true) {
    pressed = true;
    if (key == CODED) {
      if (keyCode == RIGHT) {
        rocket.skrrt(right);
      }
      if (keyCode == LEFT) {
        rocket.skrrt(left);
      }
      if (keyCode == UP) {
        rocket.skrrt(up);
      }
      if (keyCode == DOWN) {
        rocket.skrrt(down);
      }
    }
  }
  //if key is not pressed, keep the velocity as it is and no acceleration and but the pressed boolean as false
  else {
    pressed = false;
    PVector stop = rocket.velocity.copy();
    stop.mult(-1);
    stop.normalize();
    stop.mult(0.1);
    rocket.skrrt(stop);
  }
}
