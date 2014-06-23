/**
 * Loop. 
 * 
 * Shows how to load and play a QuickTime movie file.  
 *
 */
PFont f;
char letterCase = '1';

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

  initCanvas3();
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  //if (movie.available() == true) {
  //  movie.read(); 
  //}
  drawingCase();
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

void drawing() {


  if (frameCount%300 < 100) {
    image(movie, 0, 0, width, height);
  }

  else if (frameCount%120 > 90 ) {
    drawCanvas3();
  }
  else {
    drawCanvas1();
  }
}

void drawingCase() {



  switch(letterCase) {
  case '0': 
    image(movie, 0, 0, width, height);
    break;
  case '1': 
    drawCanvas1();
    break;
  case '2': 
    drawCanvas2();
    break;
  case '3': 
    drawCanvas3();
    break;
  default:
    image(movie, 0, 0, width, height);
    break;
  }
}

void keyPressed() {

  if (key == '1') {
    letterCase = '1';
    println(letterCase);
  } 
  else if (key == '2') {
    letterCase = '2';
    println(letterCase);
  }
    else if (key == '3') {
    letterCase = '3';
    println(letterCase);
  }
    else if (key == '0') {
    letterCase = '0';
    println(letterCase);
  }
  else{
   letterCase = '0';
   println(letterCase);
  }
} 

