void test()//馬達運行行走動作
{
  /*
    RFshoulder.write(70);
    Rshoulder.write(180);
    Relbow.write(130);

    Fshoulder.write(110);
    shoulder.write(0);
    elbow.write(40);
  */
  /*
  if(Serial3.available())//遊戲結束則停止馬達
    {
      char test=Serial3.read();
      if(test=='Z')
      {
          RFshoulder.detach();
          Rshoulder.detach();
          Relbow.detach();
          
          Fshoulder.detach();
          shoulder.detach(); 
          elbow.detach();
      }
    }
    */
  for(int i = 60; i<100;i++)
  {
    RFshoulder.write(i);
    Rshoulder.write(i);
    Relbow.write(i);
    
    Fshoulder.write(i);
    shoulder.write(i);
    elbow.write(i);
    
    analogWrite(WHEEL1A,Speed+10);
    analogWrite(WHEEL1B,0);
    analogWrite(WHEEL2A,Speed+10);
    analogWrite(WHEEL2B,0);
    
    delay(20);
    Serial.println(i);
    }
    
  for(int i = 100 ; i >60;i--)
  {
    RFshoulder.write(i);
    Rshoulder.write(i);
    Relbow.write(i);

    Fshoulder.write(i);
    shoulder.write(i);
    elbow.write(i);

    analogWrite(WHEEL1A,0);
    analogWrite(WHEEL1B,Speed+70);
    analogWrite(WHEEL2A,0);
    analogWrite(WHEEL2B,Speed+70);
    
    delay(20);
    Serial.println(i);
    }
}
