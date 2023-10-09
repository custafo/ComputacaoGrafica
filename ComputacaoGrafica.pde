import processing.sound.*;

//baixar as bibliotecas Minim e Sound no processing, clicando na palavra Sketch em cima, dps em import library e dps colocando "sound" na aba de pesquisa
SoundFile song;
MyThread anim;
Person2 person2;
Casa casa;
Terreno terra;
Ocean ocean;
Coqueiro coq;
float backg = 255;
boolean sol = true;

//lua e sol
LuaESol obj;
float c = 65.0, xInicial = 20.0, yInicial = 150.0;
float [] a = {xInicial, yInicial, xInicial + c, yInicial, xInicial + c, yInicial + c, xInicial, yInicial + c};

void setup(){
  size(640, 360);
  casa = new Casa(245, -200, 100);
  person2 = new Person2(casa.getX()+45, -casa.getY()+65, sol);
  terra = new Terreno();
  anim = new MyThread();
  ocean = new Ocean(height/1.25, sol);
  coq = new Coqueiro();
  
  //lua e sol
  obj = new LuaESol(a);
  obj.exibir(sol, obj.getCord());
  //-------------

  song = new SoundFile(this, "Under the Sea.mp3");
  song.loop();

  noLoop();
  noSmooth();
}

void draw(){
  background(backg);
  if(sol == true && backg < 255)
  {
    backg+=5;
  }
  else if(sol == false && backg > 0)
  {
    backg-=5;
  }
  
  //lua e sol
  if((obj.getX() < 300 && sol) || (obj.getX() < 250 && !sol)){
     moveSolCima();
   }
   else{ 
    if(obj.getX() <= 640){
      moveSolBaixo();
    }
    else if(sol){
      sol = false;
      obj.escala(0.5, 0.5);
      obj.translacaoZero();
      obj.translacao(-xInicial, -yInicial);
      obj = obj.reflexao();
    }
    else{ // Lua
      sol = true;
      obj.escala(2, 2);
      obj.translacaoZero();
      obj.translacao(-xInicial, -yInicial);
      obj = obj.reflexao();
    }
   }
  //----------
  
  ocean.draw(sol, obj);
  
  terra.draw();
  
  coq.draw();
  
  casa.draw();
  
  person2.draw(sol);
}

void keyPressed(){
  if(key == 'a')
  {
    if(sol == true)
    {
      sol = false;
    }
    else
    {
      sol = true;
    }
  }
  print(sol + " ");
}

public void moveSolCima(){
 for(int i = 1; i < 120; i++){ // ciclo de movimentação do sol, até metade da tela
         move(0.0006, -0.008);
  }
  for(int i = 100; i >= 0; i--){ 
        move(0.006, 0.006);
  } 
}
  
public void moveSolBaixo(){
 for(int i = 1; i < 120; i++){ // ciclo de movimentação do sol, até metade da tela
         move(0.003, 0.0006);
  }
  for(int i = 100; i >= 0; i--){ 
        move(0.002, 0.002);
  }
}

public void move(float x1, float y1){
    float x, y;
    x = obj.getX();
    y = obj.getY();
    obj.translacaoZero();
    obj.translacao(x, y);
    obj.translacao(x1, y1);
    //background(0);
    obj.exibir(sol, obj.getCord());
  }
