// variaveis relacionadas com a bola
PVector position; // vetor posição da elipse
PVector velocity = new PVector(0, 0); // vetor de incremento
float r = 10; // raio da elipse
float speed = 4; //velocidade sugerida para as duas direções

void setup() {
  size(500, 310);
  // inicia a posição para a elipse no meio da aresta superior
  position = new PVector(width/2, 0);

  velocity.set(speed, speed); // configura velocidade nas direções x e y
}

void draw() {
  // desenha o fundo
  fill(0, 155, 50, 5); // (R,G,B, fadeOut)
  // noStroke();
  rect(0, 0, width, height); // desenha um retangulo da largura e altura da tela

  // desenha a elipse
  noStroke();
  fill(255);
  ellipse(position.x, position.y, r*2, r*2); // desenha a elipse com centro nas coordenadas do vetor position

  // dá uma incremento de movimento para a elipse
  position.add(velocity); // soma o vetor velocity ao vetor position

  // detecta se houve colisão com a parede
  detectColision();
}


void detectColision() {

  // detecta a colisão nas fronteiras
  // right
  if (position.x > width-r) {
    position.x = width-r;
    velocity.x *= -1;
  }
  // left 
  if (position.x < r) {
    position.x = r;
    velocity.x *= -1;
  }
  // top
  if (position.y < r) {
    position.y = r;
    velocity.y *= -1;
  }
  // ground
  if (position.y > height-r) {
    position.y = height-r;
    velocity.y *= -1;
  }
}

