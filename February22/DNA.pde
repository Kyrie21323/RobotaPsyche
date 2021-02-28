class DNA {
  int Shape;
  color Color;

  DNA() {
    Shape = int(random(0, 3));
    Color = color(int(random(0, 255)),int(random(0, 255)),int(random(0, 255)));
  }

  void getShape() {
    print(Shape);
    //return Shape;
  }

  color getColor() {
    return(Color);
  }
}
