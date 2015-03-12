/* Created by: Dawn Christine P. Corpuz
 CIE 150 Homework 1
 */


import processing.serial.*;

Serial myPort;  // Create object from Serial class
int val_a, val_b, val1, val2;      // Data received from the serial port

void setup() 
{
  size(400, 400);
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600);
  textFont(createFont("Impact", 36));
  
}

void draw()
{
  if ( myPort.available() > 0) {  // If data is available,
    val_a = myPort.read();         // read it and store it in val
    val_b = myPort.read();
    val1 =  (val_a << 2) | val_b;
    val_a = myPort.read();
    val_b = myPort.read();
    val2 = (val_a << 2) | val_b;
    myPort.clear();
  }
  background(255);             // Set background to white
  
  fill(0);
  text("V1 = " + val1/1023.0*3.3 + " volts", 50, 100);
  text("V2 = " + val2/1023.0*5.0 + " volts", 50, 200);
}



/*

// Wiring / Arduino Code
// Code for sensing a switch status and writing the value to the serial port.

int switchPin = 4;                       // Switch connected to pin 4

void setup() {
  pinMode(switchPin, INPUT);             // Set pin 0 as an input
  Serial.begin(9600);                    // Start serial communication at 9600 bps
}

void loop() {
  if (digitalRead(switchPin) == HIGH) {  // If switch is ON,
    Serial.write(1);               // send 1 to Processing
  } else {                               // If the switch is not ON,
    Serial.write(0);               // send 0 to Processing
  }
  delay(100);                            // Wait 100 milliseconds
}

*/
