public class LuaESol{ // 20, 215
 float w = 1; 
 float cord [];
 int quantPontos = 4;
 
 public LuaESol(float [] c){
   this.cord = c;
 }
 
 public void exibir(boolean sol, float [] cord){
   if(sol){
     stroke(#FAE60A);
     strokeWeight(4);
   }
   else{
     stroke(#93C6F2);
     strokeWeight(4); 
   }
   for(int i = 0; i < this.quantPontos * 2; i += 2){ // Criar os pontos
    point(cord[i], cord[i + 1]); 
   }
   float xi, yi;
   xi = cord[0];
   yi = cord[1];
   for(int i = 2; i <= this.quantPontos * 2 - 2; i += 2){
     line(xi, yi, cord[i], cord[i + 1]);
     xi = cord[i];
     yi = cord[i + 1];
   }
   line(cord[0], cord[1], cord[this.quantPontos * 2 - 2], cord[this.quantPontos * 2 - 1]);
 }
 
 public float [] getCord(){
    return this.cord; 
 }
 
 public float getX(){
  return this.cord[0]; 
 }
 
 public float getY(){
   return this.cord[1]; 
 }
 
 public void translacaoZero(){
   translacao(-this.cord[0], -this.cord[1]);
 }
 
 public void translacao(float tx, float ty){
   float [][] mat = {{1.0, 0.0, tx},{0.0, 1.0, ty},{0.0, 0.0, 1.0}};
   float res [] = new float [this.quantPontos * 2];
   float inter [][] = new float [3][1];
   for(int i = 0; i < this.quantPontos * 2; i += 2){
      inter = multMatrizes(mat, criarMat(this.cord[i], this.cord[i + 1]));
      res[i] = inter[0][0];
      res[i + 1] = inter[1][0];
   }
   this.cord = res;
 }
 
 public void rotacao(){
   
   //float t = 0;
   //float [][] mat = {{cos(t), -sin(t), 0},{sin(t), cos(t), 0.0},{0.0, 0.0, 1.0}};
 }
 
 public void escala(float sx, float sy){
   float [][] mat = {{sx, 0.0, 0.0},{0.0, sy, 0.0},{0.0, 0.0, 1.0}};
   float res [] = new float [this.quantPontos * 2];
   float inter [][] = new float [3][1];
   for(int i = 0; i < this.quantPontos * 2; i += 2){
      inter = multMatrizes(mat, criarMat(this.cord[i], this.cord[i + 1]));
      res[i] = inter[0][0];
      res[i + 1] = inter[1][0];
   }
   this.cord = res;
 }
 
 public void reflexao(){
   float [][] mat = {{-1.0, 0.0, 0.0},{0.0, -1.0, 0.0},{0.0, 0.0, 1.0}};
   float res [] = new float [this.quantPontos * 2];
   float inter [][] = new float [3][1];
   for(int i = 0; i < this.quantPontos * 2; i += 2){
      inter = multMatrizes(mat, criarMat(this.cord[i], this.cord[i + 1]));
      res[i] = inter[0][0];
      res[i + 1] = inter[1][0];
   }
   this.exibir(false, res);
 }
 
 public float [][] criarMat(float x, float y){
   float [][] res = {{x}, {y}, {this.w}};
   return res;
 }
 
 public float [][] multMatrizes(float [][] a, float [][] b){
    float[][] asw = new float[3][1];

        for(int i = 0; i < 3; i++){ 
            for(int j = 0; j < 1; j++){
                for(int k = 0; k < 3; k++){
                    asw[i][j] += a[i][k] * b[k][j];
                }
            }
        }
        return asw;
 }
 
}
