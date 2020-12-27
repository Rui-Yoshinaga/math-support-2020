/* elementary cellular automaton 1dim */

int[] cells;

void setup() {
  size(800, 150);
  background(240);
  noLoop();
  rectMode(CENTER);
}


void draw() {
  initCells();
  for ( int i = 0; i < 1; i++ ) {
    updateCells();
  }
  drawCells();
}


void initCells() {

  cells = new int[21];

  for ( int i = 0; i < cells.length; i++ ) {
    if ( i == cells.length/2  ) {
      cells[i] = 1;  // center cell == alive
    } else {
      cells[i] = 0;
    }
  }

  return ;
}


void updateCells() {

  int[] cpcells = new int[cells.length];  // copy of cells

  // copy
  for ( int i = 0; i < cells.length; i++ ) {
    cpcells[i] = cells[i];
  }

  // update
  cells[0] = update(0, cpcells[0], cpcells[1]);  // boundary : i = 0
  for ( int i = 1; i < cells.length-1; i++ ) {
    cells[i] = update(cpcells[i-1], cpcells[i], cpcells[i+1]);
  }
  cells[cells.length-1] = update(cpcells[cells.length-2], cpcells[cells.length-1], 0);  // boundary : i = cells.length

  return ;
}


int update(int l, int t, int r) {

  final int[] rule150 = {0, 1, 1, 1, 0, 0, 0};

  int binnum = 4*l + 2*t + 1*r;

  return rule150[binnum];
}


void drawCells() {

  final float SQSIZE = 30.0;
  final float GUTTER = (width - SQSIZE*cells.length) / 2;  // to center

  stroke(240);
  for ( int i = 0; i < cells.length; i++ ) {
    if ( cells[i] == 0 ) {  // dead
      fill(0);
    } else {  // alive
      fill(255);
    }
    square(i*SQSIZE+GUTTER, height/2, SQSIZE);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("eca1d.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
