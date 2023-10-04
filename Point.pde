class Point{
  private float[] pos;
  
  Point(float x, float y){
    this.pos = new float[3];
    this.pos[0] = x;
    this.pos[1] = y;
    this.pos[2] = 1;
  }
  
  void draw(){
    stroke(0);
    strokeWeight(5);
    point(pos[0], pos[1]);
  }
  
  public float getX(){
    return pos[0];
  }
  
  public float getY(){
    return pos[1];
  }
  
  public void setX(float x){
    this.pos[0] = x;
  }
  
  public void setY(float y){
    this.pos[1] = y;
  }
  
  public void drawLine(Point p){
    line(this.pos[0], this.pos[1], p.getX(), p.getY());
  }
  
  public void printData(){
    print("[" + pos[0] + ", " + pos[1] + "] ");
  }
}
