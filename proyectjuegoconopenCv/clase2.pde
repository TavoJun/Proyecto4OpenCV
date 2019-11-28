class estrella {

  Body body;
  float w;
  float h;
  float gra;

  estrella(float x, float y) {
    w = random(10,30);
    h = 5;
    makeBody(new Vec2(x,y),w,h);
    body.setUserData(this);
  }
  
   void makeBody(Vec2 center, float w_, float h_) {

    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);

    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 6;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));

    body = box2d.createBody(bd);
    body.createFixture(fd);
    
    body.setLinearVelocity(new Vec2(random(0),random(0)));
    body.setAngularVelocity(random(0));
  }
  
   void applyForce(Vec2 v) {
    body.applyForce(v, body.getWorldCenter());
  }


  void killBody() {
    box2d.destroyBody(body);
  }
  

  boolean done() {
    Vec2 pos = box2d.getBodyPixelCoord(body);  
    if (pos.y > height+w/2) {
      killBody();
      return true;
    }
    return false;
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    
    pushMatrix();
    translate(pos.x,pos.y);
    fill(random(0,255),random(0,255),random(0,255));
    stroke(random(150,220));
    rectMode(CENTER);
    rect(0,0,w,h);
    popMatrix();
  }
}
