Alien theAliens[];
Player thePlayer;
Bullet theBullet, theSecondBullet, theThirdBullet;
Powerups thePowerup;

PImage invader, exploding;
PImage powerup1, powerup2, powerup3;

PFont font;
color textColor = color(255);
int numberOfAliens = 10;

void settings(){
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
}

void setup(){
 noStroke(); 
 font = createFont("RetroGaming.ttf", 20);
 textFont(font);
 fill(textColor);
 textAlign(CENTER);
 
 invader = loadImage("invader.gif"); exploding = loadImage("exploding.gif");
 powerup1 = loadImage("powerup1.gif"); powerup2 = loadImage("powerup2.gif"); powerup3 = loadImage("powerup3.gif");

 theAliens = new Alien[numberOfAliens];
 init_array(theAliens);
 thePlayer = new Player(SCREEN_HEIGHT-BUFFER-PLAYER_HEIGHT);
 theBullet = new Bullet(-10); theSecondBullet = new Bullet(0); theThirdBullet = new Bullet(SCREEN_WIDTH);
 thePowerup = new Powerups(-100, 0, powerup1);
}

void draw(){
  background(0);
  
  thePlayer.move(mouseX-PLAYER_WIDTH/2); thePlayer.draw();
  
  thePowerup.draw(); thePowerup.move(); thePowerup.collide(thePlayer);
  
  if (thePlayer.hasPowerup == 1) theBullet.extraSpeed();
  if (thePlayer.hasPowerup == 2) theBullet.biggerBall();
  if (thePlayer.hasPowerup == 3) {   
    theSecondBullet.dx = -1;   
    theSecondBullet.move(); theSecondBullet.draw(); theSecondBullet.collide(theAliens);
    theThirdBullet.dx = 1;
    theThirdBullet.move(); theThirdBullet.draw(); theThirdBullet.collide(theAliens);
  }

  theBullet.move(); theBullet.draw(); theBullet.collide(theAliens);
  
  boolean lostGame = false;
  int aliveAliens = 0;
  for(int i=0; i<theAliens.length; i++) {
   if (theAliens[i].deathCount > 0) {
     aliveAliens++;
     theAliens[i].draw();
     if (theAliens[i].aBomb!= null) {
       if (theAliens[i].aBomb.collide(thePlayer)) lostGame = true;
       if (random(1000) < 1 && thePowerup.y >= SCREEN_HEIGHT){
         int randomPower = int(random(3)) + 1;
         if (randomPower == 1) thePowerup = new Powerups(theAliens[i].xpos + ALIEN_WIDTH/2, theAliens[i].ypos + ALIEN_HEIGHT, powerup1);
         if (randomPower == 2) thePowerup = new Powerups(theAliens[i].xpos + ALIEN_WIDTH/2, theAliens[i].ypos + ALIEN_HEIGHT, powerup2);
         if (randomPower == 3) thePowerup = new Powerups(theAliens[i].xpos + ALIEN_WIDTH/2, theAliens[i].ypos + ALIEN_HEIGHT, powerup3);
       }
     }
     if (theAliens[i].appearance == exploding) theAliens[i].deathCount--;
     theAliens[i].move();
   }
  }
  
  if (lostGame) {
    background(0);
    text("Game Over\nYou Lost", SCREEN_WIDTH/2, SCREEN_HEIGHT/2-20);
    noLoop();
  }
  if (aliveAliens == 0) {
    background(0);
    text("Game Over\nYou Won!", SCREEN_WIDTH/2, SCREEN_HEIGHT/2-20);
    noLoop();
  }
}

void mousePressed(){
 theBullet = new Bullet(thePlayer.xpos + PLAYER_WIDTH/2);
 if (thePlayer.hasPowerup == 3) {    
   theSecondBullet = new Bullet(thePlayer.xpos + PLAYER_WIDTH/2);
   theThirdBullet = new Bullet(thePlayer.xpos + PLAYER_WIDTH/2);
 }
}

void init_array(Alien theArray[]){
  int xpos = 0;
  for(int i=0; i<theArray.length; i++){
    theArray[i] = new Alien(xpos, BUFFER, invader);
    xpos += ALIEN_WIDTH + BUFFER;
  }
}
