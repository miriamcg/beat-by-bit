int last=0;
int t;
int interval = 3;

void contador() {
  background(225); 
  image(Fondo, width/2, height/2);   
  textSize(120);

  fill(255);
  t = interval-last;
  if (t > -1) {
    delay(1200);
    last=last+1;
    fill(100, 160, 120);
    text(t, width/2, height/2);
  } else {
    pantalla = 2;
    juego();
  }
}
