void fight()//接收processing骨架資料並輸出到馬達
{
  if(Serial.available()>0)
  {
    /*
    while(!isStart)//若計分端傳來321開始的訊號則開始戰鬥
    {
        Serial3.print('F');
        if(Serial3.available()>0)
        {
          char c = Serial3.read();
          if(c=='S')
          isStart=true;
          c='0';
        }
    }
    */
    int servoAngle = Serial.read();
    switch(servoAngle)
    {
      case 'a'://標頭字元
        nextServo=0;
        break;
      case 'r'://車子右轉
        analogWrite(WHEEL1A,0);
        analogWrite(WHEEL1B,Speed+70);
        analogWrite(WHEEL2A,0);
        analogWrite(WHEEL2B,Speed+70);
        break;
      case 'l'://車子左轉
        analogWrite(WHEEL1A,Speed+10);
        analogWrite(WHEEL1B,0);
        analogWrite(WHEEL2A,Speed+10);
        analogWrite(WHEEL2B,0);
        break;
      case 's'://車子停下
        analogWrite(WHEEL1A,0);
        analogWrite(WHEEL1B,0);
        analogWrite(WHEEL2A,0);
        analogWrite(WHEEL2B,0);
        break;
      default:
        servoAngles[nextServo] = servoAngle;
        nextServo++;
        if(nextServo>5)
          {
            nextServo = 0;  
          }
        outputAngle();//輸出機械手的角度
    }
    
  }
  /*
    if(Serial3.available())///////遊戲結束則停止馬達
    {
      char test=Serial3.read();
      if(test=='Z')
      {
          isStart=false;
          
          RFshoulder.detach();
          Rshoulder.detach();
          Relbow.detach();
          
          Fshoulder.detach();
          shoulder.detach(); 
          elbow.detach();

          analogWrite(WHEEL1A,0);
          analogWrite(WHEEL1B,0);
          analogWrite(WHEEL2A,0);
          analogWrite(WHEEL2B,0);
          delay(10000);
      }
    }
    */
  /*
  else //待機時播放待機音樂
  {
    static unsigned long timer = millis();
    if (millis() - timer > 300) {
      timer = millis();
      Serial3.print('b');
    }
  }
  */
}
