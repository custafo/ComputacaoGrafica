class Person2{
  private float distance = 70;
  private float speed = 1.5f;
  private float matriz[][] = {{1, 0, speed}, {0, 1, 0}, {0, 0, 1}};
  private float[] Start, Destin;
  private float[][] pos;
  private boolean day;
  //pos[0] = x, pos[1] = y
  
  Person2(float x, float y, boolean day){
    this.pos = startPos(x, y);
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
  
  private float[][] startPos(float x, float y){
    float[][] mat = {{x}, {y}, {1}};
    return mat;
  }
  
  void draw(boolean day){
    if(insideHouse() != true || day != false)
    {
      stroke(0);
      this.day = day;
      //cabeca
      strokeWeight(15);
      point(pos[0][0], pos[1][0]);
      //torso
      strokeWeight(5);
      line(pos[0][0], pos[1][0], pos[0][0], pos[1][0]+20);
      //braco
      line(pos[0][0]-10, pos[1][0]+10, pos[0][0]+10, pos[1][0]+10);
      //perna
      line(pos[0][0], pos[1][0]+20, pos[0][0]-10, pos[1][0]+35);
      line(pos[0][0], pos[1][0]+20, pos[0][0]+10, pos[1][0]+35);
      movePerson();
    }
    else
    {
      /*this.day = day;
      changeColor();
      //cabeca
      strokeWeight(15);
      point(pos[0], pos[1]);
      //torso
      strokeWeight(5);
      line(pos[0], pos[1], pos[0], pos[1]+20);
      //braco
      line(pos[0]-10, pos[1]+10, pos[0]+10, pos[1]+10);
      //perna
      line(pos[0], pos[1]+20, pos[0]-10, pos[1]+35);
      line(pos[0], pos[1]+20, pos[0]+10, pos[1]+35);
      movePerson();*/
    }
  }
  
  public void movePerson(){
    if(day == true)
    {
      if(pos[0][0] > Destin[0])
      {
        moveLeft();
      }
    }
    else //dia = false
    {
      if(pos[0][0] < Start[0])
      {
        moveRight();
      }
    }
  }
  
  private void moveLeft(){
    float[][] newPos = translate(pos[0][0], pos[1][0], -speed, 0);
    if(newPos[0][0] < Destin[0])
    {
      newPos[0][0] = Destin[0];
    }
    pos = newPos;
  }
  
  private void moveRight(){
    float[][] newPos = translate(pos[0][0], pos[1][0], speed, 0);
    if(newPos[0][0] > Start[0])
    {
      newPos[0][0] = Start[0];
    }
    pos = newPos;
  }
  
  public float getX(){
    return pos[0][0];
  }
  
  public float getY(){
    return pos[1][0];
  }
  
  public boolean insideHouse(){
    return pos[0][0] == Start[0] && pos[1][0] == Start[1];
  }
}
