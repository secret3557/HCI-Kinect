# HCI-Kinect
#### This is my honors project,Use Kinect body skeleton sensor,let users to control the robot to fight.
#### here is demo video : https://youtu.be/jRwK191-0JY

![](https://github.com/secret3557/HCI-Kinect/blob/master/image/UBphoto.jpg)
---

## Software Architecture

Access the skeleton positions from the Kinect, the skeleton detection supports up to 6 users with 25 joints and hand three states open, close and lasso.
Then send the angle data form processing to arduino over the serial port.

![](https://github.com/secret3557/HCI-Kinect/blob/master/image/UBframe.png)

---

## Processing with Kinect
![](https://github.com/secret3557/HCI-Kinect/blob/master/image/UBskeleton.jpg)

library:http://codigogenerativo.com/code/kinectpv2-k4w2-processing-library/
---

## 3Dprint Model

![](https://github.com/secret3557/HCI-Kinect/blob/master/image/UBmodel.jpg)

#### Notice
- The UB_Kinect_body folder is the files for Processing IDE to run;
- and the UB_main_board is for arduino Mega2560 board;
