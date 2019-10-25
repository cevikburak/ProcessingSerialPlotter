int dataNum = 2;

PlotXY[] plots = new PlotXY[dataNum];
color[] colors = {color(0,0,255), color(255,0,0)};

void setup() {
  size(800, 400);
  beginSerial(19200, dataNum);
  for (int i = 0; i < dataNum; i++) {
    plots[i] = new PlotXY(0, 0, width, height);
  }
  
  frameRate(80);
  strokeWeight(1.5);
}

void draw() {
  background(0);
  String[][] inputs = getSerialData();
  //print(inputs);
      
  for (String[] input: inputs) {
    float[] values = float(input);
    for (int i = 0; i < dataNum; i++) {
      plots[i].addPoint(values[i]);
    }
  }
  
  for (int i = 0; i < dataNum; i++) {
    plots[i].plotData(colors[i]);
  }
  
  writeFrames(20, 20);
}

void writeFrames(int x, int y) {
  fill(0);
  noStroke();
  rect(x - 10, 5, 100, y);
  fill(255);
  text(String.format("fps: %d", int(frameRate)), x, y);
}
