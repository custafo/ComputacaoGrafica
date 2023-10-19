import processing.sound.*;

// Sons: João Gabriel Torres do Nascimento
//baixar a biblioteca Sound no processing, clicando na palavra Sketch em cima, dps em import library e dps colocando "sound" na aba de pesquisa
SoundFile song;
SoundFile cricket;
SoundFile ronco;
MyThread anim;
Person2 person2;
Casa casa;
Terreno terra;
Ocean ocean;
Coqueiro coq;
Moinho moinho;
float[] backg = {187, 243, 249};
boolean sol = true;

Nuvens[] nuvem = {new Nuvens(), new Nuvens(), new Nuvens()};

//estrela
Estrela star;

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
  moinho = new Moinho();
  
  //lua e sol
  obj = new LuaESol(a);
  obj.exibir(sol, obj.getCord());
  //-------------
  
  star = new Estrela();

  song = new SoundFile(this, "Under the Sea.mp3");
  cricket = new SoundFile(this, "crickets-sound effect.mp3");
  ronco = new SoundFile(this, "ronco.mp3");

  noLoop();
  noSmooth();
}

void draw(){
  background(backg[0], backg[1], backg[2]);
  if(sol == true)
  {
    if(song.isPlaying() == false)
    {
      cricket.stop();
      ronco.stop();
      song.play();
    }
    
    nuvem[0].colors = 255.0;
    nuvem[1].colors = 255.0;
    nuvem[2].colors = 255.0;
    
    if(backg[0]<185)
    {
      backg[0]+=5;
    }
      if(backg[1]<240)
    {
      backg[1]+=5;
    }
    if(backg[2] < 255)
    {
      backg[2]+=5;
    }
  }
  else if(sol == false)
  {
    star.draw();
    if(cricket.isPlaying() == false)
    {
      song.stop();
      cricket.loop();
      ronco.loop();
    }
    
    nuvem[0].colors = 122.0;
    nuvem[1].colors = 122.0;
    nuvem[2].colors = 122.0;
    
    if(backg[2] > 0)
    {
      backg[0]-=5;
      backg[1]-=5;
      backg[2]-=5;
    }
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
  
  moinho.draw();
  
  coq.draw();
  
  nuvem[0].draw();
  nuvem[1].draw();
  nuvem[2].draw();
  
  casa.draw();
  
  person2.draw(sol);
  
  
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
