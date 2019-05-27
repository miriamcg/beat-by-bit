void skeletons() {
  //Dibuja esqueletos
  for (int i=0; i<bodies.size (); i++) {

    //Circunferencia mano derecha pimer esqueleto
    if (i==0) {
      pushStyle();
      fill(255, 0, 0, 50);
      //Detectada mano derecha
      if (bodies.get(i).skeletonPositionTrackingState[Kinect.NUI_SKELETON_POSITION_HAND_RIGHT]!=Kinect.NUI_SKELETON_POSITION_NOT_TRACKED) {
        xr = bodies.get(i).skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_RIGHT].x*width;
        yr = bodies.get(i).skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_RIGHT].y*height;
        ellipse(xr, yr, 30, 30);
      }

      // Detectada mano izquierda
      if (bodies.get(i).skeletonPositionTrackingState[Kinect.NUI_SKELETON_POSITION_HAND_LEFT]!=Kinect.NUI_SKELETON_POSITION_NOT_TRACKED) {
        xl = bodies.get(i).skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_LEFT].x*width;
        yl = bodies.get(i).skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_LEFT].y*height;
        ellipse(xl, yl, 30, 30);
      }
      popStyle();
    }
  }
}

void appearEvent(SkeletonData _s) {
  if (_s.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    bodies.add(_s);
  }
}

void disappearEvent(SkeletonData _s) {
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_s.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.remove(i);
      }
    }
  }
}

void moveEvent(SkeletonData _b, SkeletonData _a) {
  if (_a.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_b.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.get(i).copy(_a);
        break;
      }
    }
  }
}
