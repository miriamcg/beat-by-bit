/*Variables del menu*/

PImage fondo, boton1, boton2, boton3, fondojuego;
float tamano1, tamano2, tamano3, tamano4, tamano5, tamano6;
int tiempoPlay = 0;  
int tiempoMusica = 0;
int tiempoDif = 0;
int num_cancion = 1;
int dificultad = 2;
String level;

void drawMenu() {
  imageMode(CENTER);
  textAlign(CENTER);
  textFont(createFont("OCR A Extended", 15));

  //cuando pantalla sea tipo 1, el menú será mostrado
  if (pantalla == 1) {

    image(boton1, width/5, height/5, 190*tamano1, 65*tamano1);  //posicionamiento boton de jugar
    image(boton2, width/5, 150+height/5, 190*tamano2, 65*tamano2);  //posicionamiento boton de seleccion de música
    image(boton3, width/5, 300+height/5, 190*tamano3, 65*tamano3);  //posicionamiento boton de seleccion de dificulad
    pushMatrix();
    textAlign(CENTER);
    textSize(70);
    fill(255);
    translate(width - 50,250);
    rotate(-HALF_PI);
    text("BEAT BY BIT",0,0);
    popMatrix();

    textSize(15);
    if ( dificultad == 1) {
      level = "FÁCIL";
      bit=1;
    } else if (dificultad == 2) { 
      level = "NORMAL";
      bit=8;
    } else {
      level = "DIFÍCIL";
      bit=10;
    }

    fill(180);
    rect(width/5-95, 40+height/5, 80* 2.375, 10);
    fill(20, 150, 100);
    rect(width/5-95, 40+height/5, tiempoPlay* 2.375, 10);
    fill(250);
    text("Canción: "+num_cancion, width/5, 200+height/5);
    text(level, width/5, 350+height/5 );

    botonPlay();
    botonCancion();
    botonDificultad();
    
  } else {
    contador();
  }
}

void botonPlay() {
  if (xr >= 65 && xr <= 255 && yr >= 95 && yr <= 161 || xl >= 65 && xl <= 255 && yl >= 95 && yl <= 161) {
    tamano1 = 1.1;
    tiempoPlay++;
    //BARRA DE ESTADO - TIEMPO PARA INICIAR EL JUEGO
    if (tiempoPlay%81 == 0) {
      tiempoPlay=0;
      pantalla = 2;
    }
  } else {
    tamano1 = 1;  
    tiempoPlay--; 
    if (tiempoPlay < 0) {
      tiempoPlay = 0;
    }
  }
}

void botonCancion() {
  /*SEGUNDO BOTÓN, CANCIÓN*/
  if (xr >= 65 && xr <= 255 && yr >= 95+150 && yr <= 161+150 || xl >= 65 && xl <= 255 && yl >= 95+150 && yl <= 161+150) {
    tamano2 = 1.1;
    tiempoMusica++;
    if (tiempoMusica%40 ==0) {
      num_cancion++;
    }
    if (num_cancion > 4) {
      num_cancion = 1;
    }
  } else {
    tamano2 = 1;  
    tiempoMusica = 0;
  }
}

void botonDificultad() {
  /*TERCER BOTON, DIFICULTAD, FACIL, MEDIA, DIFICIL*/
  if (xr >= 65 && xr <= 255 && yr >=95+300  && yr <= 120+300 || xl >= 65 && xl <= 255 && yl >=95+300  && yl <= 120+300) {
    tamano3 = 1.1;  
    tiempoDif++; 

    if (tiempoDif%40 ==0) {
      dificultad++;
    }
    if (dificultad > 3) {
      dificultad = 1;
    }
  } else {
    tamano3 = 1;  
    tiempoDif = 0;
  }
}
