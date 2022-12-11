class Player {
  int xpos; int ypos;
  int computerSpeed = 1;
  int lives;
  color paddlecolor = color(50);
  
  Player(int screen_y){
    xpos=SCREENX/2;
    ypos=screen_y;
    lives = 3;
  }
  
  void setComputerSpeed(int s){
    computerSpeed = s;
  }
  
  void move(int x){
    if(x > SCREENX-PADDLEWIDTH) xpos = SCREENX-PADDLEWIDTH;
    else xpos=x;
  }
  
  void moveComputer(int x){
    if(xpos > SCREENX-PADDLEWIDTH) xpos = SCREENX-PADDLEWIDTH;    
    if(xpos < 0) xpos = 0;
    if (x < xpos + PADDLEWIDTH/2) xpos-= computerSpeed;
    else xpos+= computerSpeed;
  }
  
  void draw(){
    fill(paddlecolor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
  }
}
