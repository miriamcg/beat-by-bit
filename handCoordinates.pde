void handCoordinate() {
  //marcador 1
  image(marcador, 225, 145, t1, t1); 
  if (xr <= (225+50) && xr >= (225-50) && yr <= (145+50) && yr >= (145-50) || xl <= (225+50) && xl >= (225-50) && yl <= (145+50) && yl >= (145-50)) {   
    if (s1 >= 4) {
      t1 = 100;
    } else {
      t1 = 140;
      s1++;
    }
  } else { 
    t1 = 100;
    s1 = 0;
  }

  //marcador 2
  image(marcador, 575, 145, t2, t2); 
  if (xr <= (575+50) && xr >= (575-50) && yr <= (145+50) && yr >= (145-50) || xl <= (575+50) && xl >= (575-50) && yl <= (145+50) && yl >= (145-50)) {
    if (s2 >= 4) {
      t2 = 100;
    } else {
      t2 = 140;
      s2++;
    }
  } else { 
    t2 = 100;
    s2 = 0;
  }

  //marcador 3
  image(marcador, 225, 495, t3, t3); 
  if (xr <= (225+50) && xr >= (225-50) && yr <= (495+50) && yr >= (495-50) || xl <= (225+50) && xl >= (225-50) && yl <= (495+50) && yl >= (495-50)) {
    if (s3 >= 4) {
      t3 = 100;
    } else {
      t3 = 140;
      s3++;
    }
  } else { 
    t3 = 100;
    s3 = 0;
  }

  //marcador 4
  image(marcador, 575, 495, t4, t4); 
  if (xr <= (575+50) && xr >= (575-50) && yr <= (495+50) && yr >= (495-50) || xl <= (575+50) && xl >= (575-50) && yl <= (495+50) && yl >= (495-50)) {
    if (s4 >= 4) {
      t4 = 100;
    } else {
      t4 = 140;
      s4++;
    }
  } else { 
    t4 = 100;
    s4 = 0;
  }

  //Puntuaje1
  if (t1 == 140 && X <= 225+80 && X >= 225-80 && Y <= 145+80 && Y >= 145-80  ) {
    points = points+10;
    vida += 100;
  }
  if (t1 == 140 && Xd <= 225+80 && Xd >= 225-80 && Yd <= 145+80 && Yd >= 145-80  ) {
    points = points+10;
    vida += 100;
  } 

  //Puntuaje2
  if (t2 == 140 && X <= 575+80 && X >= 575-80 && Y <= 145+80 && Y >= 145-80  ) {
    points = points+10;
    vida += 100;
  }
  if (t2 == 140 && Xd <= 575+80 && Xd >= 575-80 && Yd <= 145+80 && Yd >= 145-80  ) {
    points = points+10;
    vida += 100;
  }

  //Puntuaje3
  if (t3 == 140 && X <= 225+80 && X >= 225-80 && Y <= 495+80 && Y >= 495-80  ) {
    points = points+10;
    vida += 100;
  }
  if (t3 == 140 && Xd <= 225+80 && Xd >= 225-80 && Yd <= 495+80 && Yd >= 495-80  ) {
    points = points+10;
    vida += 100;
  }

  //Puntuaje4  
  if (t4 == 140 && X <= 575+80 && X >= 575-80 && Y <= 495+80 && Y >= 495-80  ) {
    points = points+10;
    vida += 100;
  }
  if (t4 == 140 && Xd <= 575+80 && Xd >= 575-80 && Yd <= 495+80 && Yd >= 495-80  ) {
    points = points+10;
    vida += 100;
  }

  if (X == width*20 && Xd == width*20) {
    ActivacionAleatorio = true;
  }
}
