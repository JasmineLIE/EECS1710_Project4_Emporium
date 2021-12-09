import netP5.*;
import oscP5.*;
OscP5 instru1, instru2, instru3, instru4, oscar;

float oscSendData1 = 0;
float oscSendData2 = 0;
float oscSendData3 = 0;
float oscSendData4 = 0;
float oscSendData5;
float mouseLoc;

String ipNumber = "127.0.0.1";
int receivePort = 7110;
int sendPort1 = 7400;
int sendPort2 = 7401;
int sendPort3 = 7402;
int sendPort4 = 7403;
int sendPort5 = 7404;



OscP5 oscP5;
NetAddress remoteLoc1, remoteLoc2, remoteLoc3, remoteLoc4, remoteLoc5;

float intensity1 = 0.0;
float intensity2 = 0.0;
float intensity3 = 0.0;
float intensity4 = 0.0;




String channel = "test";


float oscReceiveData = 0;




void oscSetup() {
  oscP5 = new OscP5(this, receivePort);  // start osc
  remoteLoc1 = new NetAddress(ipNumber, sendPort1);
  remoteLoc2 = new NetAddress(ipNumber, sendPort2);
  remoteLoc3 = new NetAddress(ipNumber, sendPort3);
  remoteLoc4 = new NetAddress(ipNumber, sendPort4);
  remoteLoc5 = new NetAddress(ipNumber, sendPort5);
}

//2.  This function receives OSC.  It runs automatically; no need to call it in your code.
void oscEvent(OscMessage myMessage) {
  println(myMessage);
  if (myMessage.checkAddrPattern("/" + channel)) {
    if (myMessage.checkTypetag("f")) {  // types are i = int, f = float, s = String, ifs = all
      oscReceiveData = myMessage.get(0).floatValue();  // commands are intValue, floatValue, stringValue
    }
  }
}

//3.  This function sends OSC.  Put it in your draw(), or in control functions like mousePressed() and keyPressed().
void oscSend1() {
  OscMessage myMessage;
  myMessage = new OscMessage("/" + channel);
  myMessage.add(oscSendData1);
  oscP5.send(myMessage, remoteLoc1);
}
void oscSend2() {
  OscMessage myMessage;
  myMessage = new OscMessage("/" + channel);
  myMessage.add(oscSendData2);
  oscP5.send(myMessage, remoteLoc2);
}
void oscSend3() {
  OscMessage myMessage;
  myMessage = new OscMessage("/" + channel);
  myMessage.add(oscSendData3);
  oscP5.send(myMessage, remoteLoc3);
}
void oscSend4() {
  OscMessage myMessage;
  myMessage = new OscMessage("/" + channel);
  myMessage.add(oscSendData4);
  oscP5.send(myMessage, remoteLoc4);
}

void oscSend5() {

  OscMessage myMessage;
  myMessage = new OscMessage("/" + channel);
  myMessage.add(oscSendData5);
  oscP5.send(myMessage, remoteLoc5);
}


public void setAmp1(float amp) {
  intensity1 = 20 + amp * 100;
}
public void setAmp2(float amp) {
  intensity2 = 20 + amp * 100;
}

public void setAmp3(float amp) {
  intensity3 = 20 + amp * 100;
}

public void setAmp4(float amp) {
  intensity4 = 20 + amp * 100;
}
