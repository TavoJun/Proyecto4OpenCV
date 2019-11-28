class Box {

  float x;
  float y;
  float t=15;

  Body b;

  Box(float x_, float y_) {
    this.x=x_;
    this.y=y_;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x_, y_));
    
    b = box2d.createBody(bd);

    b.setLinearVelocity(new Vec2(0, 0));
    b.setAngularVelocity(0);

    CircleShape ps = new  CircleShape();
    ps.m_radius = box2d.scalarPixelsToWorld(this.t/2);

    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 4;
    fd.friction = 10;
    fd.restitution = 0.1;

    b.createFixture(fd);
    b.setUserData(this);
  }

  void applyForce(Vec2 force) {
    Vec2 pos = b.getWorldCenter();
    b.applyForce(force, pos);
  }

  void killBody() {
    box2d.destroyBody(b);
    println("se Perdio la bola");
  }

  boolean done() {
    if (key == 'v') {
      killBody();
      return true;
    }
    return false;
  }

  void display() { 
    Vec2 pos = box2d.getBodyPixelCoord(b);
    pushMatrix();
    translate(pos.x, pos.y);
    noStroke();
    fill(255, 255, 0);
    ellipse(0, 0, t, t);
    popMatrix();
  }
}
