# Airmouse-Using-MPU9250
This project demonstrates how to use an MPU9250 IMU sensor (gyroscope + accelerometer + magnetometer) as an air mouse or motion controller for a computer. The MPU9250 reads orientation data (yaw, pitch, roll) and sends it to the computer over Serial communication.

Control your **mouse cursor** with hand motion using the MPU9250 IMU sensor.  
This project turns your MPU9250 into an **air mouse** or **gesture-based game controller**.

---

## 🚀 Features
- MPU9250 reads **yaw, pitch, roll** values
- Processing sketch maps motion to:
  - Mouse cursor movement  
  - Keyboard arrows (for games like racing, flight sims, etc.)
- Calibration support (`Z` key to reset center position)
- Adjustable sensitivity and smoothing
- Works on Windows/Linux/Mac (Java Robot API)

---

## 🛠️ Hardware Required
- MPU9250 sensor module  
- Arduino/ESP32/ESP8266 (for reading MPU data and sending via Serial)  
- USB cable to connect to PC  

---

## 🔌 Wiring (I²C)
