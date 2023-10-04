class Ocean{
  private Point[][] matrizOcean;
  private boolean dirX = true, dirY = true; //true = esquerda e cima / false = direita e baixo
  private float a = 0.008, b = 0.008;
  private float[][] matrizCisX = {{1, b, 0}, {0, 1, 0}, {0, 0, 1}};
  private float[][] matrizCisY = {{1, 0, 0}, {a, 1, 0}, {0, 0, 1}};
  private float changeX;
  private float yBase;
  private float sunHeight, moonHeight;
  private boolean day;
  //matrizOcean[0] parte de cima
  //matriz[1] parte de baixo, vai ate o fim da tela (NAO MODIFICAR)
  
  Ocean(float y, boolean day){
    matrizOcean = new Point[2][2];
    matrizOcean[0][0] = new Point(0, y);
    matrizOcean[0][1] = new Point(width, y);
    matrizOcean[1][0] = new Point(0, height);
    matrizOcean[1][1] = new Point(width, height);
    
    this.yBase = matrizOcean[0][0].getY();
    this.sunHeight = matrizOcean[0][0].getY() - 30;
    this.moonHeight = matrizOcean[0][0].getY() - 60;
    
    this.day = day;
  }
  
  void draw(boolean day){
    this.day = day;
    stroke(0, 0, 255);
    Point p1 = new Point(matrizOcean[0][0].getX(), matrizOcean[0][0].getY());
    Point p2 = new Point(matrizOcean[0][1].getX(), matrizOcean[0][1].getY());
    float i = matrizOcean[0][0].getY();
    changeX = -matrizOcean[0][0].getX() / (height - i); //quant repeticao
    for(i = matrizOcean[0][1].getY(); i < height; i++)
    {
      p1.setY(p1.getY() + Math.abs((p1.getY() - i)));
      p2.setY(p2.getY() + Math.abs((p2.getY() - i)));
      p1.setX(p1.getX() + changeX);
      p2.setX(p2.getX() + changeX);
      p1.drawLine(p2);
    }
    
    moveY();
    moveX();
  }
  
  public void moveY(){
    float[] newPos = new float[3];
    float limitY;
    if(day)
    {
      limitY = sunHeight;
    }
    else
    {
      limitY = moonHeight;
    }
    
    if(dirY == true)
    {
      if(matrizOcean[0][0].getY() <= limitY)
      {
        dirY = false;
      }
      else
      {
        newPos[0] = (matrizCisY[0][0] * matrizOcean[0][0].getX()) + (matrizCisY[0][1] * matrizOcean[0][0].getY());
        newPos[1] = (-a * matrizOcean[0][0].getX()) + (matrizCisY[1][1] * matrizOcean[0][0].getY());
        matrizOcean[0][0].setX(newPos[0]);
        matrizOcean[0][0].setY(newPos[1]);
        
        newPos[0] = (matrizCisY[0][0] * matrizOcean[0][1].getX()) + (matrizCisY[0][1] * matrizOcean[0][1].getY());
        newPos[1] = (-a * matrizOcean[0][1].getX()) + (matrizCisY[1][1] * matrizOcean[0][1].getY());
        matrizOcean[0][1].setX(newPos[0]);
        matrizOcean[0][1].setY(newPos[1]);
      }
    }
    else //diry == false
    {
      if(matrizOcean[0][0].getY() >= yBase)
      {
        dirY = true;
      }
      else
      {
        newPos[0] = (matrizCisY[0][0] * matrizOcean[0][0].getX()) + (matrizCisY[0][1] * matrizOcean[0][0].getY());
        newPos[1] = (a * matrizOcean[0][0].getX()) + (matrizCisY[1][1] * matrizOcean[0][0].getY());
        matrizOcean[0][0].setX(newPos[0]);
        matrizOcean[0][0].setY(newPos[1]);
        
        newPos[0] = (matrizCisY[0][0] * matrizOcean[0][1].getX()) + (matrizCisY[0][1] * matrizOcean[0][1].getY());
        newPos[1] = (a * matrizOcean[0][1].getX()) + (matrizCisY[1][1] * matrizOcean[0][1].getY());
        matrizOcean[0][1].setX(newPos[0]);
        matrizOcean[0][1].setY(newPos[1]);
      }
    }
  }
  
  public void moveX(){
    float newPos[] = new float[3];
    float limitX = 30;
    if(dirX == true)
    {
      if(matrizOcean[0][0].getX() <= -limitX)
      {
        dirX = false;
      }
      else
      {
        newPos[0] = (matrizCisX[0][0] * matrizOcean[0][0].getX()) + (-matrizCisX[0][1] * matrizOcean[0][0].getY());
        newPos[1] = (matrizCisX[1][0] * matrizOcean[0][0].getX()) + (matrizCisX[1][1] * matrizOcean[0][0].getY());
        matrizOcean[0][0].setX(newPos[0]);
        matrizOcean[0][0].setY(newPos[1]);
        
        newPos[0] = (matrizCisX[0][0] * matrizOcean[0][1].getX()) + (-matrizCisX[0][1] * matrizOcean[0][1].getY());
        newPos[1] = (matrizCisX[1][0] * matrizOcean[0][1].getX()) + (matrizCisX[1][1] * matrizOcean[0][1].getY());
        matrizOcean[0][1].setX(newPos[0]);
        matrizOcean[0][1].setY(newPos[1]);
      }
    }
    else //dirx == false
    {
      if(matrizOcean[0][0].getX() >= limitX)
      {
        dirX = true;
      }
      else
      {
        newPos[0] = (matrizCisX[0][0] * matrizOcean[0][0].getX()) + (matrizCisX[0][1] * matrizOcean[0][0].getY());
        newPos[1] = (matrizCisX[1][0] * matrizOcean[0][0].getX()) + (matrizCisX[1][1] * matrizOcean[0][0].getY());
        matrizOcean[0][0].setX(newPos[0]);
        matrizOcean[0][0].setY(newPos[1]);
        
        newPos[0] = (matrizCisX[0][0] * matrizOcean[0][1].getX()) + (matrizCisX[0][1] * matrizOcean[0][1].getY());
        newPos[1] = (matrizCisX[1][0] * matrizOcean[0][1].getX()) + (matrizCisX[1][1] * matrizOcean[0][1].getY());
        matrizOcean[0][1].setX(newPos[0]);
        matrizOcean[0][1].setY(newPos[1]);
      }
    }
  }
}
