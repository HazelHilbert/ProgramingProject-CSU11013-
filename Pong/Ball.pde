class Ball {
  float x; float y;
  float dx; float dy;
  float speed = 1;
  int radius;
  color ballColor = color(200, 100, 50);
  
  Ball(){
    x = random(SCREENX/4, SCREENX/2);
    y = random(SCREENY/4, SCREENY/2);
    dx = random(1, 2); dy = random(1, 2);
    radius=5;
  }
  
  void setSpeed(float s){
    speed = s;
  }
  
  void move(){
    x = x+(dx*speed); y = y+(dy*speed);
  }

  void draw(){
    fill(ballColor);
    ellipse(int(x), int(y), radius, radius);
   }
  
  void collide(Player tp){
    if(y+radius >= tp.ypos && y-radius<tp.ypos+PADDLEHEIGHT && 
     x >=tp.xpos && x <= tp.xpos+PADDLEWIDTH){
       dy = -dy;
     }
   }
   void wallCollision(){
     if(x-radius <=0) dx=-dx;
     else if(x+radius>=SCREENX) dx=-dx;
   }
}
