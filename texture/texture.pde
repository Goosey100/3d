PImage glow, dirt, grasstop, grassbottom, grassmid;


float rotx, roty;

void setup () {
  size (800, 800, P3D);
  glow =loadImage("glow.png");
  dirt = loadImage("dirt.png");
  grasstop = loadImage("grasstop.png");
  grassbottom = loadImage ("grassbottom.png");
  grassmid = loadImage ("grassmid.png");
  textureMode(NORMAL);
}

void draw() {
  background(0);
  texturedCube(width/2, height/2, 0, glow, 200);
  texturedCube(100, 100, 0, dirt, 200);
  texturedCube (width/2,100,0,grasstop,grassmid,grassbottom,100);
}

void texturedCube(float x, float y, float z, PImage texture, float size) {

  pushMatrix();
  translate(x, y, z);
  scale(size);

  rotateX(rotx);
  rotateY(roty);
  // rotateZ();

  noStroke();

  beginShape(QUADS);
  texture(texture);

  //top
  //     x, y, z,tx, ty
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);

  //bottom
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);


  //front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  //back
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);

  //left
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);
  //right
  vertex(1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);

  endShape();


  popMatrix();
}




void texturedCube(float x, float y, float z, PImage top, PImage side, PImage bottom, float size) {

  pushMatrix();
  translate(x, y, z);
  scale(size);

  rotateX(rotx);
  rotateY(roty);
  // rotateZ();

  noStroke();

  beginShape(QUADS);
  texture(top);

  //top
  //     x, y, z,tx, ty
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);

  endShape();
  beginShape(QUADS);
  texture(bottom);

  //bottom
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  endShape();

  beginShape(QUADS);
  texture(side);


  //front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  //back
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);

  //left
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);
  //right
  vertex(1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);

  endShape();


  popMatrix();
}





void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY)*0.01;
  roty = roty + (pmouseX - mouseX)*0.01;
}
