class Bullet {
  float x, y;
  float dx, dy;
  float speed = 1;
  int radius;
  color ballColor = color(255);
  
  Bullet(float paddlePosition){
    x = paddlePosition;
    y = SCREEN_HEIGHT-BUFFER-PLAYER_HEIGHT;
    dx = 0; dy = -2;
    radius = 4;
  }
  
  void setSpeed(float s){
    speed = s;
  }
  
  void move(){
    x = x+(dx*speed); y = y+(dy*speed);
  }
  
  void noPowerup(){
    speed = 1;
    radius = 7;
  }
  
  void extraSpeed(){
    speed = 5;
  }
  
  void biggerBall(){
    radius = 10;
  }
  
  void draw(){
    fill(ballColor);
    ellipse(int(x), int(y), radius*2, radius*2);
   }
   
  void collide(Alien[] aliens){
    for(int i=0; i<aliens.length; i++) {
      if (y+radius <= aliens[i].ypos + ALIEN_HEIGHT && y-radius >= aliens[i].ypos && 
        ((x-radius >= aliens[i].xpos && x-radius <= aliens[i].xpos + ALIEN_WIDTH) ||
        (x+radius >= aliens[i].xpos && x+radius <= aliens[i].xpos + ALIEN_WIDTH)))
        aliens[i].explode(exploding);
      }
   }
   void wallCollision(){
     if(x-radius <=0) dx=-dx;
     else if(x+radius>=SCREEN_WIDTH) dx=-dx;
   }
   
}
