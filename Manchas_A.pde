class ManchasAzules {
  PGraphics m;

  PImage manchaGrande, manchaChica;
  //=======================
  int c = int(random(10, 16));
  float x [] = new float [c];
  float y [] = new float [c];
  float vida [] = new float [c];
  float angulo = 0;
  float px, py;
  //======================= 
  boolean subirRebote = false;

  ManchasAzules(float posx, float posy, int tx, int ty) {
    px = posx;
    py = posy;
    m = createGraphics(tx, ty);
    manchaGrande = loadImage("mancha00.png");
    manchaChica = loadImage("mancha01.png");
    manchaGrande.filter(INVERT);
    manchaGrande.resize(20, 28);
    manchaChica.filter(INVERT);
    manchaChica.resize(10, 15);

    m.beginDraw();

    for (int i = 0; i < c; i++) {
      x [i] = random(10, m.width-10);
      y [i]= random(10, m.height-10);
    }

    m.endDraw();
  }
  //=======================
  void movimiento(boolean gira) {
    if (gira) {
      angulo-=0.1;
    } 
    for (int i = 0; i < c; i++) {
      if (y[i] < 20) {
        y[i] = m.height+20;
      }
      y[i]-=0.6;
    }
  }
  //=======================
  void dibujar() {
    m.beginDraw();
    m.clear();
    m.imageMode(CENTER);
    for (int i = 0; i < c; i++) {      
      m.push();
      m.translate(x[i], y[i]);
      m.rotate(angulo);

      m.tint(3, 179, 212, vida[i]);
      m.image(manchaGrande, 0, 0);

      m.tint(255, 255, 255, vida[i]);
      m.image(manchaChica, 5, 5);
      m.pop();
    }
    m.endDraw();

    push();
    imageMode(CENTER);
    image(m, px, py);
    pop();
  }
  //=======================
  void actualizar() {
    for (int i = 0; i < c; i++) {
      if (y[i] > m.height/2) {
        vida[i] =  map(y[i], m.height+20, m.height/2, 0, 255);
      } else {
        vida[i] =  map(y[i], m.height/2, 20, 255, 0);
      }
    }
  }
  //=======================
  void cambiarPosicion(float nuevox, float nuevoy) {
    px = nuevox;
    py = nuevoy;
  }
}
