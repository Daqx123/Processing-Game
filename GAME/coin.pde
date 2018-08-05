class fallingObject {
  int x,y;
  int fallingSpeed = 5;
  int w = 20;
  int h = 20;
  
  public fallingObject(){
    x = int(random(20,470));
    
    // This ensures that no bomb and coin will be dropped from the same x value
    if(x < x+30 || x > x-30) x = int(random(20,470));
  }

  
  //Thats how coins move
  void move() {
    y = y + fallingSpeed;
  }

  void update() {
     if(y > 400) {
       if(dist(x,y,mouseX,500)<=30){
         coins.remove(this);
         cDropped++;
         if(levels == 5){
            coins.add(new fallingObject());
         }
         score++;
       } else if(y > 600) {
         coins.remove(this);
         cDropped++;
         coinMissed = true;
       }
    }
  }
  
  void bombUpdate() {
     if(y > 400) {
       if(dist(x,y,mouseX,500)<=30){
         bombs.remove(this);
         bombCaught = true;
         
       } else if(y > 600) {
         bombs.remove(this);
         cDropped++;
         score++;
       }
    }
  }
  

  void showCoin() {
    move();
    image(redApple, x-9, y-9, w, h);
  }
  void showBomb() {
    move();
    image(bomb, x-9, y-9, w, h);
  }

}
  
