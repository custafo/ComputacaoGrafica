//Thread animacaoRotacao = new Thread(new AnimacaoRotacao());
LuaESol obj2;

boolean sol2;
float c2 = 65.0, xInicial2 = 20.0, yInicial2 = 150.0;
float [] a2 = {xInicial2, yInicial2, xInicial2 + c2, yInicial2, xInicial2 + c2, yInicial2 + c2, xInicial2, yInicial2 + c2};

void setup2(){
   size(640, 360);
   background(0);
   //noLoop();
   noSmooth();
   obj = new LuaESol(a);
   sol = true;
   obj.exibir(sol, obj.getCord());
   //animacaoRotacao.run();
}

void draw2(){
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
   
}

public void moveSolCima2(){
 for(int i = 1; i < 120; i++){ // ciclo de movimentação do sol, até metade da tela
         move(0.0006, -0.008);
  }
  for(int i = 100; i >= 0; i--){ 
        move(0.006, 0.006);
  } 
}
  
public void moveSolBaixo2(){
 for(int i = 1; i < 120; i++){ // ciclo de movimentação do sol, até metade da tela
         move(0.003, 0.0006);
  }
  for(int i = 100; i >= 0; i--){ 
        move(0.002, 0.002);
  } 
}

public void move2(float x1, float y1){
    float x, y;
    x = obj.getX();
    y = obj.getY();
    obj.translacaoZero();
    obj.translacao(x, y);
    obj.translacao(x1, y1);
    background(0);
    obj.exibir(sol, obj.getCord());
  }
