

void setup() {
  size(800, 400);
  beginSerial(19200);
  
  background(0);
  frameRate(80);
  strokeWeight(1.5);
}

void draw() {
  plotLines();
  
  
  
  fill(0);
  noStroke();
  rect(10, 5, 100, 20);
  fill(255);
  text(String.format("fps: %d", int(frameRate)), 20, 20);
}
