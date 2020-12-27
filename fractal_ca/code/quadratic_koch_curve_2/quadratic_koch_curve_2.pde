/* quadratic koch curve (type2): Minkowski sausage */

void setup() {
  size(800, 600);
  background(240);
  noLoop();
}


void draw() {
  final float dx = 50;
  qkochcurve(dx, height/2, width-dx, height/2, 5);
}


void qkochcurve(float lx, float ly, float rx, float ry, int n) {

  if ( n <= 0 ) {
    line(lx, ly, rx, ry);
    return ;
  }

  float dx = rx - lx;
  float dy = ry - ly;

  qkochcurve(lx, ly, lx+dx/4, ly+dy/4, n-1);
  qkochcurve(lx+dx/4, ly+dy/4, lx+dx/4-dy/4, ly+dy/4+dx/4, n-1);
  qkochcurve(lx+dx/4-dy/4, ly+dy/4+dx/4, lx+dx/2-dy/4, ly+dy/2+dx/4, n-1);
  qkochcurve(lx+dx/2-dy/4, ly+dy/2+dx/4, lx+dx/2, ly+dy/2, n-1);
  qkochcurve(rx-dx/2, ry-dy/2, rx-dx/2+dy/4, ry-dy/2-dx/4, n-1);
  qkochcurve(rx-dx/2+dy/4, ry-dy/2-dx/4, rx-dx/4+dy/4, ry-dy/4-dx/4, n-1);
  qkochcurve(rx-dx/4+dy/4, ry-dy/4-dx/4, rx-dx/4, ry-dy/4, n-1);
  qkochcurve(rx-dx/4, ry-dy/4, rx, ry, n-1);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("quad_koch_curve2.png");
    System.exit(0);
  }
}
