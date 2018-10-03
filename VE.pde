class VE {
  void inicio(){
    
    background (0);
    image(img1,0,0);
    textSize(50); 
    fill(83,9,0);
    text(" SAVE THE BABIES ", 10, 80);

    
    //Continuar a la siguiente página
    noStroke();
    fill(255,244,161);
    rect(170,420,365,55);
    textSize(25); 
    fill(83,9,0);
    text(" Presiona A para continuar ", 190, 455);
    
    if (key =='A'|| key =='a'){
      p=2;
      startTime=2;
    }

  }


  void juego(){
    background(90);
    scale (1.01);
    image(img2,-5,0);
    
    //Box2d
    if (random(1) < 0.1) {
    float sz = random(15,15);
    particulas.add(new Particula(random(width), -10, sz));
  }

    box2d.step(); // Descender 

    for (int i = particulas.size()-1; i >= 0; i--) {
      Particula p = particulas.get(i);
      p.display();
        if (p.terminar()) {
          particulas.remove(i);
    }

  }

    //Crónometro
    t= intervalo-(millis()/1000);
    tiempo = nf(t , 3);
    if (t == 0){
      p=3;
    } 
    noStroke();
    fill(33,121,108);
    rect(255,35,180,60);
    
    fill(255);
    rect(260,40,170,50); 
    
    textSize(35);
    font = createFont("Arial", 20);
    fill(0);
    text(tiempo,312, 78);

  }
  
  
  
  void conclusion(){
    background (189,236,246);
    image(img3,0,-10);
    
    //Texto para ir al inicio
    fill(0);
    textSize(30);
    text("Presiona K para ir al inicio",310 ,490);
    
    //Texto de cuanto se atrapo
    fill(137,22,0);
    textSize(60);
    rotate(-0.10472);
    text("Recolectaste", 120,360);
    textSize(60);
    rotate(-0.0174533);
    text("huevos", 270,460);
    
    
    if (key =='K'|| key =='k'){
      p=1;
      tiempo ="020";
      intervalo = 40;
      }
    
  }

}
