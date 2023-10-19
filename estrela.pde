class Estrela{
  Point[] vertices = new Point[7]; // 6 vértices externos e 1 ponto central
  float rotationAngle = 0; // Ângulo inicial de rotação
  float rotationSpeed = radians(40); // Rotação de 1 grau por quadro
  
  Estrela(){
    float cx = 50; // Coordenada x do centro - Ajuste para mover a estrela horizontalmente
    float cy = 50; // Coordenada y do centro - Ajuste para mover a estrela verticalmente
    float radius = 20;

    float angle = TWO_PI / 6; // Ângulo entre cada vértice

  // Calcular as coordenadas dos vértices externos da estrela
    for (int i = 0; i < 6; i++) {
      float x = cx + radius * cos(angle * i);
      float y = cy + radius * sin(angle * i);
      vertices[i] = new Point(x, y);
    }

  // Adicionar o vértice central
    float centerX = cx;
    float centerY = cy;
    vertices[6] = new Point(centerX, centerY);
  }
  
  void draw(){
    stroke(255, 255, 0);
    strokeWeight(5);
    rotationAngle += rotationSpeed;

    for (Point vertex : vertices) {
      vertex.draw();
    }

    for (int i = 0; i < 6; i++) {
      Point currentPoint = vertices[i];
      Point nextPoint = vertices[(i + 2) % 6];
      line(currentPoint.getX(), currentPoint.getY(), nextPoint.getX(), nextPoint.getY());
    }

  // Chama a função rotacaoHelice para rotacionar a estrela
    rotacaoEstrela(vertices, rotationAngle);
    rotationAngle =0;
  }
  
  public void rotacaoEstrela(Point[] vertices, float angularSpeed) {
    // Calcule o centro da estrela
    float centerX = vertices[6].getX();
    float centerY = vertices[6].getY();

    // Defina a velocidade angular em graus por quadro
    float theta = radians(angularSpeed);

  // Realize a rotação para os vértices externos da estrela
    for (int i = 0; i < 6; i++) {
      float x = vertices[i].getX();
      float y = vertices[i].getY();

      // Ajuste a translação para o centro da estrela
      float tx = -centerX;
      float ty = -centerY;

    // Realize a translação
      float[][] newPos = translacao(x, y, tx, ty);

    // Aplique a rotação
      newPos = rotacao(newPos[0][0], newPos[1][0], theta);

    // Reverta a translação
      newPos = translacao(newPos[0][0], newPos[1][0], centerX, centerY);

    // Atualize as coordenadas dos pontos
      vertices[i].setX(newPos[0][0]);
      vertices[i].setY(newPos[1][0]);
  }
}
}

/*
void setup() {
  float cx = 100; // Coordenada x do centro - Ajuste para mover a estrela horizontalmente
  float cy = 50; // Coordenada y do centro - Ajuste para mover a estrela verticalmente
  float radius = 20;

  float angle = TWO_PI / 6; // Ângulo entre cada vértice

  // Calcular as coordenadas dos vértices externos da estrela
  for (int i = 0; i < 6; i++) {
    float x = cx + radius * cos(angle * i);
    float y = cy + radius * sin(angle * i);
    vertices[i] = new Point(x, y);
  }

  // Adicionar o vértice central
  float centerX = cx;
  float centerY = cy;
  vertices[6] = new Point(centerX, centerY);
}

void draw() {

  // Incrementa o ângulo de rotação
  rotationAngle += rotationSpeed;

  for (Point vertex : vertices) {
    vertex.draw();
  }

  for (int i = 0; i < 6; i++) {
    Point currentPoint = vertices[i];
    Point nextPoint = vertices[(i + 2) % 6];
    line(currentPoint.getX(), currentPoint.getY(), nextPoint.getX(), nextPoint.getY());
  }

  // Chama a função rotacaoHelice para rotacionar a estrela
  rotacaoEstrela(vertices, rotationAngle);
  rotationAngle =0;
}
*/
