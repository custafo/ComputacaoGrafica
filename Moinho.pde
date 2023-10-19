public class Moinho{
  
  float xi = 430.0, yi = 300.0, l = 50, c = 10, dist = 20;
  float centroX = (xi + xi + c)/2.0, centroY = yi - 10;
  float [] extremos;
  
  public Moinho(){
    float [] extremos = {this.centroX - dist, this.centroY, this.centroX + dist, this.centroY};
    this.extremos = extremos;
  }
  
  public void draw(){
   stroke(#C47E0E);
   strokeWeight(4);
   point(xi, yi);
   point(xi + c, yi);
   point(xi, yi + l);
   point(centroX, centroY); // Ponto do triangulo, centro do moinho
   point(xi, yi);
   line(xi, yi, xi + c, yi);
   line(xi + c, yi, xi + c, yi + l);
   line(xi + c, yi + l, xi, yi + l);
   line(xi, yi + l, xi, yi);
   
   line(xi, yi, centroX, centroY);
   line(xi + c, yi, centroX, centroY);
   
   stroke(#7F8685);
   line(this.extremos[0], this.extremos[1], this.extremos[2], this.extremos[3]);
   rotacaoHelice(0.02);
  }
  
  public void rotacaoHelice(float theta){
    float newPos [][] = new float[3][1];
    for(int i = 0; i < 4; i += 2){
      newPos = translacao(this.extremos[i], this.extremos[i + 1], -this.centroX, -this.centroY);
      newPos = rotacao(newPos[0][0], newPos[1][0], theta);
      newPos = translacao(newPos[0][0], newPos[1][0], this.centroX, this.centroY);
      this.extremos[i] = newPos[0][0];
      this.extremos[i + 1] = newPos[1][0];
    }
  }
}
