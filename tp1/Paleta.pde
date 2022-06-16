class Paleta{
  PImage paletaDeColores;
  
  Paleta(String nombreArchivo){
    paletaDeColores = loadImage (nombreArchivo);
  }
  
  color darUnColor(){
  int x = int(random(paletaDeColores.width));
  int y = int(random(paletaDeColores.height));
    
  return paletaDeColores.get(x,y);
  }
}
