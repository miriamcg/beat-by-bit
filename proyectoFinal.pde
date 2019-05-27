import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;
import processing.sound.*;
import gifAnimation.*;

// Kinect
Kinect kinect;
ArrayList <SkeletonData> bodies;

//ritmo
float estrellas;
cancion pistas;
int pantalla = 1;
int musicFrames = 0;

int bit;
float sum;
Amplitude rms;
SoundFile musica1, musica2, musica3, musica4, drum, scratch;
float smoothingFactor = 0.25;
Boolean ActivacionAleatorio = true;
//disco1
int Aleatorio1, Aleatorio2, SumX, SumY, X, Y;
//disco2
int Aleatorio1d, Aleatorio2d, SumXd, SumYd, Xd, Yd;
// puntuaje
int points;
PImage disco, marcador, Fondo, volver, gato, restart, uno, dos, tres, cuatro, cinco;
//flores
int t1, t2, t3, t4;
int s1, s2, s3, s4;
// coordenadas manos
float xr, xl, yr, yl;
Gif crying, happy, firework, dance, volador, gatito2;

void setup() {
  size(800, 640);
  background(0);

  kinect = new Kinect(this);
  smooth();
  bodies = new ArrayList<SkeletonData>();

  disco=loadImage("/images/disc.png");
  marcador = loadImage("/images/disco.png");
  Fondo = loadImage("/images/Fondo.png");
  volver = loadImage("/images/volver.png");
  gato =  loadImage("/images/gato.png");
  restart = loadImage("/images/restart.png");
  
  crying= new Gif(this, "/GIFs/piggy.gif");
  happy= new Gif(this, "/GIFs/happy.gif");
  firework = new Gif(this, "/GIFs/firework.gif");
  dance= new Gif(this, "/GIFs/dance.gif");
  gatito2= new Gif(this,"/GIFs/gatito2.gif");
  volador = new Gif(this, "/GIFs/gatoAnaid.gif");

  X = width*30;
  Y = height*30;
  t1 = 100;
  t2 = 100;
  t3 = 100;
  t4 = 100;
  s1 = 0;
  points = 0;

  /*Musica*/
  //ritmo//
  musica1 = new SoundFile(this, "/music/BADGUY.wav");  
  musica2= new SoundFile(this, "/music/soho-drifting.wav"); 
  musica3 = new SoundFile(this, "/music/aimless-sailway.wav"); 
  musica4 = new SoundFile(this, "/music/mattdeguia-daylight.wav");
  scratch = new SoundFile(this, "/music/scratch.wav");
  drum = new SoundFile(this, "/music/pss.wav");
  rms = new Amplitude(this);


  /*Setup de elementos del menu*/
  fondo=loadImage("/images/menufondo.png");
  fondojuego=loadImage("/images/Fondo.png");
  boton1=loadImage("/images/boton1.png");
  boton2=loadImage("/images/boton2.png");
  boton3=loadImage("/images/boton3.png");
  uno=loadImage("/images/stars1.png");
  dos=loadImage("/images/stars2.png");
  tres=loadImage("/images/stars3.png");
  cuatro=loadImage("/images/stars4.png");
  cinco=loadImage("/images/stars5.png");
  tamano1 = 1;
  tamano2 = 1;
  tamano3 = 1;
  tamano4 = 1;
  tamano5 = 1;
  tamano6 = 1;
  estrellas = 0;
}

void draw() {
  image(kinect.GetImage(), width/2, height/2, 800, 640);
  skeletons();
  drawMenu();
  pistas = new cancion(musica1, 1, num_cancion, pantalla, musicFrames );
  pistas = new cancion(musica2, 2, num_cancion, pantalla, musicFrames );
  pistas = new cancion(musica3, 3, num_cancion, pantalla, musicFrames );
  pistas = new cancion(musica4, 4, num_cancion, pantalla, musicFrames );
  if (pantalla == 1) {
    musicFrames = 0;
  } else if (pantalla ==2) {
    musicFrames++;
  }
}
