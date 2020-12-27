/* Sierpinski curve */

void setup() {
  size(800, 800);
  background(240);
  noLoop();
  strokeWeight(2);
}


void draw() {

  final float l = 180;

  translate(width/2, height/2);
  for ( int i = 0; i < 4; i++ ) {
    scurve(l, l, l, 2);
    rotate(HALF_PI);
  }
}


void scurve(float x, float y, float l, int n) {

  if ( n <= 0 ) {
    sline(x, y, l);
    return ;
  }

  final float dt = HALF_PI;

  pushMatrix();
  translate(x, y);
  rotate(-HALF_PI);
  for ( int i = 0; i < 3; i++ ) {
    scurve(l/2, l/2, l/2, n-1);
    rotate(dt);
  }
  ccurve(l/2, l/2, l/2, n-1);
  popMatrix();

  return ;
}


void ccurve(float x, float y, float l, int n) {

  if ( n <= 0 ) {
    cline(x, y, l);
    return ;
  }

  ccurve(x-l/2, y-l/2, l/4, n-1);

  return ;
}


void sline(float x, float y, float l) {

  line(x, y-l, x, y-l/2);
  line(x, y-l/2, x+l/2, y);
  line(x+l/2, y, x, y+l/2);
  line(x, y+l/2, x-l/2, y);
  line(x-l/2, y, x-l, y);

  return ;
}


void cline(float x, float y, float l) {

  line(x, y-l, x, y-l/2);
  line(x, y-l/2, x+l/2, y);
  line(x+l/2, y, x+l, y);
  line(x, y+l, x, y+l/2);
  line(x, y+l/2, x-l/2, y);
  line(x-l/2, y, x-l, y);

  return ;
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("sierpinski_curve.png");
    System.exit(0);
  }
}
