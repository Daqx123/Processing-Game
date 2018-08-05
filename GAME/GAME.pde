PImage gameBackground, menuBackground, character, redApple, bomb;
// ArrayList that will store coins
ArrayList <fallingObject> coins = new ArrayList <fallingObject> ();
ArrayList <fallingObject> bombs = new ArrayList <fallingObject> ();
//initialising the basket
basket b = new basket();
int score = 0; 
int panels = 0;
int coinSwitch = 0;
int levels = 1;
int cDropped = 0;
int dropSpeedCoins = 50;
int dropSpeedBombs = 70;
boolean coinMissed = false;
boolean bombCaught = false;

PFont menuFont, exitFont;

void setup() {
  smooth();
  size(500, 680);
  gameBackground = loadImage("keele_woods.jpg");
  menuBackground = loadImage("menu_background.jpg");
  character = loadImage("hog.png");
  redApple = loadImage("red_apple.png");
  bomb = loadImage("bomb.png");
  menuFont = loadFont("Harrington-55.vlw");
  exitFont = loadFont("Harrington-44.vlw");

  frameRate(60);
}



void draw() { 
  image(menuBackground, 0, 0);

  switch(panels) {
  case 0: menu(); break;
  case 1: play(); break;
  case 2: options(); break;
  case 3: rules(); break;
  case 4: credits(); break;
  case 5: leave(); break;
  case 6: level(); break;

  
  }
} 


// ---------------------------- Menu --------------------------------
void menu() {
  println("->menu");
  textFont(menuFont);
  fill(224,224,224);
  image(menuBackground, 0, 0);
  
  text("Play", 190, 240);
  text("Options", 150, 320);
  text("Rules", 170, 400);
  text("Credits", 160, 480);
  text("Exit", 190, 560);
  
  if (dist(mouseX, mouseY, 240, 225)<30) {
    fill(102, 178, 255);
    text("Play", 190, 240);
    if (mousePressed) {
      panels = 6;
    }
  }
  if (dist(mouseX, mouseY, 215, 310)<35 || dist(mouseX, mouseY, 280, 310)<35) {
    fill(102, 178, 255);
    text("Options", 150, 320);
    if (mousePressed) {
      panels = 2;
    }
  }
  if (dist(mouseX, mouseY, 240, 390)<35 || dist(mouseX, mouseY, 170, 380)<35 || dist(mouseX, mouseY, 320, 390)<35) {
    fill(102, 178, 255);
    text("Rules", 170, 400);
    if (mousePressed) {
      panels = 3;
    }
  }
  if (dist(mouseX, mouseY, 210, 470)<35 || dist(mouseX, mouseY, 280, 470)<35) {
    fill(102, 178, 255);
    text("Credits", 160, 480);
    if (mousePressed) {
      panels = 4;
    }
  }
  if (dist(mouseX, mouseY, 250, 550)<39) {
    fill(102, 178, 255);
    text("Exit", 190, 560);
    if (mousePressed) {
      panels = 5;
    }
  }
}





// ------------------- Game --------------------------------------
void play() {
  image(gameBackground, 0, 0);
  b.showBasket();
  switch (levels) {
    // ------------ Level 1 --------------
  case 1: 
  dropSpeedCoins = 50;
    dropCoin(); 
      if(cDropped == 25){
      cDropped = 0;
      levels++;
      panels = 6;
    }
    break;
    // ------------ Level 2 --------------
  case 2:
    dropSpeedCoins = 25;
    dropCoin();
    if(cDropped == 50){
      cDropped = 0;
      panels = 6;
      levels++;
    }
    if(coinMissed == true){
      panels = 6;
      levels = 6;
      coinMissed = false;
      delay(100);
    }
   
    break;
    
    // ------------ Level 3 --------------
  case 3: 
    dropBomb();
    dropSpeedBombs = 25;
    if(cDropped == 50){
      cDropped = 0;
      panels = 6;
      levels++;
    }
    if(bombCaught == true){
      panels = 6;
      levels = 6;
      bombCaught = false;
      delay(100);
    }
    break; 
    // ------------ Level 4 --------------
  case 4:
    dropBomb();
    dropCoin();
    
    dropSpeedCoins = 50;
    dropCoin(); 
      if(cDropped == 25){
      cDropped = 0;
      levels++;
      panels = 6;
    }
    dropSpeedBombs = 70;
    if(bombCaught == true){
      panels = 6;
      levels = 6;
      delay(100);
      bombCaught = false;
    }
    break;
    // ------------ Level 5 --------------
  case 5: 
    dropCoin();
    dropBomb();
    dropSpeedCoins = 30;
    dropCoin();
    if(cDropped == 35){
      cDropped = 0;
      panels = 6;
      levels = 7;
    }
    if(coinMissed == true){
      panels = 6;
      levels = 6;
      coinMissed = false;
      delay(100);
    }
   dropBomb();
    dropSpeedBombs = 55;
    if(bombCaught == true){
      panels = 6;
      levels = 6;
      bombCaught = false;
      delay(100);
    }
    break;
    }
 
  

  for (int i=coins.size()-1; i>=0;i--) {
    fallingObject c = coins.get(i);
    c.update();
    c.showCoin();
  }
    for (int j=bombs.size()-1; j>=0;j--) {
    fallingObject q = bombs.get(j);
    q.bombUpdate();
    q.showBomb(); 
  }
  
    gameGUI();
}


void dropCoin() {
  if (frameCount % dropSpeedCoins == 0) {
    coins.add(new fallingObject());
  }  
}

void dropBomb() {
  if (frameCount % dropSpeedBombs == 0){
    bombs.add(new fallingObject());
  }
}


void gameGUI() {
  fill(0,0,0);
  textSize(30);
  text("Score: " + score, 30, 30);
  fill(153,76,0);
  rect(0,600,600,100);
  fill(0,0,0);
  textSize(44);
  text("Menu", 15, 650);
  if (dist(mouseX, mouseY, 35, 635)<39) {
    fill(102, 178, 255);
    text("Menu", 15, 650);
    if (mousePressed) {
      panels = 0;
      levels--;
      delay(100);
      }
  }
  noFill(); 
}


// ----------------------- Options -------------------------------
void options() {
}

// -------------------------- pre-Level ------------------------------
void level() {
  image(menuBackground, 0, 0);
  fill(224,224,224);
  
  switch(levels) {
    case 1: 
    textSize(44);
    text("Level " + levels, 160, 240);
    textSize(25);
    String infoLevel1 = "Move the character with your mouse. catch red apples, avoid black bombs.";
    text(infoLevel1, 130, 290, 200, 300);  
    textSize(44);
    startButton();
    break;
    
    case 2: 
    textSize(44);
    text("Level " + levels, 160, 240);
    textSize(25);
    String infoLevel2 = "Catch ALL red apples. If you fail your Level will be degraded to level 1.";
    text(infoLevel2, 130, 290, 200, 300);  
    textSize(44);
    startButton();
    break;
    
    case 3: 
    textSize(44);
    text("Level " + levels, 160, 240);
    textSize(25);
    String infoLevel3 = "Avoid Bombs. If you fail your Level will be degraded to level 1.";
    text(infoLevel3, 130, 290, 200, 300);  
    textSize(44);
    startButton();
    break;
    
    case 4: 
    textSize(44);
    text("Level " + levels, 160, 240);
    textSize(25);
    String infoLevel4 = "Avoid Bombs. Catch red appples.";
    text(infoLevel4, 130, 290, 200, 300);  
    textSize(44);
    startButton();
    break;
    
    case 5: 
    textSize(44);
    text("Level " + levels, 160, 240);
    textSize(25);
    String infoLevel5 = "Avoid Bombs. Catch ALL Red apples. If you fail your Level will be degraded to level 1.";
    text(infoLevel5, 130, 290, 200, 300);  
    textSize(44);
    startButton();
    break;
    
    case 6: 
    textSize(44);
    text("Fail", 160, 240);
    textSize(25);
    String infoLevel6 = "You have failed. Your levels has been degraded to 1.";
    text(infoLevel6, 130, 290, 200, 300);  
    textSize(44);
    text("Menu", 180, 560);
    if (dist(mouseX, mouseY, 195, 550)<39) {
    fill(102, 178, 255);
    text("Menu", 180, 560);
    if (mousePressed) {
      panels = 0;
      delay(100);
      levels = 1;
      }
  }
  break;
  
  case 7: 
    textSize(44);
    text("You Won!", 160, 240);
    textSize(25);
    String infoLevel7 = "You have won the game!";
    text(infoLevel7, 130, 290, 200, 300);  
    textSize(44);
    text("Menu", 180, 560);
    if (dist(mouseX, mouseY, 195, 550)<39) {
    fill(102, 178, 255);
    text("Menu", 180, 560);
    if (mousePressed) {
      panels = 0;
      delay(100);
      levels = 1;
      }
  }
    break;


    
  
}
}

void startButton(){
  text("Start!", 180, 560);
  if (dist(mouseX, mouseY, 250, 550)<39) {
    fill(102, 178, 255);
    text("Start!", 180, 560);
    if (mousePressed) {
      panels = 1;
      delay(100);
      }
  }
}


// ------------------ Rules --------------------------------
 void rules() {
  image(menuBackground, 0, 0);
  fill(224,224,224);
  text("Back", 180, 560);

  if (dist(mouseX, mouseY, 250, 550)<39) {
    fill(102, 178, 255);
    text("Back", 180, 560);
    if (mousePressed) {
      panels = 0;
      delay(100);
    }
  }
}

// -------------------------- Credits -----------------------------
void credits() {
  println("->credits");
  image(menuBackground, 0, 0);
  fill(224,224,224);
  text("Back", 180, 560);

  if (dist(mouseX, mouseY, 250, 550)<39) {
    fill(102, 178, 255);
    text("Back", 180, 560);
    if (mousePressed) {
      panels = 0;
      delay(100);
    }
  }
}


// ------------------------- Exit the Game --------------------------
void leave() {
  println("->exit");
  image(menuBackground, 0, 0);
  textFont(exitFont);
  fill(224,224,224);
  text("Are you Sure?", 100, 280);
  text("Yes...", 200, 390);
  text("No!", 200, 480);

  if (dist(mouseX, mouseY, 230, 380)<35) {
    fill(102, 178, 255);
    text("Yes...", 200, 390);
    if (mousePressed) {
      exit();
    }
  }
  if (dist(mouseX, mouseY, 230, 480)<35) {
    fill(102, 178, 255);
    text("No!", 200, 480);
    if (mousePressed) {
      panels = 0;
      delay(100);
    }
  }
}





