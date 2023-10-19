// Flávio Simões
class Person2{
  private float distance = 70;
  private float speed = 1.5f;
  private float matriz[][] = {{1, 0, speed}, {0, 1, 0}, {0, 0, 1}};
  private float[] Start, Destin;
  private Point[] points;
  private boolean day;
  //pos[0] = x, pos[1] = y
  
  Person2(float x, float y, boolean day){
    this.points = setPoints(x, y);
    this.Start = new float[3];
    this.Destin = new float[3];
    this.Start[0] = x;
    this.Start[1] = y;
    this.Start[2] = 1;
    Destin[0] = x - distance;
    Destin[1] = y;
    Destin[2] = 1;
    
    this.day = day;
  }
  
  private Point[] setPoints(float x, float y){
    //primeiro ponto representa a cabeça
    Point[] vet = {new Point(x, y), new Point(x, y+20), new Point(x-10, y+10), new Point(x+10, y+10), new Point(x, y+20), new Point(x-10, y+35), new Point(x+10, y+35)};
    return vet;
  }
  
  void draw(boolean day){
    if(insideHouse() != true || day != false)
    {
      stroke(0);
      this.day = day;
      //cabeca
      strokeWeight(15);
      points[0].draw();
      //torso
      strokeWeight(5);
      points[0].drawLine(points[1]);
      //line(pos[0][0], pos[1][0], pos[0][0], pos[1][0]+20);
      
      //braco
      points[2].drawLine(points[3]);
      //line(pos[0][0]-10, pos[1][0]+10, pos[0][0]+10, pos[1][0]+10);
      
      //perna
      points[1].drawLine(points[5]);
      //line(pos[0][0], pos[1][0]+20, pos[0][0]-10, pos[1][0]+35);
      points[1].drawLine(points[6]);
      //line(pos[0][0], pos[1][0]+20, pos[0][0]+10, pos[1][0]+35);
      
      movePerson();
    }
  }
  
  public void movePerson(){
    if(day == true)
    {
      if(getX() > Destin[0])
      {
        moveLeft();
      }
    }
    else //dia = false
    {
      if(getX() < Start[0])
      {
        moveRight();
      }
    }
  }
  
  private void moveLeft(){
    for(int i = 0; i < points.length; i++)
    {
      float[][] newPos = translacao(points[i].getX(), points[i].getY(), -speed, 0);
      if(newPos[0][0] < Destin[0] && i == 0)
      {
        newPos[0][0] = Destin[0];
      }
      points[i].setPos(newPos);
    }
  }
  
  private void moveRight(){
    for(int i = 0; i < points.length; i++)
    {
      float[][] newPos = translacao(points[i].getX(), points[i].getY(), speed, 0);
      if(newPos[0][0] > Start[0] && i == 0)
      {
        newPos[0][0] = Start[0];
      }
      points[i].setPos(newPos);
    }
  }
  
  public float getX(){
    return points[0].getX();
  }
  
  public float getY(){
    return points[0].getY();
  }
  
  public boolean insideHouse(){
    return points[0].getX() == Start[0] && points[0].getY() == Start[1];
  }
}
