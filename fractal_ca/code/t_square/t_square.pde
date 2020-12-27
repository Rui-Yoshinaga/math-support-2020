/* T-square */

void setup() {
  size(800, 800);
  background(240);
  noLoop();
  rectMode(CENTER);
  noStroke();
  fill(0);
}


void draw() {
  tsquare(width/2, height/2, width/2, 9);
}


void tsquare(float x, float y, float l, int n) {

  if ( n <= 0 ) {
    return ;
  }

  float nl = l / 2;

  square(x, y, l);
  tsquare(x-nl, y-nl, nl, n-1);
  tsquare(x+nl, y-nl, nl, n-1);
  tsquare(x-nl, y+nl, nl, n-1);
  tsquare(x+nl, y+nl, nl, n-1);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("t_square.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
