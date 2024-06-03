int GameState = 0;
int PlayerX = 11;
int PlayerY = 11;
int score = 0;
int OX = int(random(1980/2));
int OY = int(random(1080/2));
int BX = int(random(1920/2));
int BY = int(random(1080/2));
ArrayList<Integer> playerTailX = new ArrayList<Integer>();
ArrayList<Integer> playerTailY = new ArrayList<Integer>();
ArrayList<Integer> playerTailXpre = new ArrayList<Integer>();
ArrayList<Integer> playerTailYpre = new ArrayList<Integer>();
int x = 0;
int y = 0;
void setup() {
  size(1980/2,1080/2);
  textSize(55);
  playerTailX.add(mouseX);
  playerTailY.add(mouseY);
  playerTailX.add(mouseX-10);
  playerTailY.add(mouseY-10);
  playerTailX.add(mouseX-20);
  playerTailY.add(mouseY-20);
  playerTailX.add(mouseX-30);
  playerTailY.add(mouseY-30);
  playerTailXpre.add(mouseX);
  playerTailYpre.add(mouseY);
  playerTailXpre.add(mouseX-10);
  playerTailYpre.add(mouseY-10);
  playerTailXpre.add(mouseX-20);
  playerTailYpre.add(mouseY-20);
  playerTailXpre.add(mouseX-30);
  playerTailYpre.add(mouseY-30);
}

void draw() {
  background(127,127,255);
  if(GameState==0){
    text("Click Anywhere To Start",width/2,height/2);
    if(mousePressed){
      GameState=1;
    }
  }
  else if(GameState==1){
    Display2(x,y);
    Display1();
    if (mouseY < 20){
      y+=11;
    }
    if (mouseY > height-20){
      y-=11;
    }
    if (mouseX < 20){
      x+=11;
    }
    if (mouseX > width-20){
      x-=11;
    }
    if(dist(OX, OY, playerTailX.get(0), playerTailY.get(0)) < 30){
      println("px: " + playerTailX.get(0));
      println("py: " + playerTailY.get(0));
      score++;
      OX = int(random(1920/2));
      OY = int(random(1080/2));
      playerTailX.add(mouseX);
      playerTailY.add(mouseY);
      playerTailXpre.add(mouseX);
      playerTailYpre.add(mouseY);
   }
   if (dist(BX,BY,playerTailX.get(0),playerTailY.get(0)) < 45 && playerTailY.size() >= 60){
     score++;
     text("Score: " + score, width-220, 55);
     BX = int(random(1920/2));
     BY = int(random(1080/2));
     playerTailX.add(mouseX);
     playerTailY.add(mouseY);
     playerTailXpre.add(mouseX);
     playerTailYpre.add(mouseY);
   }
   if (score < 100){
      text("Score: " + score, width-220, 55);
    }
    if(score>= 100){
      text("Score: " + score, width-235, 55);
     }
  }
}
void Display1(){
  //set previous position, then adjust display position
  for(int i = 1; i<playerTailY.size();i++){
    playerTailX.set(i,playerTailXpre.get(i-1));
    playerTailY.set(i,playerTailYpre.get(i-1));
  }
  for(int i = 0; i<playerTailY.size();i++){
    playerTailXpre.set(i,playerTailX.get(i));
    playerTailYpre.set(i,playerTailY.get(i));
  }
    fill(0,0,255);
    for(int i = playerTailY.size()-1; i>-1;i--){
      circle(playerTailX.get(i),playerTailY.get(i),10+playerTailY.size()-i);
      
      //playerTailYpre.set(i,playerTailYpre.get(i));
      
  }
}

void Display2(int centerX, int centerY){
  pushMatrix();
  translate(centerX, centerY);
  text("hi" ,width/2,height/2);
  circle(OX,OY,30);
  circle(BX,BY,60);
    //circle(PlayerX,PlayerY,121);
    if(playerTailX.get(0)<mouseX){
      playerTailX.set(0,playerTailX.get(0) + 11);
    }
    if(playerTailX.get(0)>mouseX){
      playerTailX.set(0,playerTailX.get(0) - 11);
    }
    if(playerTailY.get(0)<mouseY){
      playerTailY.set(0,playerTailY.get(0) + 11);
    }
    if(playerTailY.get(0)>mouseY){
      playerTailY.set(0,playerTailY.get(0) - 11);
    }
    popMatrix();
  
}
