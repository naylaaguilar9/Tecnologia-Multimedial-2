/*
       | TP1 | Tmm2 | FdA | UNLP |
           ------- TP1 -------
 Comision: Lisandro | Prof.Lisandro Peralta
 Alumna: Aguilar Nayla Belen(88106/6).
 Video:
 */
import oscP5.*; 
Cuadro c;

void setup() {
  size(500, 800);
  c = new Cuadro();
}

void draw() {
  background(200, 223, 237);
  c.dibujarCuadro();
}
