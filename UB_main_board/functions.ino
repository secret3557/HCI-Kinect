void outputAngle()//輸出機械手的角度
{
  
    //右手輸出角度
    Rshoulder.write(180-servoAngles[1]);
    
    if(servoAngles[0]<85)
    {
      RFshoulder.write(85);
    }
    else
    {
      RFshoulder.write(servoAngles[0]);
    }

    if(servoAngles[2]<140 || servoAngles[2]<1)
    {
      Relbow.write(140);
    }
    else
    {
      Relbow.write(servoAngles[2]);
    }


    //左手輸出角度
    shoulder.write(servoAngles[4]);
    
    if(servoAngles[3]<85)
    {
      Fshoulder.write(85);
    }
    else
    {
      Fshoulder.write(180-servoAngles[3]);
    }
    
    if(servoAngles[5]<140 || servoAngles[5]<1)
    {
      elbow.write(40);
    } 
    else
    {
      elbow.write(180-servoAngles[5]);
    }
}

void beforeTest()//初始化機械手角度
{
    RFshoulder.write(80);
    Rshoulder.write(80);
    Relbow.write(80);

    Fshoulder.write(80);
    shoulder.write(80);
    elbow.write(80);
    delay(1000);
    
    analogWrite(WHEEL1A,0);
    analogWrite(WHEEL1B,0);
    analogWrite(WHEEL2A,0);
    analogWrite(WHEEL2B,0);
}

void hi21()//藍芽傳輸被打扣分
{
  if(debounced())
  {
    Serial3.print('1');
    //detachInterrupt(0);
  }
}

boolean debounced() //解除機械彈跳
{ //check if debounced
  static unsigned long lastMillis=0; //record last millis
  unsigned long currentMillis=millis(); //get current elapsed time
  if ((currentMillis-lastMillis) > debounceDelay) {
    lastMillis=currentMillis; //update lastMillis with currentMillis
    return true; //debounced
    }
  else {return false;} //not debounced
} 
