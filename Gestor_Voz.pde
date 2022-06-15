class GestorVoz {
  OscP5 osc ;
  GestorSenial gestorAmp;
  GestorSenial gestorPitch;

  //variables de calibracion
  //AMP
  float amp = 0.0;
  float minimoAmp = 65; 
  float maximoAmp = 98;
  float amortiguacionAmp = 0.9;
  //PITCH
  float pitch = 0.0;
  float minimoPitch = 60;
  float maximoPitch = 87;
  float amortiguacionPitch = 0.9;
  //----------------------------------
  boolean haySonido = false;
  //------AMP------
  boolean volAlto = false;
  boolean volBajo = false;
  //------PITCH-----
  boolean sonidoAgudo = false;
  boolean sonidoGrave = false;
  //-----------------

  GestorVoz() {
    osc = new OscP5(this, 12345);
    gestorAmp = new GestorSenial(minimoAmp, maximoAmp, amortiguacionAmp);
    gestorPitch = new GestorSenial(minimoPitch, maximoPitch, amortiguacionPitch);
  }

  void oscEvent( OscMessage m ) {
    if (m.addrPattern().equals("/amp")) {
      amp = m.get(0).floatValue();
      //println(ga.filtradoNorm());
    }
    if (m.addrPattern().equals("/pitch")) {
      pitch = m.get(0).floatValue();
    }
    /*
    if (m.addrPattern().equals("/ruido")) {
     ruido = m.get(0).floatValue();
     println(ruido);
     }
     */
  }

  void Sonido() {

    gestorAmp.actualizar(amp);
    gestorPitch.actualizar(pitch);

    haySonido = false;
    volAlto = false;
    volBajo = false;
    sonidoAgudo = false;
    sonidoGrave = false;

    //----------------------------
    if (gestorAmp.filtradoNorm()> 0) {
      haySonido = true;
    } else {
      haySonido = false;
    }
    //----------------------------

    if (gestorAmp.filtradoNorm()> 0.5 && haySonido) {
      volAlto = true;
    }
    if (gestorAmp.filtradoNorm() < 0.5 && haySonido) { 
      volBajo = true;
    }

    if (gestorPitch.filtradoNorm() < 0.5 && haySonido) {
      sonidoAgudo = true;
    }

    if (gestorPitch.filtradoNorm() > 0.5 && haySonido) {
      sonidoGrave = true;
    }
  }

  float amp() {
    return gestorAmp.filtradoNorm();
  }

  float pitch() {
    return gestorPitch.filtradoNorm();
  }
}
