/* quadratic koch curve (type1) */

void setup() {
  size(800, 500);
  background(240);
  noLoop();
}


void draw() {
  final float dx = 50, dy = 100;
  translate(width/2, height/2);
  rotate(PI);
  translate(-width/2, -height/2);
  qkochcurve(dx, dy, width-dx, dy, 6);
}


void qkochcurve(float lx, float ly, float rx, float ry, int n) {

  if ( n <= 0 ) {
    line(lx, ly, rx, ry);
    return ;
  }

  float dx = rx - lx;
  float dy = ry - ly;

  qkochcurve(lx, ly, lx+dx/3, ly+dy/3, n-1);
  qkochcurve(lx+dx/3, ly+dy/3, lx+dx/3-dy/3, ly+dy/3+dx/3, n-1);
  qkochcurve(lx+dx/3-dy/3, ly+dy/3+dx/3, rx-dx/3-dy/3, ry-dy/3+dx/3, n-1);
  qkochcurve(rx-dx/3-dy/3, ry-dy/3+dx/3, rx-dx/3, ry-dy/3, n-1);
  qkochcurve(rx-dx/3, ry-dy/3, rx, ry, n-1);


  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("quad_koch_curve1.png");
    System.exit(0);
  }
}
