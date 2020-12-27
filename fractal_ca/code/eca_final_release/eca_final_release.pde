/* Elementary Cellular Automaton */
final float SQSIZE = 8.0;  // セルの描画サイズ
int[] cells;               // セル状態を保持する配列

void setup() {
    size(800, 400);
    noLoop();
    stroke(128);
}

void draw() {
    initCells();
    for ( int i = 0; i < height/SQSIZE; i++ ) {
        drawCells(i);
        updateCells();
    }
}

void initCells() {    /* セルの初期化 */
    cells = new int[(int)(width/SQSIZE)];           // 表示ウィンドウに入るだけ
    for ( int i = 0; i < cells.length; i++ ) {
        cells[i] = ( i == cells.length/2 )? 1 : 0;  // 中央のセルのみ1，それ以外は0
    }
    return ;
}

int update(int l, int t, int r) {    /* 状態遷移 */
    int[] rule150 = {0, 1, 1, 0, 1, 0, 0, 1};  // ルール150の次の状態の数を持つ配列
    int binnum = 4*l + 2*t + 1*r;              // 三つのセルの状態の並びを二進数として見たときの数 (0...7)

    return rule150[binnum];
}

void updateCells() {    /* 世代更新 */
    /* 遷移前のセル状態の保存 */
    int[] cpcells = new int[cells.length];      // 遷移前のセル状態を保持する配列
    for ( int i = 0; i < cells.length; i++ ) {
        cpcells[i] = cells[i];
    }
    /* 世代更新 (全セルの状態遷移) */
    for ( int i = 0; i < cells.length; i++ ) {
        cells[i] = update(cpcells[(i-1+cells.length)%cells.length], cpcells[i],
                          cpcells[(i+1)%cells.length]);
    }
    return ;
}

void drawCells(int gen) {    /* セルの描画 */
    for ( int i = 0; i < cells.length; i++ ) {
        fill((cells[i] == 1)? 0 : 255);        // セル状態が1ならば黒，そうでなければ白
        square(i*SQSIZE, gen*SQSIZE, SQSIZE);  // セルの描画
    }
    return ;
}



void keyPressed(){
  saveFrame("eca.png");
  System.exit(0);
}
