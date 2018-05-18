#include<Servo.h>
#define WHEEL1A 2
#define WHEEL1B 3
#define WHEEL2A 12
#define WHEEL2B 13
#define Speed 140

  int nextServo = 0;
  int servoAngles[] = {0,0,0,0,0,0};
  bool isStart=false;
  
  int debounceDelay=100;
  
  
  Servo shoulder;
  Servo elbow;
  Servo Fshoulder;
  Servo Rshoulder;
  Servo Relbow;
  Servo RFshoulder;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  
  pinMode(21,INPUT_PULLUP);//被打按鈕上拉電阻,另一腳GND
  
  pinMode(2, OUTPUT);//輪子馬達腳位
  pinMode(3, OUTPUT);
  pinMode(12, OUTPUT);
  pinMode(13, OUTPUT);
  
  
  //attachInterrupt(digitalPinToInterrupt(2), hi2,HIGH);//設定中斷函式模式
  //attachInterrupt(digitalPinToInterrupt(18), hi18,HIGH);//設定中斷函式模式
  attachInterrupt(digitalPinToInterrupt(21),hi21,HIGH);//設定中斷函式模式
  
  RFshoulder.attach(5);
  Rshoulder.attach(6);
  Relbow.attach(7);
  
  Fshoulder.attach(8);
  shoulder.attach(9); 
  elbow.attach(10);

  RFshoulder.write(180);
  Fshoulder.write(20);
  delay(500);
  Relbow.write(180);
  elbow.write(0);
  delay(500);
  Rshoulder.write(180);
  shoulder.write(0);
  delay(500);
  

  /*
  delay(500);
  
  delay(500);
  
  delay(2000);
  */
  //beforeTest();
}

void loop() {
 //test();
 fight();
  
}
