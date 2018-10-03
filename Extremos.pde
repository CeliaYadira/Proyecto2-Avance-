class Boundary {

  // Atributos
  float x;
  float y;
  float a;
  float h;
  Body b;

 Boundary(float x_,float y_, float a_, float h_) {
    x = x_;
    y = y_;
    a = a_;
    h = h_;
    
    //Definir mi body 
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));

    // Crear el body 
    b = box2d.createBody(bd);
    
    // Definir la forma 
    PolygonShape sd = new PolygonShape();
    float box2dA = box2d.scalarPixelsToWorld(a/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dA, box2dH);

    //Agregar todo a mi body
    b.createFixture(sd,1);
  }

  void display() {
    pushMatrix();
    fill(0);
    translate(x,y);
    rect(0,0,a,h);
    popMatrix();
  }

}
