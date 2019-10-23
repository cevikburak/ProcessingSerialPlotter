import processing.serial.*;

PlotXY plot;
Serial board;
float val = 0;

void beginSerial(int baudRate) {
  String port = Serial.list()[0];
  print("Coonnecting with: ");
  println(port);

  board = new Serial(this, port, baudRate);
  plot = new PlotXY(width);
}

void plotLines() {
  float margin = 10;
  int count = 0;
  while (board.available() > 5) {
    float val = getInput();
    float y = map(val, 0, 1023, height - margin, 0 + margin);
    plot.addPoint(y);

    count++;
    if (count > 10) {
      break;
    }
  }
  println(count);
  background(0);
  plot.plotData(color(255));
}

float getInput() {
  String strInput = board.readStringUntil('\n');
  if (strInput != null) {
    val = float(strInput);
  }
  return val;
}
