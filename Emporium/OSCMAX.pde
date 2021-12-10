import netP5.*;
import oscP5.*;
OscP5 instru1, instru2, instru3, instru4, oscar;

float oscSendData1 = 0;
float oscSendData2 = 0;
float oscSendData3 = 0;
float oscSendData4 = 0;
float oscSendData5 = 0;
float oscSendData6 = 0;
float oscSendData7 = 0;
float oscSendData8 = 0;
float oscSendData9 = 0;
float mouseLoc;

String ipNumber = "127.0.0.1";
int receivePort = 7110;
int sendPort1 = 7400;
int sendPort2 = 7401;
int sendPort3 = 7402;
int sendPort4 = 7403;

int sendPort5 = 7404;
int sendPort6 = 7405;
int sendPort7 = 7406;
int sendPort8 = 7407;
int sendPort9 = 7408;


OscP5 oscP5;
NetAddress remoteLoc1, remoteLoc2, remoteLoc3, remoteLoc4, remoteLoc5, remoteLoc6, remoteLoc7, remoteLoc8, remoteLoc9;

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
  remoteLoc6 = new NetAddress(ipNumber, sendPort6);
  remoteLoc7 = new NetAddress(ipNumber, sendPort7);
  remoteLoc8 = new NetAddress(ipNumber, sendPort8);
 remoteLoc9 = new NetAddress(ipNumber, sendPort9);
  
 
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

void oscSend6() {

  OscMessage myMessage;
  myMessage = new OscMessage("/" + channel);
  myMessage.add(oscSendData6);
  oscP5.send(myMessage, remoteLoc6);
}

void oscSend7() {

  OscMessage myMessage;
  myMessage = new OscMessage("/" + channel);
  myMessage.add(oscSendData7);
  oscP5.send(myMessage, remoteLoc7);
}

void oscSend8() {

  OscMessage myMessage;
  myMessage = new OscMessage("/" + channel);
  myMessage.add(oscSendData8);
  oscP5.send(myMessage, remoteLoc8);
}

void oscSend9() {

  OscMessage myMessage;
  myMessage = new OscMessage("/" + channel);
  myMessage.add(oscSendData9);
  oscP5.send(myMessage, remoteLoc9);
}


public void setAmp1(float amp) {
  intensity1 = 20 + amp * 200;
}
public void setAmp2(float amp) {
  intensity2 = 20 + amp * 200;
}

public void setAmp3(float amp) {
  intensity3 = 20 + amp * 200;
}

public void setAmp4(float amp) {
  intensity4 = 20 + amp * 200;
}
