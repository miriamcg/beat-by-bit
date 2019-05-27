class cancion {

  cancion (SoundFile musica, int numeropista, int numeroCancion, int pantalla, int frames) {
    if (pantalla == 2 && musica.isPlaying() && numeropista == numeroCancion) {
    } else if (pantalla==2 && numeropista == numeroCancion && frames == 80) {
      musica.play();
      rms.input(musica);
    } else if (numeroCancion != numeropista || pantalla != 2 || frames >= musica.frames()) {
      musica.stop();
    }
  }
}
