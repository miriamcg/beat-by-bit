int tiempoMenu = 0; 
int tiempoMenu2 = 0; 
int tiemporestart = 0; 
int tiempoRitmo = 0;
float rotacion1 = 0;
float rotacion2 = 0;
float valor = 0.1;
boolean ritmo = true;
int vida = 400;
boolean quitarvida = true;

void juego() {  
  background(225); 
  image(kinect.GetImage(), width/2, height/2, 800, 640);
  skeletons();

  //Valores aleatorios -------------------------------------
  if (ActivacionAleatorio) {
    Aleatorio1 = (int) (Math.random() * 2) + 1;
    Aleatorio2 = (int) (Math.random() * 2) + 1;
    Aleatorio1d = (int) (Math.random() * 2) + 1;
    Aleatorio2d = (int) (Math.random() * 2) + 1;
    ActivacionAleatorio = false;
  }

  if (Aleatorio1 == 1) {
    SumX=-bit;
  } else {
    SumX=bit;
  } 
  if (Aleatorio2 == 1) {
    SumY=-bit;
  } else {
    SumY=bit;
  } 
  //
  if (Aleatorio1d == 1) {
    SumXd=-bit;
  } else {
    SumXd=bit;
  } 
  if (Aleatorio2d == 1) {
    SumYd=-bit;
  } else {
    SumYd=bit;
  } 
  //
  X = X+SumX;
  Y = Y+SumY; 
  Xd = Xd+SumXd;
  Yd = Yd+SumYd; 
  //ritmo

  tiempoRitmo++;
  if (tiempoRitmo%60 == 0) {
    ritmo = true;
  }

  sum += (rms.analyze() - sum) * smoothingFactor;

  float rms_scaled = sum * (height/4);

  rotacion1 = rotacion1 + valor;
  rotacion2 = rotacion2 - valor;

  if (rotacion1 >= 0.6 || rotacion2 >=0.6) {
    valor = valor* -1;
  }

  // Beat cats
  pushMatrix();
  translate(width/2-200, height/2);
  rotate(rotacion2);
  image(gato, 0, 0, rms_scaled, rms_scaled);
  popMatrix();

  pushMatrix();
  translate(width/2+200, height/2);
  rotate(rotacion1);
  image(gato, 0, 0, rms_scaled, rms_scaled);
  popMatrix(); 

  if (rms_scaled >= 58 && ritmo == true) {
    ritmo = false;
    X= width/2;
    Y= height/2;
    Xd= width/2;
    Yd= height/2;
    estrellas++;
  }

  if (X >= 600 && X <= 800 || X >= 0 && X <= 200 || Xd >= 600 && Xd <= 800 || Xd >= 0 && X <= 200) {
    X = width*30;
    Xd = width*30;

    if (quitarvida) {
      vida = vida - 80;
      quitarvida = false;
    }

    if (X == width*30 || Xd == width*30) {
      quitarvida = true;
    }
    ActivacionAleatorio = true;
  }
  imageMode(CENTER);
  image(disco, X, Y, 100, 100); 
  image(disco, Xd, Yd, 100, 100); 
  textAlign(CENTER);
  textSize(30);
  text("Score: " + points, 95, height/8);
  // -------------------------------------------
  
  handCoordinate();  
  returnButton();

  //Pantalla de win
  if (musica1.isPlaying() || musica2.isPlaying() || musica3.isPlaying() || musica4.isPlaying() || musicFrames <100) {
  } else {
    ganando();
  }

  if (vida >= 400) vida = 400;
  if (vida <= 0) {
    if (pantalla == 2) {
      scratch.play();
    }
    loss();
  }

  if (pantalla == 2) {
    fill (150, 20, 50);
    rect(20, 20, 200, 15);
    fill(20, 150, 100);
    rect(20, 20, vida/2, 15);

    pushMatrix();
    translate (width/2, height/2);
    scale(0.4);
    image(dance, 1.2 * width/4, 1.5* height);
    dance.loop();
    popMatrix();
  }

  pushMatrix();
  translate (width/2 + 300, 100);
  scale(.33);
  image(volador, 0, 0);
  volador.loop();
  popMatrix();
}
