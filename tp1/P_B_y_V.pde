class PinceladasBlancoYVerde {
  PGraphics pbyv;
  float xA = random ( 0, width);
  float yA = random(0, height);
  float rot = random(-5, 10);
  int c = 7;
  int mostrar = int(random(c));
  //=======================
  PImage pinceladasB[] = new PImage [c];
  color blanquito[] = new color [c];
  //=======================
  Paleta a = new Paleta("byv.jpg");
  //=======================
  PinceladasBlancoYVerde() {
    pbyv = createGraphics(width, height);

    pbyv.beginDraw();
    for (int i = 0; i < c; i++) {
      String Nombre = "trazo"+nf(i, 2)+".png" ;
      pinceladasB[i] = loadImage(Nombre);
      pinceladasB[i].resize(100, 110);
      pinceladasB[i].filter(INVERT);
      blanquito[i] = a.darUnColor();
    }
    pbyv.endDraw();
  }
  //=======================
  void dibujar() {
    pbyv.beginDraw();   

    for (int i = 0; i < c; i+=3) {
      pbyv.tint(blanquito[i], 180);
      pbyv.rotate(rot);
      pbyv.image(pinceladasB[mostrar], xA, yA);
    }

    pbyv.endDraw();

    push();
    image(pbyv, 0, 0);
    pop();
  }
   void actualizar(boolean sonido) {
    if (sonido) {
      rot = random(-5, 10);
      xA = random ( 0, width);
      yA = random(0, height);
      mostrar = int(random(c));
    }
  }
}
