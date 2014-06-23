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
  if (letterCase == '3'){
    fill(0);
  }
 else{
   fill(255);
 } 
  
  int ySize = y;

  textSize(tSize);
  textAlign(CENTER);
  textFont(fonts.get(1));
//  fill(255);
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


void showTextCursor(JSONObject poema, int x, int y, int tSize, PFont boo) {
  if (letterCase == '3'){
    fill(0);
  }
 else{
   fill(255);
 } 
  
  pushMatrix();
  char[] letters;
  float totalOffset = 0;
  letters = poema.getString("verso1").toCharArray();

  int ySize = y;

  //  translate((width - totalOffset) / 2, 0);
  totalOffset = 0;
  float firstWidth = (width / letters.length) / 4.0;
  //  translate(firstWidth, 0);
  //  translate(0, 0);
  for (int i = 0; i < letters.length; i++) {
    float distance = abs(totalOffset - mouseX);
    distance = constrain(distance, 24, 60);
    textSize(84 - distance);
    

    text(letters[i], x, ySize);




    float letterWidth = textWidth(letters[i]);
    if (i != letters.length - 1) {
      totalOffset = totalOffset + letterWidth;
      translate(letterWidth, 0);
    }
  }
  popMatrix();

  textFont(fonts.get(1));
//  fill(255);
  //  text(poema.getString("verso1").toUpperCase(), x, ySize);
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


  //  translate(0, 0);
  //  textSize(tSize);
  ////  textAlign(RIGHT);
  //  textFont(fonts.get(1));
  //  fill(255);
  ////  text(poema.getString("verso1").toUpperCase(), x, ySize);
  //  ySize += tSize;
  //  text(poema.getString("verso2").toUpperCase(), x, ySize);
  //  ySize += tSize;
  //  text(poema.getString("verso3").toUpperCase(), x, ySize);
  //  ySize += tSize;
  //  text(poema.getString("verso4").toUpperCase(), x, ySize);
  //  ySize += tSize;
  //  text(poema.getString("verso5").toUpperCase(), x, ySize);
  //  ySize += tSize;
  //  text(poema.getString("verso6").toUpperCase(), x, ySize);
  //  ySize += tSize;
  //  text(poema.getString("verso7").toUpperCase(), x, ySize);
  //  ySize += tSize;
  //  text(poema.getString("verso8").toUpperCase(), x, ySize);
}

