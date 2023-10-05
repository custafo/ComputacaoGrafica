class Casa{
  private int x, y, altura;
  
  Casa(int x, int y, int altura){
    this.x = x;
    this.y = y;
    this.altura = altura;
  }
  
  void draw(){
    strokeWeight(0);
    // parede
    for(int i = x; i < x+120; i++){
      stroke(193, 154, 107);
      line(i, altura-y, i, altura-y-90);
    }
    // telhado
    for(int i = x; i < x+120; i++){
      stroke(120, 80, 0);
      line(i, altura-y-90, i, altura-y-100);
    }
    // porta
    for(int i = x+35; i < x+60; i++){
      stroke(150, 80, 0);
      line(i, altura-y, i, altura-y-40);
    }
    
    // maçaneta
    stroke(0, 0, 0);
    strokeWeight(4);
    point(x+40, altura-y-20);
    // janela
    stroke(0, 0, 0);
    strokeWeight(2);
    line(x+70, altura-y-30, x+70, altura-y-60);
    line(x+70, altura-y-30, x+100, altura-y-30);
    line(x+70, altura-y-60, x+100, altura-y-60);
    line(x+100, altura-y-60, x+100, altura-y-30);
    for(int i = x+72; i < x+98; i++){
      stroke(255, 255, 255);
      line(i, altura-y-58, i,  altura-y-32);
    }
    stroke(0, 0, 0);
    line(x+85, altura-y-30, x+85, altura-y-60);
    line(x+70, altura-y-45, x+100, altura-y-45);
  }
  
  public int getX(){
    return x;
  }
  
  public int getY(){
    return y;
  }
}
