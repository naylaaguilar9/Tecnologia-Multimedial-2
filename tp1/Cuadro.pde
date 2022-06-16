class Cuadro {
  GestorVoz voz;
  //=======================
  Garabato garabato;
  ManchasAzules mAzul;
  ManchasBlancas mBlanco;
  PinceladasAmarillo amarillo;
  PinceladasBlancoYVerde byv;
  PinceladasNegras negro; 
  PinceladasRosa rosa;
  //=======================
  Cuadro() {
    voz = new GestorVoz();
    garabato = new Garabato();
    mAzul = new ManchasAzules(400, 700, 300, 400); //Funciona como un rect(), o sea: (posicion en x, posicion en y, tamaño en x, tamaño en y)
    mBlanco = new ManchasBlancas();
    amarillo = new PinceladasAmarillo();
    byv = new PinceladasBlancoYVerde();
    negro = new PinceladasNegras();
    rosa = new PinceladasRosa ();
  }
  //=======================
  void dibujarCuadro() {
    voz.Sonido();
    
    //PINCELADAS
    byv.dibujar();
    byv.actualizar(voz.volAlto);

    rosa.dibujar();
    rosa.actualizar(voz.sonidoAgudo);

    amarillo.dibujar(); 
    amarillo.actualizar(voz.volBajo);

    negro.dibujar();

    //MANCHAS BLANCAS
    mBlanco.actualizar(voz.volAlto);  
    mBlanco.dibujar();  
    mBlanco.movimiento();

    //MANCHAS AZULES
    mAzul.movimiento(voz.sonidoGrave);
    mAzul.dibujar(); 
    mAzul.actualizar();

    //GARABATO
    garabato.dibujar(0, 0);
    garabato.actualizar(voz.sonidoAgudo);
  }
}
