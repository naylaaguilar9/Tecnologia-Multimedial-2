class PinceladasNegras {
  PGraphics pn;
  int cantidadDePinceladas = 3;
  int c = int(random(1,3));
  int mostrar = int(random(cantidadDePinceladas));
  PImage pinceladasN[] = new PImage [cantidadDePinceladas];

  PinceladasNegras() {
    pn = createGraphics(width, height);

    pn.beginDraw();
    for (int i = 0; i < cantidadDePinceladas; i++) {
      String Nombre = "trazo"+nf(i, 2)+".png" ;
      pinceladasN[i] = loadImage(Nombre);
    }
    pn.endDraw();
  }

  void dibujar() {
    pn.beginDraw();
    float xA = random(width-450, 300);
    float yA = random(500, 600);

    pn.push();
    for (int i = 0; i < c; i+=3) {      
      pn.tint(21, 20, 24, 150);
      pn.rotate((random(-5, 10)));
      pn.image(pinceladasN[mostrar], xA, yA);
      pn.scale ( random (-2, 1));
      if (i > 50) {
        i--;
      }
    }

    pn.pop();
    pn.endDraw();

    pn.push();
    image(pn, 0, 0);
    pn.pop();
  }
}
