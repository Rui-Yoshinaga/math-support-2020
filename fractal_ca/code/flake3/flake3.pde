/* triflake */

void setup() {
  size(800, 740);
  background(240);
  noLoop();
}


void draw() {
  triflake();
}


void triflake() {

  translate(width/2, height/2+90);

  float r = 220;
  for ( float t = PI/6; t < TWO_PI+PI/6; t += TWO_PI/3 ) {
    kochantiflake(r*cos(t), r*sin(t), r);
  }

  return ;
}


void kochantiflake(float x, float y, float l) {

  pushMatrix();
  translate(x, y);
  kochcurve(l*cos(PI/6), l*sin(PI/6), l*cos(5*PI/6), l*sin(5*PI/6), 7);
  kochcurve(l*cos(5*PI/6), l*sin(5*PI/6), l*cos(3*PI/2), l*sin(3*PI/2), 7);
  kochcurve(l*cos(3*PI/2), l*sin(3*PI/2), l*cos(PI/6), l*sin(PI/6), 7);
  popMatrix();

  return ;
}


void kochcurve(float lx, float ly, float rx, float ry, int n) {

  if ( n <= 0 ) {
    line(lx, ly, rx, ry);
    return ;
  }

  float dx = (rx - lx) / 3;
  float dy = (ry - ly) / 3;
  float cx = (lx + rx) / 2;
  float cy = (ly + ry) / 2;

  kochcurve(lx, ly, lx+dx, ly+dy, n-1);
  kochcurve(lx+dx, ly+dy, cx-sqrt(3)/2*dy, cy+sqrt(3)/2*dx, n-1);
  kochcurve(cx-sqrt(3)/2*dy, cy+sqrt(3)/2*dx, rx-dx, ry-dy, n-1);
  kochcurve(rx-dx, ry-dy, rx, ry, n-1);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("triflake.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
