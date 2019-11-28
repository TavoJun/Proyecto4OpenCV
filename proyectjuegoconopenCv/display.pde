void display(){
  
  image(video, 0, 0 );
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();

  for (int i = 0; i < faces.length; i++) {
    rectMode(CENTER);
     pushMatrix();
     
      fill(0,0,150);
      text("     Mueve la Cabeza Para Mover la Particula", 40,20);
      text("     Click Derecho Para Generar Nueva Particula", 20,30);
       textSize(10);
      popMatrix();
    
    if (random(noa) < 0.5) {
    estrella e = new estrella(random(width),-100);
    estrellas.add(e);
    if(noa>1){noa-=0.1;}
    //println(noa);
  }
  
  
  if(mousePressed){
  Box b = new Box(this.x,this.y);
  boxes.add(b);
  }
  
  
    if(faces[i].x<150){
    for (Box b: boxes) {
     Vec2 wind = new Vec2(-400,110);
     b.applyForce(wind);
    }
    }
    
    if(faces[i].x>150){
      for (Box b: boxes) {
     Vec2 wind = new Vec2(400,110);
     b.applyForce(wind);
    }
    }
  }

      for (Box b : boxes) {
      b.display();
    }
    
       for (estrella e : estrellas) {
      e.display();
    }
    
      for (Boundary wall: boundaries) {
    wall.display();
  }
    
    for (int i = estrellas.size()-1; i >= 0; i--) {
    estrella e = estrellas.get(i);
    if (e.done()) {
      estrellas.remove(i);
    }
  }
  
      for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
    }
  }

}
