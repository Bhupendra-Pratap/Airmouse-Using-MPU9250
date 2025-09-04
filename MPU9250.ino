#include "MPU9250.h"
MPU9250 mpu;

void setup() {
  Serial.begin(115200);
  Wire.begin();
  delay(2000);
  mpu.setup(0x68); // I2C address for MPU9250
}

void loop() {
  if (mpu.update()) {
    Serial.print(mpu.getYaw()); Serial.print(",");
    Serial.print(mpu.getPitch()); Serial.print(",");
    Serial.println(mpu.getRoll());
  }
}
