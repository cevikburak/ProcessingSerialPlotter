import processing.serial.*;

Serial board;
int size;

void beginSerial(int baudRate, int _size) {
  String port = "";
  size = _size;
  
  try {
    port = Serial.list()[0];
  } 
  catch (Exception err) {
    println(err);
    println("-> No Serial Port Available");
    System.exit(0);
  }

  println("Coonnecting with: " + port);
  board = new Serial(this, port, baudRate);
}

String[][] getSerialData() {
  int counter = 0;
  int maxCount = 10;
  String[] input = new String[0];
  
  while (board.available() > (4 * size + 3) & counter < maxCount) {
    String serial = board.readStringUntil('\n');
    input = append(input, serial);
    counter++;
  }
  print("Available counter: ");
  println(counter);
  
  String[][] output = new String [input.length][2];
  for (int i = 0; i < input.length; i++) {
    output[i] =  split(input[i], ",");
  }

  return output;
}
