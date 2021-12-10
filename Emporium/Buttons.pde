//Perlin Noise: https://processing.org/examples/noise1d.html

boolean freqSelect1 = false;
boolean freqSelect2 = false;
boolean freqSelect3 = false;
boolean freqSelect4 = false;

class Buttons {
  float posX, posY, sizeXY;
  color offColor, hoverColor, clickColor, nowColor, playColor;
  String label;
  boolean hovered=false;
  boolean clicked=false;
  boolean toggleSwitch=false;
  boolean repeater=false;


  String buttonType;
  Buttons(float x, float y, float s, color oc, String d, String bt) {
    posX = x;
    posY = y;
    sizeXY = s;
    offColor = oc;
    ColorsInit();
    nowColor = offColor;
    label = d;
    buttonType = bt;
  }


  void ColorsInit() {
    hoverColor = blendColor(offColor, color(40), ADD);
    clickColor = blendColor(offColor, color(120), ADD);
    playColor = blendColor(offColor, color(sizeXY), ADD);
  }

  void update() {

    checkButton();
    drawButton();
  }

  void checkButton() {
//buttons are recognized by their type, port 1-4.  When the button is pressed, the function looks at the port and depending on which kind, sends a bang to the connected udpreceive

    if (buttonType == "port1") {
      if (hitDetect(mouseX, mouseY, 0, 0, posX, posY, sizeXY, sizeXY)) {
        if (!mousePressed) {
          repeater=false;
          hovered=true;
          clicked=false;
        } else if (mousePressed&&!repeater) {
          repeater=true;
          hovered=true;
          clicked=true;
          toggleSwitch = !toggleSwitch;
          oscSendData1 = 1;
          oscSend1();
        }
      } else {
        hovered=false;
        clicked=false;
      }
    }

    if (buttonType == "port2") {
      if (hitDetect(mouseX, mouseY, 0, 0, posX, posY, sizeXY, sizeXY)) {
        if (!mousePressed) {
          repeater=false;
          hovered=true;
          clicked=false;
        } else if (mousePressed&&!repeater) {
          repeater=true;
          hovered=true;
          clicked=true;
          toggleSwitch = !toggleSwitch;
          oscSendData2 = 1;
          oscSend2();
        }
      } else {
        hovered=false;
        clicked=false;
      }
    }

    if (buttonType == "port3") {
      if (hitDetect(mouseX, mouseY, 0, 0, posX, posY, sizeXY, sizeXY)) {
        if (!mousePressed) {
          repeater=false;
          hovered=true;
          clicked=false;
        } else if (mousePressed&&!repeater) {
          repeater=true;
          hovered=true;
          clicked=true;
          toggleSwitch = !toggleSwitch;
          oscSendData2 = 1;
          oscSend3();
        }
      } else {
        hovered=false;
        clicked=false;
      }
    }

    if (buttonType == "port4") {
      if (hitDetect(mouseX, mouseY, 0, 0, posX, posY, sizeXY, sizeXY)) {
        if (!mousePressed) {
          repeater=false;
          hovered=true;
          clicked=false;
        } else if (mousePressed&&!repeater) {
          repeater=true;
          hovered=true;
          clicked=true;
          toggleSwitch = !toggleSwitch;
          oscSendData4 = 1;
          oscSend4();
        }
      } else {
        hovered=false;
        clicked=false;
      }
    }
  }




  void drawButton() {


    ellipseMode(CENTER);
    rectMode(CENTER);
    noStroke();
    if (hovered && !clicked) {
      nowColor = hoverColor;
    } else if (hovered && clicked) {
      nowColor = clickColor;
    } else if (!hovered && !clicked) {
      nowColor = offColor;
    } 



    fill(nowColor);
    if (buttonType == "port1") {

      ellipse(posX, posY, sizeXY+intensity1, sizeXY+intensity1);
    } else if (buttonType == "port2") {
      ellipse(posX, posY, sizeXY+intensity2, sizeXY+intensity2);
    } else if (buttonType == "port3") {
      ellipse(posX, posY, sizeXY+intensity3, sizeXY+intensity3);
    } else if (buttonType == "port4") {
      ellipse(posX, posY, sizeXY+intensity4, sizeXY+intensity4);
    }

//button size change with the music, uses port names again to identify and categorize the buttons

    textSize(30);
    fill(255);
    textAlign(CENTER, CENTER);
    text(label, posX, posY);

    if (freqSelect1) {
      text("Toggled!", 200, height/2-150);
    }
    if (freqSelect2) {
      text("Toggled!", 450, height/2-150);
    }
    if (freqSelect3) {
      text("Toggled!", 700, height/2-150);
    }
    if (freqSelect4) {
      text("Toggled!", 950, height/2-150);
    }
  }
//to let users know they've toggled a button for frequency application

  boolean hitDetect(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {
    w1 /= 2;
    h1 /= 2;
    w2 /= 2;
    h2 /= 2; 
    if (x1 + w1 >= x2 - w2 && x1 - w1 <= x2 + w2 && y1 + h1 >= y2 - h2 && y1 - h1 <= y2 + h2) {
      return true;
    } else {
      return false;
    }
  }
}
