class PlotXY {
  float[] line;
  PlotXY(int len) {
    line = new float[len];
    for (int i = 0; i < line.length; i++) {
      line[i] = 0;
    }
  }
  
  void addPoint(float newPoint) {
    for (int i = 0; i < line.length - 1; i++) {
      line[i] = line[i+1];
    }
    line[line.length - 1] = newPoint;
  }
  
  void plotData(color c) {
    stroke(c);
    for (int i = 0; i < line.length - 3; i++) {
      //curve(i, line[i], i+1, line[i+1], i+2, line[i+2], i+3, line[i+3]);
      line(i, line[i], i+1, line[i+1]);
    }
  }
}
