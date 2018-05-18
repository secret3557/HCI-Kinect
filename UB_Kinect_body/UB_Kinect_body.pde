/*
Thomas Sanchez Lengeling.
 http://codigogenerativo.com/

 KinectPV2, Kinect for Windows v2 library for processing

 Skeleton depth tracking example
 
 The MIT License (MIT)

Copyright (c) 2014 Thomas Sanchez Lengeling

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
 */

import java.util.ArrayList;
import KinectPV2.KJoint;
import KinectPV2.*;
import processing.serial.*;
Serial port;
float lenth=50;

KinectPV2 kinect;


void setup() {
  size(512, 424, P3D);
  
  
  kinect = new KinectPV2(this);

  //Enables depth and Body tracking (mask image)
  kinect.enableDepthMaskImg(true);
  kinect.enableSkeletonDepthMap(true);
  delay(2000);
  kinect.init();
  
  println(Serial.list());
  String portName = Serial.list()[2];
  port = new Serial(this,portName,9600);
  
  for(int i = 0 ; i < 100 ; i++)//correct lenth by different people 
  {
    correct();
    delay(40);
  }
}

void draw() {
  background(0);
  smooth();
  image(kinect.getDepthMaskImage(), 0, 0);

  //get the skeletons as an Arraylist of KSkeletons
  
  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonDepthMap();
  
  //println(lenth);
  //individual joints
  
  for (int i = 0; i < skeletonArray.size(); i++) 
  {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(0);
    //if the skeleton is being tracked compute the skleton joints
    if (skeleton.isTracked()) {
      
      KJoint[] joints = skeleton.getJoints();
      
      //println(skeletonArray.size());
      
      color col  = skeleton.getIndexColor();
      fill(col);
      stroke(col);
      
      drawBody(joints);
      //drawHandState(joints[KinectPV2.JointType_HandRight]);
      //drawHandState(joints[KinectPV2.JointType_HandLeft]);
      
/***************************RIGHT HAND*********************************/
      
      
      
      PVector rightHand = new PVector();
      rightHand = joints[KinectPV2.JointType_HandRight].getPosition();
      //rightHand.z = zAxisOfHand(joints);
      //println(rightHand.z);
      
      PVector rightElbow = new PVector();
      rightElbow = joints[KinectPV2.JointType_ElbowRight].getPosition();
      //rightElbow.z = zAxisOfElbow(joints);
      
      PVector rightShoulder = new PVector();
      rightShoulder = joints[KinectPV2.JointType_ShoulderRight].getPosition();
      //rightShoulder.z = zAxisOfShoulder(joints);
      
      PVector rightHip = new PVector();
      rightHip = joints[KinectPV2.JointType_HipRight].getPosition();
      //rightHip.z = zAxisOfHip(joints);
      
      PVector rightHand3D = new PVector(rightHand.x,rightHand.y);
      PVector rightElbow3D = new PVector(rightElbow.x,rightElbow.y);
      PVector rightShoulder3D = new PVector(rightShoulder.x,rightShoulder.y);
      PVector rightHip3D = new PVector(rightHip.x,rightHip.y);
      
      
      PVector torsoOrientation=
        PVector.sub(rightShoulder3D,rightHip3D);
      PVector upperArmOrientation=
        PVector.sub(rightElbow3D,rightShoulder3D);
       
      float FshoulderAngle = angleOf(rightElbow3D,
                                    rightShoulder3D,
                                    torsoOrientation);
      
      float elbowAngle = angleOf(rightHand3D,
                                 rightElbow3D,
                                 upperArmOrientation);
      
      float shoulderAngle =rightElbow3D.x - rightShoulder3D.x ;
      
      
      
      if(shoulderAngle<1)
      shoulderAngle=1;
      if(shoulderAngle>lenth)
      shoulderAngle=lenth;
      if(FshoulderAngle<1)
      FshoulderAngle=1;
      
      shoulderAngle = map(shoulderAngle,0,lenth,0,80);/////HEEEEEEEEEEEEEEEEER

      
      fill(255,255,255);
      scale(3);
      /*
      text("shoulder:"+int(shoulderAngle)+"\n"+
            "elbow:"+int(elbowAngle)+"\n"+
            "Fshoulder:"+int(FshoulderAngle),10,10);
            */
            
      port.write('a');
      port.write(int(FshoulderAngle));
      port.write(int(shoulderAngle));
      port.write(int(elbowAngle));
      //println(FshoulderAngle);
      /***************************LEFT HAND*********************************/
      
      PVector leftHand = new PVector();
      leftHand = joints[KinectPV2.JointType_HandLeft].getPosition();
      //rightHand.z = zAxisOfHand(joints);
      //println(rightHand.z);
      
      PVector leftElbow = new PVector();
      leftElbow = joints[KinectPV2.JointType_ElbowLeft].getPosition();
      //rightElbow.z = zAxisOfElbow(joints);
      
      PVector leftShoulder = new PVector();
      leftShoulder = joints[KinectPV2.JointType_ShoulderLeft].getPosition();
      //rightShoulder.z = zAxisOfShoulder(joints);
      
      PVector leftHip = new PVector();
      leftHip = joints[KinectPV2.JointType_HipLeft].getPosition();
      //rightHip.z = zAxisOfHip(joints);
      
      PVector leftHand3D = new PVector(leftHand.x,leftHand.y);
      PVector leftElbow3D = new PVector(leftElbow.x,leftElbow.y);
      PVector leftShoulder3D = new PVector(leftShoulder.x,leftShoulder.y);
      PVector leftHip3D = new PVector(leftHip.x,leftHip.y);
      
      
      PVector LtorsoOrientation=
        PVector.sub(leftShoulder3D,leftHip3D);
      PVector LupperArmOrientation=
        PVector.sub(leftElbow3D,leftShoulder3D);
       
      float LFshoulderAngle = angleOf(leftElbow3D,
                                    leftShoulder3D,
                                    LtorsoOrientation);
      
      float LelbowAngle = angleOf(leftHand3D,
                                 leftElbow3D,
                                 LupperArmOrientation);
      
      float LshoulderAngle =leftShoulder3D.x-leftElbow3D.x  ;
      
      
      if(LshoulderAngle<1)
      LshoulderAngle=0;
      if(LshoulderAngle>lenth)
      LshoulderAngle=lenth;
      if(LFshoulderAngle<1)
      LFshoulderAngle=1;
      
      LshoulderAngle = map(LshoulderAngle,0,lenth,0,80);////////HEEEEEEEEEEEEEEER

      
      fill(0,0,0);
      /*
      text("Lshoulder:"+int(LshoulderAngle)+"\n"+
            "Lelbow:"+int(LelbowAngle)+"\n"+
            "LFshoulder:"+int(LFshoulderAngle),10,50);
      */
      
      port.write(int(LFshoulderAngle));
      port.write(int(LshoulderAngle));
      port.write(int(LelbowAngle));
      
      PVector head = new PVector();
      head = joints[KinectPV2.JointType_Head].getPosition();
      PVector hip = new PVector();
      hip = joints[KinectPV2.JointType_SpineBase].getPosition();
      
      float turn =abs(head.x-hip.x);
      
      if((turn-lenth)>0&&head.x>hip.x)
      {port.write('r');text("Right",10,50);}
      else if((turn-lenth)>0&&head.x<hip.x)
      {port.write('l');text("Left",10,50);}  
      else{port.write('s');text("StoPPPPP",10,50);}
    }
    
  }

  fill(255, 255, 255);
  scale(2);
  text(frameRate, 200, 30);
}


/************************************************************************/

float angleOf(PVector one,PVector two, PVector axis)
{
     PVector limb = PVector.sub(two,one);
     return degrees(PVector.angleBetween(limb,axis));
}

float zAxisOfHand(KJoint[] joints)//************get z Axis of Hand
{
      int [] depthValues = kinect.getRawDepthData();
      int position = (int)joints[KinectPV2.JointType_HandRight].getX()+
                     (int)joints[KinectPV2.JointType_HandRight].getY()*512;
      //println(depthValues[position]);
      
      if(position >= depthValues.length || position < 0)//if skeleton out of range
      return 0;
      return((depthValues[position]-500)/1.5);
}
float zAxisOfElbow(KJoint[] joints)//************get z Axis of Hand
{
      int [] depthValues = kinect.getRawDepthData();
      int position = (int)joints[KinectPV2.JointType_ElbowRight].getX()+
                     (int)joints[KinectPV2.JointType_ElbowRight].getY()*512;
      
      if(position >= depthValues.length|| position < 0)//if skeleton out of range
      return 0;
      return((depthValues[position]-500)/1.5);
}
float zAxisOfShoulder(KJoint[] joints)//************get z Axis of Hand
{
      int [] depthValues = kinect.getRawDepthData();
      int position = (int)joints[KinectPV2.JointType_ShoulderRight].getX()+
                     (int)joints[KinectPV2.JointType_ShoulderRight].getY()*512;
      
      if(position >= depthValues.length|| position < 0)//if skeleton out of range
      return 0;
      return((depthValues[position]-500)/1.5);
}
float zAxisOfHip(KJoint[] joints)//************get z Axis of Hand
{
      int [] depthValues = kinect.getRawDepthData();
      int position = (int)joints[KinectPV2.JointType_HipRight].getX()+
                     (int)joints[KinectPV2.JointType_HipRight].getY()*512;
      
      if(position >= depthValues.length|| position < 0)//if skeleton out of range
      return 0;
      return((depthValues[position]-500)/1.5);
}

/*
float LengthOfVector(PVector v)
{
  float u =sqrt( pow(v.x,2)+pow(v.y,2)+pow(v.z,2));
  return u;
}
float DotProduct(PVector v,PVector u)
{
  float i = v.x*u.x + v.y*u.y + v.z+u.z;
  return i;
}
*/