void ganando() {

  pantalla = 3;
  background(225); 
  image(kinect.GetImage(), width/2, height/2, 800, 640);
  skeletons();
  fill(255);
  textSize(60);
  fill(72, 184, 117);
  
   /*Agregar los GIF al ganar ♥ */
  image(happy, width/2, 3*height/4);
  happy.loop();
  image(firework, width/4, height/3);
  image(firework, width-50, height/3);
  firework.loop();
  
  text("CONGRATULATIONS :)", width/2, height/2-50); 
  text("Your Score: "+ points, width/2, height/2+30);

  if ((points/10)/(estrellas*2) <= 0.49) {
    image(uno, width/2, height/2-150);
  } else if ((points/10)/(estrellas*2) <= 0.59) {
    image(dos, width/2, height/2-150);
  } else if ((points/10)/(estrellas*2) <= 0.69) {
    image(tres, width/2, height/2-150);
  } else if ((points/10)/(estrellas*2) <= 0.8) {
    image(cuatro, width/2, height/2-150);
  } else if ((points/10)/(estrellas*2) >= 0.9) {
    image(cinco, width/2, height/2-150);
  }

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
      vida = 400;
      estrellas = 0;
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
