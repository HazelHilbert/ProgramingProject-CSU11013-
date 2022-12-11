Player thePlayer; 
Player theComputer;
Ball theBall;
PFont font;
color textColor = color(255);

void settings(){
  size(SCREENX, SCREENY);
}

void setup(){
  thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
  theComputer = new Player(MARGIN);
  theBall = new Ball();
  ellipseMode(RADIUS);
  font = createFont("RetroGaming.ttf", 50);
  textFont(font);
}

void reset(){
  theBall.x = random(SCREENX/4, SCREENX/2);
  theBall.y = random(SCREENY/4, SCREENY/2);
  theBall.dx = 0;
  theBall.dy = 0;
}

void mousePressed(){
  if (theBall.dx == 0 && theBall.dy == 0){
    theBall.dx = random(1, 2); theBall.dy = random(1, 2);
  }
}

void draw(){
  if (theBall.y < 0){
    theComputer.lives--;
    theComputer.setComputerSpeed(theComputer.computerSpeed+=1);
    reset();
  }
  if (theBall.y > SCREENY){
    thePlayer.lives--;
    reset();
  }
  
  background(0);

  fill(textColor);
  textSize(20);
  text(theComputer.lives, 20, 40);
  text(thePlayer.lives, 20, SCREENY-40);
  
  theBall.setSpeed(theBall.speed += 0.0005);
  textSize(12);
  textAlign(LEFT);
  text("Speed: " + nf(theBall.speed, 1, 2), 20, SCREENY/2);
  
  if (theBall.dx == 0 && theBall.dy == 0){
    textSize(15);
    textAlign(CENTER);
    text("Press the mouse", SCREENX/2, SCREENY*5/8);
  }
  
  thePlayer.move(mouseX);
  theComputer.moveComputer((int) theBall.x);
  theBall.move();
  
  theBall.collide(thePlayer);
  theBall.collide(theComputer);
  theBall.wallCollision();
  
  thePlayer.draw();
  theComputer.draw();
  theBall.draw();
   
  if (thePlayer.lives == 0){
    background(0);
    fill(textColor);
    text("Game Over\nYou Lost", SCREENX/2, SCREENY/2-20);
    noLoop();
  }
  if (theComputer.lives == 0){
    background(0);
    fill(textColor);
    text("Game Over\nYou Won", SCREENX/2, SCREENY/2-20);
    noLoop();
  }
}
