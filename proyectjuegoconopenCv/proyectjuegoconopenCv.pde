import gab.opencv.*;
import processing.video.*;
import java.awt.*;

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Capture video;
OpenCV opencv;
Box2DProcessing box2d;

ArrayList<Box> boxes;
ArrayList<estrella> estrellas;
ArrayList<Boundary> boundaries;

float x=150;
float y=220;
float noa=3;

void setup() {
  size(640, 480);

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -8);

  boxes = new ArrayList<Box>();
  boxes.add(new Box(this.x, this.y));
  estrellas = new ArrayList<estrella>();
  boundaries = new ArrayList<Boundary>();

  boundaries.add(new Boundary(0, 120));
  boundaries.add(new Boundary(320, 120));


  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();
}

void draw() {
  box2d.step();
  scale(2);
  opencv.loadImage(video);
  display();
}

void captureEvent(Capture c) {
  c.read();
}
