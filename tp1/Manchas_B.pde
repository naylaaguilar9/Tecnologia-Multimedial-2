class ManchasBlancas {
  PGraphics b;
  PImage pinceladasB, pinceladasB2;

  int c = 2;
  float vida = 0;
  float x1, y1, x2, y2;
  float tam, tam2;

  float vel;
  boolean rebote = false;
  boolean rebote2 = false;

  ManchasBlancas() {
    b = createGraphics(width, height);
    b.beginDraw();
    for (int i = 0; i < c; i++) {
      pinceladasB =loadImage("trazo06.png");
      pinceladasB2 =loadImage("trazo07.png");
      pinceladasB.filter(INVERT);
      pinceladasB.resize(120, 128 );
      pinceladasB2.filter(INVERT);
      pinceladasB2.resize(180, 185 );
    }
    b.endDraw();

    tam = width*0.25;
    tam2 = width*0.30;
    x1 = 0 + tam/2;
    y1 = int(random(height/5*3, height));
    x2 = width - tam2/2;
    y2 = int(random(0, height/5*2));
  }

  void dibujar() {
    b.beginDraw(); 
    
    if (frameCount % 30 == 0) {
      b.clear();
    }
    
    for (int i = 0; i < c; i++) {      
      b.translate(0, 0);

      push();
      b.tint(255, 255, 255, vida+10);
      b.image(pinceladasB, x1, y1);
      pop();

      push();      
      b.tint(255, 255, 255, vida+10); 
      b.image(pinceladasB2, x2, y2);
      pop();
    }
    b.endDraw();

    push();
    image(b, 0, 0);
    pop();
  }

  void actualizar(boolean sonido) {
    if(sonido){
      vida+=2;
    }
  }

  void movimiento() {
    if (x1 > width/3) {
      rebote = true;
    }
    if (x1 < 0) {
      rebote = false;
    }

    if (rebote) {
      x1-=5;
    } else {
      x1+=5;
    }


    if (x2 > width) {
      rebote2 = true;
    }
    if (x2 < width/3) {
      rebote2 = false;
    }
    if (rebote2) {
      x2-=5;
    } else {
      x2+=5;
    }
  }
}
