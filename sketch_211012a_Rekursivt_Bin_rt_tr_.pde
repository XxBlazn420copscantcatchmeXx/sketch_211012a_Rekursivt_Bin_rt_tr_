float vinkel;
int antal;
int max;
boolean useMax;

void setup(){
  size(1200, 900);
  background(51);
  vinkel = PI/8;
  antal = 0;
  max = 1;
  useMax = true;
  tegnGren(width/2, height, height/4.5, 0);
}

void draw(){
  antal = 0;
  background(51);
  vinkel = mouseX / (float)width;
  tegnGren(width/2, height, height/5, 0);
}

void keyPressed(){
  max++;
}

void tegnGren(float x, float y, float l, float v){
  if(useMax && antal >= max){
    return;
  }
  
  // Grønne blade
  float blade = (mouseY / (float) height) * 200;
  if(l < blade){
    stroke(0, 255, 0);
  }
  // Brunt træ
  else{
    stroke(97, 73, 45);
  }
  
  // Tykkelse afhænger af længden
  strokeWeight(l/20);
  
  // Lodret vektor, der bliver roteret med vinklen v
  PVector grenVector = new PVector(0, l).rotate(v);
  float endX = x+grenVector.x;
  float endY = y-grenVector.y;
  
  line(x, y, endX, endY);
  
  if(useMax){
    antal++;
  }
  
  // Udregn længden for næste
  float l2 = l*0.8;
  
  // Stop når længden bliver kortere end 10
  if(l2 < 10){
    return;
  }
  
  // Tegn højre gren
  tegnGren(endX, endY, l2, v-vinkel);
  // Tegn venstre gren
  tegnGren(endX, endY, l2, v+vinkel);
}
