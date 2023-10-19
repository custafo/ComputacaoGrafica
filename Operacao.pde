public float [][] multMatriz(float [][] a, float [][] b){
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

public float[][] translacao(float x, float y, float tx, float ty){
  float[][] matrizTranslate = {{1, 0, tx}, {0, 1, ty}, {0, 0, 1}};
  float[][] matriz = {{x}, {y}, {1}};
  
  return multMatriz(matrizTranslate, matriz);
}

public float[][] cisalhamentoX(float x, float y, float b){
  float[][] matrizCisX = {{1, b, 0}, {0, 1, 0}, {0, 0, 1}};
  float[][] matriz = {{x}, {y}, {1}};
  
  return multMatriz(matrizCisX, matriz);
}

public float[][] cisalhamentoY(float x, float y, float a){
  float[][] matrizCisY = {{1, 0, 0}, {a, 1, 0}, {0, 0, 1}};
  float[][] matriz = {{x}, {y}, {1}};
  
  return multMatriz(matrizCisY, matriz);
}

public float[][] rotacao(float x, float y, float theta){
    float[][] matriz = { {cos(theta), -sin(theta), 0}, {sin(theta), cos(theta), 0}, {0, 0, 1} };
    float[][] xy = { {x}, {y}, {1} };
    return multMatriz(matriz, xy);
}
