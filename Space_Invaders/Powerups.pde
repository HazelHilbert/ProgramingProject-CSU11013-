class Powerups {
  float x, y;
  float dy;
  PImage appearance;
  int powerupCountdown = 3;
  
  Powerups(float alienx, float alieny, PImage powerupImage){
    x = alienx;
    y = alieny;
    dy = 2;
    appearance = powerupImage;
  }
  
  void move(){
    y = y+(dy);
  }

  void draw(){
    image(appearance, x, y);
  }
  
  void collide(Player player){
    if (y + POWERUP_HEIGHT >= player.ypos && x >= player.xpos && x + POWERUP_WIDTH <= player.xpos + PLAYER_WIDTH) {
        x = -100;
        if (appearance == powerup1) player.gainPowerup(1);
        if (appearance == powerup2) player.gainPowerup(2);
        if (appearance == powerup3) player.gainPowerup(3);
    }
   }
}
