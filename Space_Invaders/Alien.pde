class Alien {
  int xpos, ypos;
  PImage appearance;
  int direction = A_FORWARD;
  int i = 0;
  int deathCount = 30;
  Bomb aBomb;
  
 Alien(int xpos, int ypos, PImage alienImage){
  this.xpos = xpos;
  this.ypos = ypos;
  appearance = alienImage;
 }
 
 void explode(PImage explodingImage){
   appearance = explodingImage;
 }
  
 void move(){
  if (direction == A_DOWN) {ypos++; i++;}
  else if (direction == A_FORWARD) xpos++;
  else if (direction == A_BACKWARD) xpos--;

  if ((xpos + appearance.width >= SCREEN_WIDTH || xpos <= 0) && i < appearance.height) direction = A_DOWN;
  else if (xpos <= 0) {direction = A_FORWARD; i = 0;}
  else if (xpos + appearance.width >= SCREEN_WIDTH) {direction = A_BACKWARD; i = 0;}  
 
  if (random(750) < 1) getBomb();
  if (aBomb != null) {
    aBomb.draw();
    aBomb.move();
  }
 }
 
 Bomb getBomb(){
   if (aBomb == null || aBomb.offScreen()) {
     aBomb = new Bomb(xpos + ALIEN_WIDTH/2, ypos + ALIEN_HEIGHT);
     return aBomb;
   }
   else return aBomb;
 }
  
  void draw(){
    image(appearance, xpos, ypos);
  }
}
