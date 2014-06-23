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
