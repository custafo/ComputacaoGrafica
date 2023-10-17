// Flávio Simões
// Gustavo Pereira
class Ocean{
  private Point[][] matrizOcean;
  private boolean dir = true; //true = esquerda, false = direita
  private boolean day;
  //matrizOcean[0] parte de cima
  //matriz[1] parte de baixo, vai ate o fim da tela (NAO MODIFICAR)
  
  Ocean(float y, boolean day){
    matrizOcean = new Point[2][2];
    matrizOcean[0][0] = new Point(0, y);
    matrizOcean[0][1] = new Point(width, y);
    matrizOcean[1][0] = new Point(0, height);
    matrizOcean[1][1] = new Point(width, height);
    
    this.day = day;
  }
  
  void draw(boolean day, LuaESol lua){
    this.day = day;
    stroke(0, 0, 255);
    Point p1 = new Point(matrizOcean[0][0].getX(), matrizOcean[0][0].getY());
    Point p2 = new Point(matrizOcean[0][1].getX(), matrizOcean[0][1].getY());
    float i = matrizOcean[0][0].getY();
    float changeX = -matrizOcean[0][0].getX() / (height - i); //quant repeticao
    //APENAS PARA DESENHAR O OCEANO
    for(i = matrizOcean[0][0].getY(); i < height; i++)
    {
      p1.setY(p1.getY() + Math.abs((p1.getY() - i)));
      p2.setY(p2.getY() + Math.abs((p2.getY() - i)));
      p1.setX(p1.getX() + changeX);
      p2.setX(p2.getX() + changeX);
      
      p1.drawLine(p2);
    }
    
    if(day == false)
    {
      move(lua);
    }
    else if(inPos() == false)
    {
      adjustPos();
    }
  }
  
  public void move(LuaESol lua){
    float x = lua.getX();
    float speed = 0.008;
    float media = (matrizOcean[0][0].getX() + matrizOcean[0][1].getX()) / 2;
    
    if(x <= width/2)
    {
      dir = false;
    }
    else
    {
      dir = true;
    }
    
    if(dir == false && media > x) //move esquerda
    {
      //print("left ");
      matrizOcean[0][0].setPos(cisalhamentoX(matrizOcean[0][0].getX(), matrizOcean[0][0].getY(), -speed));
      matrizOcean[0][1].setPos(cisalhamentoX(matrizOcean[0][1].getX(), matrizOcean[0][1].getY(), -speed));
    }
    else if((dir == true && media < x) || (dir == false && media < x))//move direita |if ponto.x > x|
    {
      //print("right ");
      matrizOcean[0][0].setPos(cisalhamentoX(matrizOcean[0][0].getX(), matrizOcean[0][0].getY(), speed));
      matrizOcean[0][1].setPos(cisalhamentoX(matrizOcean[0][1].getX(), matrizOcean[0][1].getY(), speed));
    }
  }
  
  public void adjustPos(){
    float speed = 0.05;
    if(matrizOcean[0][0].getX() > 0)
    {
      matrizOcean[0][0].setPos(cisalhamentoX(matrizOcean[0][0].getX(), matrizOcean[0][0].getY(), -speed));
      matrizOcean[0][1].setPos(cisalhamentoX(matrizOcean[0][1].getX(), matrizOcean[0][1].getY(), -speed));
      
      if(matrizOcean[0][0].getX() < 0)
      {
        matrizOcean[0][0].setX(0);
        matrizOcean[0][1].setX(width);
      }
    }
  }
  
  private boolean inPos(){
    return matrizOcean[0][0].getX() == 0 && matrizOcean[0][1].getX() == width;
  }
}
