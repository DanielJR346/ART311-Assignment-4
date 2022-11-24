// Sets up the canvas
PImage pic, ooniverse, muun, sun;
PShape globe, satelite, background, star;
void setup() {
  size(1200, 1000, P3D);
  pic = loadImage("Earf.jpg");
  muun = loadImage("muun.jpg");
  ooniverse = loadImage("oooh.jpg");
  sun = loadImage("sun2.png");
  background(0);
  noStroke();
  globe = createShape(SPHERE, 50);
  satelite = createShape(SPHERE, 25);
  background = createShape(SPHERE, 800);
  star = createShape(SPHERE, 150);
  
  globe.setTexture(pic);
  satelite.setTexture(muun);
  background.setTexture(ooniverse);
  star.setTexture(sun);
}

void draw() {
  background(0);
  
  // Lighting
  //ambientLight(50,50,50);
  //ambient(255,255,255);
  //pointLight(255,255,255, width/2, height/2, 500);
  
  // Create moving background of universe
  pushMatrix();
  translate(width/2, height/2);
  rotateX(radians((float)frameCount / 100  % 360));
  rotateY(radians((float)frameCount / 100  % 360));
  shape(background);
  popMatrix();
  
  
  // Create the SUN
  pushMatrix();
  translate(width/2, height/2);
  rotateY(radians((float)frameCount / 10  % 360));
  shape(star);
  emissive(255,255,255);
  popMatrix();
  
  // Create orbit of Earf
  pushMatrix();
  // mMve globe to cursor position
  translate (width/2, height/2);
  // Make globe orbit around cursor on the Y-axis
  rotateY(radians(frameCount * 2 % 360));
  translate(450,0,0);
  // Make globe rotate along the Y-axis
  rotateX(radians(23.4)); // Attempt to tilt the Earf
  rotateY(-2 * radians(frameCount * 2 % 360));
  // Draw globe
  shape(globe);
  popMatrix();
  
  // Give Earf a moon
  pushMatrix();
  // Push to center
  translate(width/2, height/2);
  // Rotate around same point as Earf
  rotateY(radians(frameCount * 2 % 360));
  translate(450,0,0);
  // Rotate around Earf
  rotateX(radians(23.4)); // Attempt to tilt the Earf
  rotateY(radians(frameCount * 5  % 360));
  //rotateX(radians(23.4)); // tilt the orbit of the moon
  translate(100,0,0);
  shape(satelite);
  popMatrix();
  
}
