public class RaioDeSol{
  float w = 1; 
  float cord [];
  float xC, yC;
  float teta = 0.785;

  public RaioDeSol(float xC, float yC){
    this.xC = xC;
    this.yC = yC;
    this.cord = new float[16];
    this.cord[0] = xC + 42.5; // A
    this.cord[1] = yC;
    this.cord[2] = this.cord[0] + 15;
    this.cord[3] = yC;

    this.cord[4] = xC; // B
    this.cord[5] = yC + 42.5;
    this.cord[6] = xC;
    this.cord[7] = this.cord[5] + 15;

    this.cord[8] = xC - 42.5; // C
    this.cord[9] = yC;
    this.cord[10] = this.cord[8] - 15;
    this.cord[11] = yC;

    this.cord[12] = xC; // D
    this.cord[13] = yC - 42.5;
    this.cord[14] = xC;
    this.cord[15] = this.cord[13] - 15;

    this.exibir();
  }

  public void exibir(){
    stroke(#FAE60A);
    strokeWeight(4);
    for(int i = 0; i < 16; i += 2){ // Criar os pontos
      point(cord[i], cord[i + 1]); 
     }
   for(int i = 0; i <= 12; i += 4){
     line(cord[i], cord[i + 1], cord[i + 2], cord[i + 3]);
   }
 }
}
