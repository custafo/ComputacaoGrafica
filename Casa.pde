public class Casa{
  private int y;
  private int x;
  private int altura;
  private float weight = 5;

  
  public Casa(int x, int y, int altura){
    this.x = x;
    this.y = y;
    this.altura = altura;
  }
  
  void draw(){
    strokeWeight(weight);
    // parede
    for(int i = x; i < x+120; i++){
      stroke(193, 154, 107);
      line(i, altura-y, i, altura-y-90);
    }
    // telhado
    for(int i = x; i < x+120; i++){
      stroke(0, 0, 0);
      line(i, altura-y-90, i, altura-y-100);
    }
    // porta
    for(int i = x+35; i < x+60; i++){
      stroke(150, 80, 0);
      line(i, altura-y, i, altura-y-40);
    }
  }
  
  public int getX(){
    return x;
  }
  
  public int getY(){
    return y;
  }
}
