class PinceladasRosa {
  PGraphics pr;
  int c = 7;
  PImage pinceladasA[] = new PImage [c];
  color rosa[] = new color [c];
  float xA = random(0,width/2);
  float yA = random(0,height/3);
  int mostrar = int(random(c));
  float rot = random(-5, 10);
  //=======================
  Paleta a = new Paleta("rosa.jpg");
  //=======================
  PinceladasRosa() {
    pr = createGraphics(width, height);

    pr.beginDraw();
    for (int i = 0; i < c; i++) {
      String Nombre = "trazo"+nf(i, 2)+".png" ;
      pinceladasA[i] = loadImage(Nombre);
      pinceladasA[i].resize(190, 120);
      pinceladasA[i].filter(INVERT);
      rosa[i] = a.darUnColor();
    }
    pr.endDraw();
  }
  //=======================
  void dibujar() {
    pr.beginDraw();
    for (int i = 0; i < c; i++) {
      pr.tint(rosa[i], 150);
      pr.rotate(rot);
      pr.image(pinceladasA[mostrar], xA, yA);
    }
    pr.endDraw();

    push();
    image(pr, 0, 0);
    pop();
  }
  //=======================
  void actualizar(boolean sonido) {
    if (sonido) {
      xA = random(0,100);
      yA = random(0,200);
      mostrar = int(random(c));
      rot = random(-5, 10);
    }
  }
}
