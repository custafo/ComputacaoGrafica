class Point{
  private float[][] pos;
  
  Point(float x, float y){
    this.pos = startPos(x, y, 1);
  }
  
  public float[][] startPos(float x, float y, float w){
    float[][] retorno = {{x}, {y}, {w}};
    return retorno;
  }
  
  void draw(){
    stroke(0);
    strokeWeight(5);
    point(pos[0][0], pos[1][0]);
  }
  
  public float getX(){
    return pos[0][0];
  }
  
  public float getY(){
    return pos[1][0];
  }
  
  public void setX(float x){
    this.pos[0][0] = x;
  }
  
  public void setY(float y){
    this.pos[1][0] = y;
  }
  
  public void setPos(float[][] newPos){
    pos = newPos;
  }
  
  public void drawLine(Point p){
    line(this.pos[0][0], this.pos[1][0], p.getX(), p.getY());
  }
  
  public void printData(){
    print("[" + pos[0][0] + ", " + pos[1][0] + "] ");
  }
}
