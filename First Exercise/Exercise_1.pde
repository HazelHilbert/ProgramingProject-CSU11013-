
final int HEIGHT = 300;
final int WIDTH = 300;

final color YELLOW = color(242, 210, 70);
final color GREEN = color(92, 201, 59);
final color BLUE = color(92, 201, 250);

final int SQUARE_SIZE = 50;


void setup(){
  size(300, 300);
  noStroke();  
}

// 1.1
/*
int xSquare1 = 50;
int xSquare2 = 75;
int xSquare3 = 100;
void draw() {
 background(255);
 fill(YELLOW);
 rect(xSquare1--, 50, SQUARE_SIZE, SQUARE_SIZE);
 fill(GREEN);
 rect(xSquare2++, 75, SQUARE_SIZE, SQUARE_SIZE);
 fill(BLUE);
 rect(100, xSquare3++, SQUARE_SIZE, SQUARE_SIZE);
}
*/

// 1.2
/*
int x = 0;
void draw() {
 background(255);
 fill(YELLOW);
 rect(x++, 50, SQUARE_SIZE, SQUARE_SIZE);
 if (x > WIDTH)
   x = 0;
}
*/

// 1.3
/*
int x1 = 0;
int x2 = -SQUARE_SIZE;
void draw() {
 background(255);
 fill(YELLOW);
 rect(x1++, 50, SQUARE_SIZE, SQUARE_SIZE);
 if (x1 + SQUARE_SIZE > WIDTH)
   rect(x2++, 50, SQUARE_SIZE, SQUARE_SIZE);
 if (x2 > 0){
   x1 = 0;
   x2 = -SQUARE_SIZE;
 }
}
*/

// 1.4
/*
int x1Square1 = 0;
int x2Square1 = -SQUARE_SIZE;
int x1Square2 = WIDTH - SQUARE_SIZE;
int x2Square2 = WIDTH;
void draw() {
 background(255);
 fill(YELLOW);
 rect(x1Square1++, 50, SQUARE_SIZE, SQUARE_SIZE);
 if (x1Square1 + SQUARE_SIZE > WIDTH)
   rect(x2Square1++, 50, SQUARE_SIZE, SQUARE_SIZE);
 if (x2Square1 > 0){
   x1Square1 = 0;
   x2Square1 = -SQUARE_SIZE;
 }

 fill(BLUE);
 rect(x1Square2--, 150, SQUARE_SIZE, SQUARE_SIZE);
 if (x1Square2 < 0)
   rect(x2Square2--, 150, SQUARE_SIZE, SQUARE_SIZE);
 if (x1Square2 + SQUARE_SIZE < 0){
  x1Square2 = WIDTH - SQUARE_SIZE;
  x2Square2 = WIDTH;
 }
}
*/


// 1.5

int x1Square1 = 0;
int x2Square1 = -SQUARE_SIZE;
int ySquare1 = 50;
int x1Square2 = WIDTH - SQUARE_SIZE;
int x2Square2 = WIDTH;
int ySquare2 = 150;

void draw() {
 background(255);
 fill(x2Square1, ySquare2, x1Square2);
 rect(x1Square1++, ySquare1, SQUARE_SIZE, SQUARE_SIZE);
 if (x1Square1 + SQUARE_SIZE > WIDTH)
   rect(x2Square1++, ySquare1, SQUARE_SIZE, SQUARE_SIZE);
 if (x2Square1 > 0){
   x1Square1 = 0;
   x2Square1 = -SQUARE_SIZE;
 }
 ySquare1 = round(10 * sin(x1Square1*(PI/180)*10) + 50);

 rect(x1Square2--, ySquare2, SQUARE_SIZE, SQUARE_SIZE);
 if (x1Square2 < 0)
   rect(x2Square2--, ySquare2, SQUARE_SIZE, SQUARE_SIZE);
 if (x1Square2 + SQUARE_SIZE < 0){
  x1Square2 = WIDTH - SQUARE_SIZE;
  x2Square2 = WIDTH;
 }
 ySquare2 = round(25 * sin(x1Square1*(PI/180)*5) + 150);
}
