class PinceladasAmarillo {
  PGraphics pa;
  int c = 7;
  PImage pinceladasA[] = new PImage [c];
  color amarillos[] = new color [c];
  float xA = random(width-450, 300);
  float yA = random(500, 600);
  int mostrar = int(random(c));
  float rot = random(-0.1, 0.2);
  //=======================
  Paleta a = new Paleta("amarillo.jpg");
  //=======================
  PinceladasAmarillo() {
    pa = createGraphics(width, height);

    for (int i = 0; i < c; i++) {
      String Nombre = "trazo"+nf(i, 2)+".png" ;
      pinceladasA[i] = loadImage(Nombre);
      pinceladasA[i].resize(200, 250);
      pinceladasA[i].filter(INVERT);
      amarillos[i] = a.darUnColor();
    }
  }
  //=======================
  void dibujar() {
    pa.beginDraw();    

    for (int i = 0; i < c; i++) {      
      pa.tint(amarillos[i], 180);
      pa.rotate(rot);
      pa.image(pinceladasA[mostrar], xA, yA);
    }

    pa.endDraw();

    push();
    image(pa, 0, 0);
    pop();
  }
  //=======================
  void actualizar(boolean sonido) {
    if (sonido) {
      rot = random(-0.1, 0.2);
      xA = random(width-450, 300);
      yA = random(500, 600);
      mostrar = int(random(c));
    }
  }
}
