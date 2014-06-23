/**
 * Loop. 
 * 
 * Shows how to load and play a QuickTime movie file.  
 *
 */
PFont f;

import processing.video.*;

Movie movie;

void setup() {
  size(640, 360);
  background(0);
  // Load and play the video in a loop
  movie = new Movie(this, "transit.mov");
  movie.loop();
  initTexto();
  initJson();
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  //if (movie.available() == true) {
  //  movie.read(); 
  //}
  drawing();
  //  background(102);
  showText(getPoema(), width/2, 50, 42, boo);
}

JSONObject getPoema() {
  if (frameCount%60 < 20) {
  return poema1;
  }
  
  else if (frameCount%60 > 40 ) {
    return poema2;
  }
  else {
    return poema3;
  }
}

void drawing(){
 
  
  if (frameCount%120 < 30) {
  image(movie, 0, 0, width, height);
  }
  
  else if (frameCount%120 > 90 ) {
    drawCanvas2();
  }
  else {
    drawCanvas1();
  }
  
}

//AffluentDemibold-48
PFont boo;
ArrayList <PFont> fonts;
//PFont mono;
// The font "AndaleMono-48.vlw"" must be located in the 
// current sketch's "data" directory to load successfully
//mono = loadFont("AndaleMono-32.vlw");
//background(0);
//textFont(mono);
//text("word", 12, 60);




void initTexto() {

  fonts = new ArrayList<PFont>();
//  boo =  loadFont("DFWaWaSC-W5-48.vlw");
  fonts.add(loadFont("DFWaWaSC-W5-48.vlw"));
  fonts.add(loadFont("Darkheart-Regular-48.vlw"));
  fonts.add(loadFont("YuGo-Medium-48.vlw"));
  
  
  
//  PFont font = fonts.get(0); 
//  printArray(PFont.list());
//  f = createFont("Georgia", 24);
  
}


void showText(JSONObject poema, int x, int y, int tSize, PFont boo) {

  int ySize = y;
  
  textSize(tSize);
  textAlign(CENTER);
  textFont(fonts.get(1));
  fill(255);
  text(poema.getString("verso1").toUpperCase(), x, ySize);
  ySize += tSize;
  text(poema.getString("verso2").toUpperCase(), x, ySize);
  ySize += tSize;
  text(poema.getString("verso3").toUpperCase(), x, ySize);
  ySize += tSize;
  text(poema.getString("verso4").toUpperCase(), x, ySize);
  ySize += tSize;
  text(poema.getString("verso5").toUpperCase(), x, ySize);
  ySize += tSize;
  text(poema.getString("verso6").toUpperCase(), x, ySize);
  ySize += tSize;
  text(poema.getString("verso7").toUpperCase(), x, ySize);
  ySize += tSize;
  text(poema.getString("verso8").toUpperCase(), x, ySize);
}

float inc = 0.06;
int density = 8;
float znoise = 0.0;

void drawCanvas1(){
 
 {
   
  float xnoise = 0.0;
  float ynoise = 0.0;
  for (int y = 0; y < height; y += density) {
    for (int x = 0; x < width; x += density) {
      float n = noise(xnoise, ynoise, znoise) * 256;
      fill(n);
//      rectMode(CORNER);
      rect(x, y, density, density);
      xnoise += inc;
    }
    xnoise = 0;
    ynoise += inc;
  }
  znoise += inc;
}
  
}
float angle = 0.0; // Changing angle
float speed = 0.05; // Speed of growth


void drawCanvas2() {
  background(0);
  
  circlePhase(0.0);
  circlePhase(QUARTER_PI);
  circlePhase(HALF_PI);
  angle += speed;
}
void circlePhase(float phase) {
  float diameter = 200 + (sin(angle + phase) * 45);
  fill(255,0,0);
  ellipse(width/2, height/2, diameter, diameter);
//  noFill();
}
JSONArray poemas;

JSONObject poema1, poema2, poema3;
void initJson() {

  poemas = loadJSONArray("_json/versos_aleixo.json");

  poema1 = poemas.getJSONObject(0);
  poema2 = poemas.getJSONObject(1);
  poema3 = poemas.getJSONObject(2);
}


