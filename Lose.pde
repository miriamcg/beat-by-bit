void loss() {

  pantalla = 3;
  background(225); 
  //image(Fondo, width/2, height/2); 
  image(kinect.GetImage(), width/2, height/2, 800, 640);
  skeletons();
  
  fill(255);
  textSize(100);
  fill(215, 40, 40);
  text("YOU LOSE :(", width/2, height/2); 
  
  //gifts
  pushMatrix();
  translate(width/2, height/3*2);
  scale(.75);
  image(gatito2, 0,0); 
  gatito2.loop();
  popMatrix();

  // Cargar imágenes para los botones
  fill(100);
  textSize(20);
  image(volver, width/3, height-50, 120*tamano5, 40*tamano5);
  image(restart, (width/3)*2, height-50, 120*tamano6, 40*tamano6);

  fill(180);
  rect(width/3-60, height-23, 50* 2.375, 10);
  fill(20, 150, 100);
  rect(width/3-60, height-23, tiempoMenu2* 2.375, 10);
  fill(250);
  //____________________
  fill(180);
  rect((width/3)*2-60, height-23, 50* 2.375, 10);
  fill(20, 150, 100);
  rect((width/3)*2-60, height-23, tiemporestart* 2.375, 10);
  fill(250);

  if (xr >= (width/3)-60 &&  xr <= (width/3)+60  && yr >= height-70 && yr <= height-30 || xl >= (width/3)-60 &&  xl <= (width/3)+60  && yl >= height-70 && yl <= height-30) {
    tamano5 = 1.1;
    tiempoMenu2++;

    if (tiempoMenu2%50 == 0) {
      pantalla =1;
      tiempoMenu2=0;      
      points= 0;
      Xd = 10000;
      Yd = 10000;
      X  = 10000;
      Y  = 10000;
      interval = 3;
      last = 0;
      estrellas = 0;
      vida = 400;
    }
  } else {
    tamano5 = 1;  
    tiempoMenu2--; 
    if (tiempoMenu2 < 0) {
      tiempoMenu2 = 0;
    }
  }

  //  int tiemporestart = 0; 
  if (xr >= (width/3)*2-60 &&  xr <= (width/3)*2+60  && yr >= height-70 && yr <= height-30 || xl >= (width/3)*2-60 &&  xl <= (width/3)*2+60  && yl >= height-70 && yl <= height-30) {
    tamano6 = 1.1;
    tiemporestart++;

    if (tiemporestart%52 == 0) {
      //pantalla = 2;
      musicFrames= 0;     
      tiemporestart=0;

      points= 0;
      //Mandamos las flores fuera de pantalla
      Xd = 10000;
      Yd = 10000;
      X  = 10000;
      Y  = 10000;
      //Reiniciamos el contador
      interval = 3;
      last = 0;
      //Reiniciamos la vida
      vida = 400;
      estrellas = 0;
      contador();
    }
  } else {
    tamano6 = 1;  
    tiemporestart--; 
    if (tiemporestart < 0) {
      tiemporestart = 0;
    }
  }
}
