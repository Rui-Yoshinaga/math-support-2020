/* elementary cellular automaton 2dim */

final float SQSIZE = 8.0;
int[] cells;

void setup() {
  //size(980, 490);
  size(800, 400);
  //background(255);
  noLoop();
  stroke(240);
}


void draw() {
  initCells();
  for ( int i = 0; i < height/SQSIZE; i++ ) {
    drawCells(i);
    updateCells();
  }
}


void initCells() {

  cells = new int[(int)(width/SQSIZE)];

  for ( int i = 0; i < cells.length; i++ ) {
    cells[i] = ( i == (int)(cells.length/2) )? 1 : 0;
    //cells[i] = ( random(2) < 1 )? 1 : 0;
  }

  return ;
}


void updateCells() {

  final int WCODE = 90;
  int[] cpcells = new int[cells.length];  // copy of cells

  // copy
  for ( int i = 0; i < cells.length; i++ ) {
    cpcells[i] = cells[i];
  }

  // update (rule=150[fix])
  //for ( int i = 0; i < cells.length; i++ ) {
  //  cells[i] = update(cpcells[(i-1+cells.length)%cells.length], cpcells[i], cpcells[(i+1)%cells.length]);
  //}

  // update (expanded)
  //cells[0] = update(cpcells[cpcells.length-1], cpcells[0], cpcells[1], WCODE);
  //for ( int i = 1; i < cells.length-1; i++ ) {
  //  cells[i] = update(cpcells[i-1], cpcells[i], cpcells[i+1], WCODE);
  //}
  //cells[cells.length-1] = update(cpcells[cpcells.length-2], cpcells[cpcells.length-1], cpcells[0], WCODE);
  for ( int i = 0; i < cells.length; i++ ) {
    cells[i] = update(cpcells[(i-1+cells.length)%cells.length], cpcells[i], cpcells[(i+1)%cells.length], WCODE);
  }

  return ;
}


int update(int l, int t, int r) {

  final int[] rule150 = {0, 1, 1, 0, 1, 0, 0, 1};  // 150 = b10010110

  int binnum = 4*l + 2*t + 1*r;

  return rule150[binnum];
}

int update(int l, int t, int r, int wcode) {

  int[] rule = new int[8];
  int binnum = 4*l + 2*t + 1*r;

  for ( int i = 0; i < rule.length; i++ ) {
    rule[i] = wcode % 2;
    wcode /= 2;
  }

  return rule[binnum];
}


void drawCells(int gen) {

  for ( int i = 0; i < cells.length; i++ ) {
    fill((cells[i] == 0)? 0 : 255);
    square(i*SQSIZE, gen*SQSIZE, SQSIZE);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("eca2d.png");
    System.exit(0);
  }
}
