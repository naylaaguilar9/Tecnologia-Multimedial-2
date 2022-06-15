class Garabato {
  PGraphics g;
  float x, y;
  float dir, vel;

  Garabato() {
    g = createGraphics(width, height);
    x = random( 50, width - width/2.0 );
    y = random( 0, height - height/2.0);

  }

  void actualizar(boolean sonido) {
    if(sonido){
    dir =+ random(5);
    vel = 1;


    float dirX = vel*cos(dir);
    float dirY = vel*sin(dir);

    x = x+dirX;
    y = y+dirY; 
    }  
  }

  void dibujar(float a, float b) {
    g.beginDraw();
    g.strokeWeight(3);
    g.line(x, y, x, y);
    g.endDraw();

    push();
    image(g, a, b);
    pop();
  }
}
