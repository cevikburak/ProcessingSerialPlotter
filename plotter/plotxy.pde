class PlotXY {
  float[] line;
  int x;
  int y;
  int len_y;
  
  PlotXY(int _x, int _y, int len_x, int _len_y) {
    line = new float[len_x];
    x = _x;
    y = _y;
    len_y = _len_y;
    
    for (int i = 0; i < line.length; i++) {
      line[i] = 0;
    }
  }
  
  void addPoint(float newPoint) {
    float newY = map(newPoint, 0, 1023, len_y, 0 + y);
    for (int i = 0; i < line.length - 1; i++) {
      line[i] = line[i+1];
    }
    line[line.length - 1] = newY;
  }
  
  void plotData(color c) {
    stroke(c);
    for (int i = 0; i < line.length - 1; i++) {
      line(i + x, line[i], i + 1 + x, line[i+1]);
    }
  }
}
