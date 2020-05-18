PImage img; 
String imgFilename = "STP-MTR-17048"; // The path to the image
String iteration = "2000pprev"; // To do the process to most images


float px=45, py=38; // set pixel distances
float fx = 150, fy=5; // set scale factors
float Ox=140, Oy=350, Lx = 1*px, Ly = 1*py;

float[] x = new float[0];
float[] y = new float[0];
int counter;
void setup()
{
  img = loadImage("sources/"+imgFilename+".PNG");
  size(img.width, img.height);
  refreshDisplay();
}

void draw() {
  verifyAxis();
  drawAxis();
  drawPoint();
}

void drawAxis() {
  stroke(255, 0, 0);
  strokeWeight(1);
  line(Ox, Oy, Ox+Lx, Oy);
  line(Ox, Oy, Ox, -(Ly-Oy));
  stroke(0);
}

void changeAxis() {
  if (mousePressed) {
    Ox = mouseX;
    Oy = mouseY;
    refreshDisplay();
  }
}

void verifyAxis() {
  if (key=='c') {
    changeAxis();
    key = 'o';
  }
}

void refreshDisplay() {
  image(img, 0, 0, img.width, img.height);
}

void giveInfo() {
  float xval = (mouseX-Ox)/px*fx;
  float yval = (-(mouseY-Oy))/py*fy;
  println(xval, yval);
  x = append(x, xval);
  y = append(y, yval);
}

void drawPoint() {
  if (mousePressed && counter>0) {
    strokeWeight(4);
    stroke(0, 0, 255);
    point(mouseX, mouseY);
    giveInfo();
    counter=0;
  }
}

void mousePressed() {
  counter=1;
} 


void keyPressed() { // Press a key to save the data
  if (key == 's') {
    String[] lines = new String[x.length];
    for (int i = 0; i < x.length; i++) {
      lines[i] = x[i] + "\t" + y[i];
    }
    saveStrings("results/"+imgFilename+"_"+iteration+".txt", lines);
    exit(); // Stop the program}
  }
}

