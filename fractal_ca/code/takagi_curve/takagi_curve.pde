/* takagi curve */

int[] ys;

void setup() {
  size(860, 620);
  background(240);
  noLoop();
  strokeWeight(1.6);
}


void draw() {
  reverseY();
  initPoints();
  tcurve(0, width, 10);
  plot();
}


void reverseY() {

  translate(width/2, height/2);
  rotate(PI);
  translate(-width/2, -height/2);

  return ;
}


void initPoints() {

  ys = new int[width];
  for ( int x = 0; x < ys.length; x++ ) {
    ys[x] = 0;
  }

  return;
}


void tcurve(int lx, int rx, int n) {

  if ( n <= 0 ) {
    return ;
  }

  int cx = (lx + rx) / 2;
  int y = 0;

  for ( int x = lx; x < cx; x++ ) {
    ys[x] += y++;
  }
  for ( int x = cx; x < rx; x++ ) {
    ys[x] += y--;
  }

  tcurve(lx, cx, n-1);
  tcurve(cx, rx, n-1);

  return;
}


void plot() {

  for ( int x = 0; x < ys.length; x++ ) {
    point(x, ys[x]);
  }

  return ;
}




void keyPressed() {
  if ( key == 's' ) {
    saveFrame("takagi_curve.png"); 
    System.exit(0);
  }
}
