void returnButton() {

  /*Boton de regreso*/
  image(volver, width/2, height-50, 120*tamano4, 40*tamano4);
  fill(180);
  rect(width/2-60, height-23, 50* 2.375, 10);
  fill(20, 150, 100);
  rect(width/2-60, height-23, tiempoMenu* 2.375, 10);
  fill(250);

  if (xr >= (width/2)-60 &&  xr <= (width/2)+60  && yr >= height-70 && yr <= height-30 || xl >= (width/2)-60 &&  xl <= (width/2)+60  && yl >= height-70 && yl <= height-30) {
    tamano4 = 1.1;
    tiempoMenu++;

    if (tiempoMenu%50 == 0) {
      pantalla = 1;
      tiempoMenu=0;
      scratch.play();
      points= 0;
      Xd = 10000;
      Yd = 10000;
      X  = 10000;
      Y  = 10000;
      interval = 3;
      last = 0;
      vida =400;
      estrellas = 0;
    }
  } else {
    tamano4 = 1;  
    tiempoMenu--; 
    if (tiempoMenu < 0) {
      tiempoMenu = 0;
    }
  }
} 
