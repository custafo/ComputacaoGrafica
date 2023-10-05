class Person2{
  private float distance = 70;
  private float speed = 1.5f;
  private float matriz[][] = {{1, 0, speed}, {0, 1, 0}, {0, 0, 1}};
  private float[] pos, Start, Destin;
  private boolean day;
  //pos[0] = x, pos[1] = y
  
  Person2(float x, float y, boolean day){
    this.pos = new float[3];
    this.Start = new float[3];
    this.Destin = new float[3];
    pos[0] = Start[0] = x;
    pos[1] = Start[1] = y;
    pos[2] = Start[2] = 1;
    Destin[0] = x - distance;
    Destin[1] = y;
    Destin[2] = 1;
    
    this.day = day;
  }
  
  void draw(boolean day){
    if(insideHouse() != true || day != false)
    {
      this.day = day;
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
  
  public void changeColor(){
    /*if(day == true)
    {
      stroke(0);
    }
    else
    {
      stroke(255);
    }*/
    
    stroke(0);
  }
  
  public void movePerson(){
    if(day == true)
    {
      if(pos[0] > Destin[0])
      {
        moveLeft();
      }
    }
    else
    {
      if(pos[0] < Start[0])
      {
        moveRight();
      }
    }
  }
  
  private void moveLeft(){
    matriz[0][2] = -speed;
    float newPos[] = new float[3];
    
    newPos[0] = (matriz[0][0] * pos[0]) + (matriz[0][1] * pos[1]) + (matriz[0][2] * pos[2]);
    newPos[1] = (matriz[1][0] * pos[0]) + (matriz[1][1] * pos[1]) + (matriz[1][2] * pos[2]);
    newPos[2] = (matriz[2][0] * pos[0]) + (matriz[2][1] * pos[1]) + (matriz[2][2] * pos[2]);
    
    if(newPos[0] < Destin[0])
    {
      newPos[0] = Destin[0];
    }
    pos = newPos;
  }
  
  private void moveRight(){
    matriz[0][2] = speed;
    float newPos[] = new float[3];
    
    newPos[0] = (matriz[0][0] * pos[0]) + (matriz[0][1] * pos[1]) + (matriz[0][2] * pos[2]);
    newPos[1] = (matriz[1][0] * pos[0]) + (matriz[1][1] * pos[1]) + (matriz[1][2] * pos[2]);
    newPos[2] = (matriz[2][0] * pos[0]) + (matriz[2][1] * pos[1]) + (matriz[2][2] * pos[2]);
    
    if(newPos[0] > Start[0])
    {
      newPos[0] = Start[0];
    }
    pos = newPos;
  }
  
  public float getX(){
    return pos[0];
  }
  
  public float getY(){
    return pos[1];
  }
  
  public boolean insideHouse(){
    return pos[0] == Start[0] && pos[1] == Start[1];
  }
}
