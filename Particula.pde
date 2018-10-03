class Particula {
  Body b;
  float r;
  color c;
  
  // metodo constructor
  
  Particula(float x, float y, float r_) {
    r = r_;
    c = color(61,100,255); 
    
  // Definir mi body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position = box2d.coordPixelsToWorld(x, y); //posicion
    
    //Crear body
    b = box2d.createBody(bd);
    
    //Definir la forma 
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    //Definir el Ficture
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 1;
    fd.friction = 0.01;
    fd.restitution = 0.3;

    // Agrego todo en mi body
    b.createFixture(fd); 
  }
   
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(b);
    pushMatrix();
    translate(pos.x, pos.y); 
    noStroke();
    fill(c); 
    ellipse(0, 0, r*1.5, r*2);
    popMatrix();
  }
  
   void killBody() {
    box2d.destroyBody(b);
  }

  boolean terminar() {
    Vec2 pos = box2d.getBodyPixelCoord(b);
    if (pos.y > height+r*2) {
      killBody();
      return true;
    }
    return false;
  } 
}
