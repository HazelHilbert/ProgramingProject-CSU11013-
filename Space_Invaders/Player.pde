class Player {
  int xpos, ypos;
  int computerSpeed = 1;
  int lives;
  color paddlecolor = color(255);
  int hasPowerup = 0;
  
  Player(int screen_y){
    xpos=SCREEN_WIDTH/2;
    ypos=screen_y;
    lives = 3;
  }
  
  void setComputerSpeed(int s){
    computerSpeed = s;
  }
  
  void gainPowerup(int powerup){
    hasPowerup = powerup;
  }
  
  void move(int x){
    if(x > SCREEN_WIDTH-PLAYER_WIDTH) xpos = SCREEN_WIDTH-PLAYER_WIDTH;
    else xpos=x;
  }
  
  void moveComputer(int x){
    if(xpos > SCREEN_WIDTH-PLAYER_WIDTH) xpos = SCREEN_WIDTH-PLAYER_WIDTH;    
    if(xpos < 0) xpos = 0;
    if (x < xpos + PLAYER_WIDTH/2) xpos-= computerSpeed;
    else xpos+= computerSpeed;
  }
  
  void draw(){
    fill(paddlecolor);
    rect(xpos, ypos, PLAYER_WIDTH, PLAYER_HEIGHT);
  }
}
