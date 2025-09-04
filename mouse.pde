import processing.serial.*;
import java.awt.Robot;
import java.awt.AWTException;

Serial myPort;
Robot robot;

float yaw, pitch, roll;
float yaw0, pitch0;  // calibration offsets
int screenW, screenH;

void setup() {
  size(400, 200);
  println(Serial.list());
  myPort = new Serial(this, "COM5", 115200); // change COM port
  myPort.bufferUntil('\n');

  try {
    robot = new Robot();
  } catch (AWTException e) {
    e.printStackTrace();
  }

  screenW = displayWidth;
  screenH = displayHeight;
}

void draw() {
  background(20);
  fill(255);
  text("Yaw: " + yaw + " Pitch: " + pitch, 20, 40);
  text("Press Z to calibrate center", 20, 70);

  // Map yaw/pitch to screen position
  float x = map(yaw - yaw0, -45, 45, 0, screenW);
  float y = map(pitch - pitch0, -45, 45, 0, screenH);

  // Constrain within screen
  x = constrain(x, 0, screenW - 1);
  y = constrain(y, 0, screenH - 1);

  // Move mouse
  robot.mouseMove(int(x), int(y));
}

void serialEvent(Serial p) {
  String line = trim(p.readStringUntil('\n'));
  if (line == null || line.length() == 0) return;
  String[] data = split(line, ',');
  if (data.length >= 3) {
    yaw = float(data[0]);
    pitch = float(data[1]);
    roll = float(data[2]);
  }
}

void keyPressed() {
  if (key == 'z' || key == 'Z') {
    yaw0 = yaw;
    pitch0 = pitch;
  }
}
