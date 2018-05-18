void correct()
{
    ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonDepthMap();
  
  
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
      if(FshoulderAngle<1)
      FshoulderAngle=1;
      
      //shoulderAngle = map(shoulderAngle,0,lenth,0,90);/////HEEEEEEEEEEEEEEEEER

      
      fill(255,255,255);
      scale(3);
      text("shoulder:"+int(shoulderAngle)+"\n"+
            "elbow:"+int(elbowAngle)+"\n"+
            "Fshoulder:"+int(FshoulderAngle),10,10);
      //port.write(int(FshoulderAngle));
      //port.write(int(shoulderAngle));
      //port.write(int(elbowAngle));
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
      if(LFshoulderAngle<1)
      LFshoulderAngle=1;
      
      //LshoulderAngle = map(LshoulderAngle,0,lenth,0,90);////////HEEEEEEEEEEEEEEER

      
      fill(255,255,255);
      text("Lshoulder:"+int(LshoulderAngle)+"\n"+
            "Lelbow:"+int(LelbowAngle)+"\n"+
            "LFshoulder:"+int(LFshoulderAngle),10,50);
      
      //port.write(int(LFshoulderAngle));
      //port.write(int(LshoulderAngle));
      //port.write(int(LelbowAngle));
      
      if(LshoulderAngle>lenth)
      {
        lenth=LshoulderAngle;
      }
      
      
      println("lenth : "+lenth);
      println("LshoulderAngle : "+LshoulderAngle);
    }
  }
}