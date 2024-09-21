// main file for sketch
//import the necessary libraries to use send, receive and understand OSC data
import oscP5.*;
//import netP5.*;

// OSC loading stuff
OscP5 o;
//NetAddress myRemoteLocation;


// Based on code by GeneKao (https://github.com/GeneKao)

ChildApplet child;
boolean mousePressedOnParent = false;

void settings() {
  size(320, 240, P3D);
  smooth();
}

void setup() {
  windowTitle("Main sketch");

  surface.setTitle("Hello World!");
  surface.setResizable(true);
  surface.setLocation(100, 100);

  child = new ChildApplet();
}

void draw() {
  background(250);
  if (mousePressed) {
    fill(0);
    text("Mouse pressed on parent.", 10, 10);
    fill(0, 240, 0);
    ellipse(mouseX, mouseY, 60, 60);
    mousePressedOnParent = true;
  } else {
    fill(20);
    ellipse(width/2, height/2, 60, 60);
    mousePressedOnParent = false;
  }
  box(100);
  if (child.mousePressed) {
    text("Mouse pressed on child.", 10, 30);
  }
}

class ChildApplet extends PApplet {
  //JFrame frame;

  public ChildApplet() {
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(400, 400, P3D);
    smooth();
  }
  public void setup() { 
    windowTitle("Child sketch");
  }

  public void draw() {
    background(0);
    if (mousePressed) {
      fill(240, 0, 0);
      ellipse(mouseX, mouseY, 20, 20);
      fill(255);
      text("Mouse pressed on child.", 10, 30);
    } else {
      fill(255);
      ellipse(width/2, height/2, 20, 20);
    }

    box(100, 200, 100);
    if (mousePressedOnParent) {
      fill(255);
      text("Mouse pressed on parent", 20, 20);
    }
  }
}
