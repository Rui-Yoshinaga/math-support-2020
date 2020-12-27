/* self-affine fractal */

void setup() {
  size(800, 800);
  background(240);
  noLoop();
  noStroke();
  fill(0);
}


void draw() {
  safractal(0, 0, width, height, 6);
}


void safractal(float x, float y, float w, float h, int n) {

  if ( n <= 0 ) {
    rect(x, y, w, h);
    return ;
  }
  
  float nw = w / 2;
  float nh = h / 3;

  safractal(x, y, nw, nh, n-1);
  safractal(x+nw, y, nw, nh, n-1);
  safractal(x, y+nh, nw, nh, n-1);
  safractal(x, y+2*nh, nw, nh, n-1);
  safractal(x+nw, y+2*nh, nw, nh, n-1);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("self_affine.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
