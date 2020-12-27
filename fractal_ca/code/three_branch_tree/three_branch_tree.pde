/* 3 branch tree */

void setup() {
  size(800, 800);
  background(240);
  noLoop();
}


void draw() {
  final float l = 740;
  //tbranchtree(width/2, height/2+l/2, l, 10);
  tbranchtree_asy(width/2, height/2+l/2, l, 10);
}


void tbranchtree(float x, float y, float l, int n) {

  if ( n <= 0 ) {
    return ;
  }

  pushMatrix();
  translate(x, y-l/2);
  line(0, 0, 0, l/2);
  tbranchtree(0, 0, l/2, n-1);
  rotate(-HALF_PI);
  tbranchtree(0, 0, l/2, n-1);
  rotate(-PI);
  tbranchtree(0, 0, l/2, n-1);
  popMatrix();

  return ;
}


void tbranchtree_asy(float x, float y, float l, int n) {

  if ( n <= 0 ) {
    return ;
  }

  pushMatrix();
  translate(x, y-l/2);
  line(0, 0, 0, l/2);
  tbranchtree_asy(0, 0, l/2, n-1);
  rotate(-PI/3);
  tbranchtree_asy(0, 0, l/2, n-1);
  rotate(2*PI/3);
  tbranchtree_asy(0, 0, l/2, n-1);
  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("3_branch_tree_asy.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
