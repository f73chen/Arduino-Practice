// Variables for the ultrasound sensor
int triggerPin = 3; // Digital out
int echoPin = 2;    // Digital in
long duration;      // Delay perceived by the sensor
float distance;     // Distance as a function of time

// Variables for the stepper motor
int motor1PinA = 4;
int motor1PinB = 5;
int motor1PinC = 6;
int motor1PinD = 7;
int motor2PinA = 8;
int motor2PinB = 9;
int motor2PinC = 10;
int motor2PinD = 11;
int stepsPerRev = 512;

// Variables for the detection array
const int gridPixels = 4;       // Assume odd number of pixels
const float gridWidth = 20;     // (cm)
const float handDistance = 5;  // (cm)
float pixelWidth = gridWidth / (gridPixels - 1);  // Width of each pixel (cm)
float totalRotation = 2 * atan((gridWidth/2) / handDistance);  // Angular window (rad)
float distances[gridPixels][gridPixels];

void setup() {
  // Initialize ultrasound pins
  pinMode(triggerPin, OUTPUT);
  pinMode(echoPin, INPUT);

  // Initialize stepper motor pins
  pinMode(motor1PinA, OUTPUT);
  pinMode(motor1PinB, OUTPUT);
  pinMode(motor1PinC, OUTPUT);
  pinMode(motor1PinD, OUTPUT);
  pinMode(motor2PinA, OUTPUT);
  pinMode(motor2PinB, OUTPUT);
  pinMode(motor2PinC, OUTPUT);
  pinMode(motor2PinD, OUTPUT);
  
  Serial.begin(9600); // Setup serial
 }

 // Assume that both motors are set to the top left and scanning left-right / up-down
 void loop() {
  for (int i = 0; i < gridPixels; i++) {
    for (int j = 0; j < gridPixels; j++) {
      sendPulse();                        // Send a pulse to the trigger pin
      duration = pulseIn(echoPin, HIGH);  // Read the input pin
      distance = duration * 0.034 / 2;    // Multiply by the speed of sound and divide by the bounce
      distances[i][j] = distance;         // Store the current distance in the array
      printValues(duration, distance);    // Display the calculated values

      if (j != gridPixels - 1) {
        turnMotor(1, angle(j), 2.0);      // Shift column if not at the last column
        delay(100);
      }
    }
    turnMotor(1, -totalRotation, 2.0);    // Return Motor 1 to the left
    delay(100);
    if (i != gridPixels - 1) {
      turnMotor(2, angle(i), 2.0);        // Shift row if not at the last row
      delay(100);
    }
  }
  turnMotor(2, -totalRotation, 2.0);      // Return Motor 2 to the top
  printDistances();
  delay(1000000);
 }

// Send 1 pulse out of the trigger
void sendPulse() {
  digitalWrite(triggerPin, LOW);  // Turns OFF
  delayMicroseconds(2);           // Wait 2 microseconds
  digitalWrite(triggerPin, HIGH); // Turns ON
  delayMicroseconds(10);          // Wait 10 microseconds
  digitalWrite(triggerPin, LOW);  // Turns OFF
}

// Print ping duration and distance
void printValues(long duration, int distance) {
  Serial.println();
  Serial.print(duration);
  Serial.print("mu-s, ");
  Serial.print(distance);
  Serial.println(" cm");
  delay(200);
}

// Print the distances array
void printDistances() {
  for (int i = 0; i < gridPixels; i++) {
    Serial.print("[");
    for (int j = 0; j < gridPixels; j++) {
      Serial.print(distances[i][j]);
      Serial.print(", ");
    }
    Serial.println("]");
  }
}

// Calculate the next turning angle in radians (should add up to totalRotation per cycle)
float angle(int i) {
  float initialOffset = gridWidth/2 - pixelWidth * i;
  float nextOffset = initialOffset - pixelWidth;
  Serial.print("Initial Offset: ");
  Serial.println(initialOffset);
  Serial.print("Next Offset: ");
  Serial.println(nextOffset);
  return atan(initialOffset / handDistance) - atan(nextOffset / handDistance);
}

// Turns the motor by one step counter-clockwise
void motorStep(float wait, int pinA, int pinB, int pinC, int pinD) {
  for (int i = 0; i < 8; i++) {
    digitalWrite(pinA, i==7 or i==0 or i==1);
    digitalWrite(pinB, i==1 or i==2 or i==3);
    digitalWrite(pinC, i==3 or i==4 or i==5);
    digitalWrite(pinD, i==5 or i==6 or i==7);
    delay(wait);
  }
}

// Turns motor [index] by [x] radians with [wait] ms between actions
// The if statements can be placed within the for loop to make the code shorter but less efficient
void turnMotor(int index, float rad, float wait) {
  int steps = int(stepsPerRev * rad / (2*PI));
  if (index == 1) {
    if (steps > 0) {  // Motor 1, CCW
      Serial.print("Motor 1, CCW for: ");
      for (int i = 0; i < abs(steps); i++) {
        motorStep(wait, motor1PinA, motor1PinB, motor1PinC, motor1PinD);
      }
    } else {          // Motor 1, CW
      Serial.print("Motor 1,  CW for: ");
      for (int i = 0; i < abs(steps); i++) {
        motorStep(wait, motor1PinD, motor1PinC, motor1PinB, motor1PinA);
      }
    }
  } else {
    if (steps > 0) {  // Motor 2, CCW
      Serial.print("Motor 2, CCW for: ");
      for (int i = 0; i < abs(steps); i++) {
        motorStep(wait, motor2PinA, motor2PinB, motor2PinC, motor2PinD);
      }
    } else {          // Motor 2, CW
      Serial.print("Motor 2,  CW for: ");
      for (int i = 0; i < abs(steps); i++) {
        motorStep(wait, motor2PinD, motor2PinC, motor2PinB, motor2PinA);
      }
    }
  }
  Serial.println(steps);
}
