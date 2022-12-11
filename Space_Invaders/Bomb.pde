class Bomb {
  float x, y;
  float dy;
  int radius;
  PImage appearance;
  int powerupCountdown = 3;
  color bombColor = color(255);
  
  Bomb(float alienx, float alieny){
    x = alienx;
    y = alieny;
    dy = 1;
    radius = 7;
  }
  
  void move(){
    y = y+dy;
  }

  void draw(){
    fill(bombColor);
    ellipse(int(x), int(y), radius, radius*2);  
  }
  
  boolean offScreen(){
    if (y > SCREEN_HEIGHT) return true;
    else return false;
  }
  
  boolean collide(Player player){
    if ((y + radius >= player.ypos && y - radius <= player.ypos + PLAYER_HEIGHT) &&
    ((x + radius/2 >= player.xpos && x + radius/2 <= player.xpos + PLAYER_WIDTH) || 
    (x - radius/2 >= player.xpos && x - radius/2 <= player.xpos + PLAYER_WIDTH))) {
      return true;
    }
    else return false;
   }
}
