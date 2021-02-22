class DNA {
  int Shape;
  color Color;

  DNA() {
    Shape = int(random(0, 3));
    Color = color(int(random(0, 255)),int(random(0, 255)),int(random(0, 255)));
  }

  int getShape() {
    if (Shape == null){
      println("Shape is null");
    }
    return Shape;
  }

  color getColor() {
    
    return(Color);
  }
}
