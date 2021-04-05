class DNA {
  int miceSize;
  int colorR, colorG, colorB;

  DNA(int size, int R, int G, int B) {
    miceSize = size;
    colorR = R;
    colorG = G;
    colorB = B;
    mutation();
  }

  DNA getDNA() {
    DNA dna = new DNA(miceSize, colorR, colorG, colorB);
    return dna;
  }

  void mutation() {
    colorR += random(-30, 30);
    colorG += random(-30, 30);
    colorB += random(-30, 30);
  }

  int getSize() {
    return miceSize;
  }

  color getColorR() {
    return colorR;
  }
  color getColorG() {
    return colorG;
  }
  color getColorB() {
    return colorB;
  }
}
