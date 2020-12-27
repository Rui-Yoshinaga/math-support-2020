/* fractal H-I de Rivera */

void setup() {
  size(800, 800);
  background(240);
  noLoop();
  noStroke();
  fill(0);
}


void draw() {
  hi_de_rivera(0, 0, width, 6);
}


void hi_de_rivera(float x, float y, float l, int n) {

  if ( n <= 0 ) {
    square(x, y, l);
    return ;
  }

  float nl = l / 3;

  hi_de_rivera(x, y, nl, n-1);
  hi_de_rivera(x+2*nl, y, nl, n-1);
  hi_de_rivera(x, y+nl, nl, n-1);
  hi_de_rivera(x+nl, y+nl, nl, n-1);
  hi_de_rivera(x+2*nl, y+nl, nl, n-1);
  hi_de_rivera(x, y+2*nl, nl, n-1);
  hi_de_rivera(x+2*nl, y+2*nl, nl, n-1);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("fractal_H-I_de_Rieva.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
