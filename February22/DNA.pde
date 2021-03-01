class DNA {
  int miceSize;
  //int colors;

  DNA(int size) {
    miceSize = size;
    //Color = color(int(random(0, 255)),int(random(0, 255)),int(random(0, 255)));
  }

  DNA getDNA() {
    DNA dna = new DNA(miceSize);
    return dna;
  }

  int getSize() {
    return miceSize;
  }

  //color getColor() {
  //  return(Color);
  //}
}
