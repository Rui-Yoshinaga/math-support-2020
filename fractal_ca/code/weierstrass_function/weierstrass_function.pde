/* Weierstrass function */

float[] ys;

void setup() {
  size(800, 600);
  background(240);
  noLoop();
  initPoints();
}


void initPoints() {

  ys = new float[width];
  for ( int x = 0; x < ys.length; x++ ) {
    ys[x] = 0;
  }

  return ;
}


void draw() {
  wfunction(10);
  plot();
}


void wfunction(int n) {

  final float a = 0.5;
  final float b = 3;

  if ( n < 0 ) {
    return ;
  }

  for ( int x = 0; x < ys.length; x++ ) {
    ys[x] += pow(a, n) * cos(pow(b, n) * PI * 2*map(x, 0, width, -1, 1));
  }

  wfunction(n-1);

  return ;
}


void plot() {

  float py, y;

  strokeWeight(2);
  stroke(0);

  py = map(ys[0], -2.4, 2.4, height, 0);
  for ( int x = 1; x < ys.length-1; x++ ) {
    y = map(ys[x], -2.4, 2.4, height, 0);
    line(x-1, py, x, y);
    py = y;
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("wfunc.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
