import controlP5.*;

import unlekker.util.*;
import unlekker.modelbuilder.*;
import unlekker.modelbuilder.filter.*;
import ec.util.*;

public Pt pt[];
public int nx, ny, n;
public float step, fieldForce, velocity;
public PVector mousePos, mouseDelta;
public boolean drawLine=true;
public USimpleGUI gui;


void initCanvas3() {

  step=60;
  fieldForce=200;
  velocity=0.1f;
  mousePos=new PVector();
  mouseDelta=new PVector();

  initGUI();
  build();
}

void drawCanvas3() {

  float d, force, rad;

  background(255);

  fill(255);
  stroke(0);
  mousePos.set(mouseX, mouseY, 0);

  for (int i=0; i<n; i++) pt[i].update();

  // draw lines first
  if (drawLine) {
    for (int i=0; i<n; i++) pt[i].draw(true);
  }

  for (int i=0; i<n; i++) pt[i].draw(false);

//  gui.draw();
}


public void initGUI() {
  gui=new USimpleGUI(this);
  gui.addSlider("step", (int)step, 3, 90);
  gui.addSlider("fieldForce", fieldForce, 10, 400);    
  gui.addSlider("velocity", velocity, 0.01f, 1);    
  gui.addButton("build");
  gui.addToggle("drawLine", drawLine);
}

public void build() {
  nx=(int)((float)(width-50)/step);
  ny=(int)((float)(height-50)/step);
  n=nx*ny;

  float stepX=(float)(width-50)/nx;
  float stepY=(float)(height-50)/ny;

  pt=new Pt[n];

  for (int i=0; i<n; i++) {
    float idx=i%nx;
    float idy=i/nx;
    pt[i]=new Pt(idx*stepX+stepX/2+25, idy*stepY+stepY/2+25);
  }
}


class Pt {
  PVector oldPos, pos;
  float rad;

  Pt(float x, float y) {
    oldPos=new PVector(x, y);
    pos=new PVector(x,y);
    
    rad=step;
  }

  void update() {
    float force;
    
    if(!mousePressed && !gui.isMouseOver()) {
      // vector from position in field to mouse cursor
      mouseDelta.set(pos);
      mouseDelta.sub(mousePos);      
      float d=mouseDelta.mag();      
  
      if (d<fieldForce ) {
        force=sq(sq(1-d/fieldForce));
        
        // use velocity as a modifier to vary force
        force=force*(0.5+velocity*2);
        mouseDelta.mult(force);
        pos.add(mouseDelta);
      }
    }
    
    // reuse mouseDelta to move pos towards oldPos
    mouseDelta.set(oldPos);
    mouseDelta.sub(pos);
    mouseDelta.mult(velocity);
    
    // scale Y of the vector to cause asymmetrical movement 
    mouseDelta.y*=0.5f;
    
    pos.add(mouseDelta);
  }
  
  void draw(boolean isLine) {
    float theRad=rad*(1+pos.dist(oldPos)/50);
    
    stroke(255,0,0);
    if (isLine) {
      line(oldPos.x, oldPos.y, pos.x, pos.y);
      
    // fun graphic hack
      line(oldPos.x, oldPos.y, pos.x, pos.y+theRad/2);
      line(oldPos.x, oldPos.y, pos.x, pos.y-theRad/2);
      line(oldPos.x, oldPos.y, pos.x+theRad/2, pos.y);
      line(oldPos.x, oldPos.y, pos.x-theRad/2, pos.y);
      return;
    }

    
    stroke(0);
    noFill();
    ellipse(pos.x, pos.y, theRad, theRad);
  }
}


