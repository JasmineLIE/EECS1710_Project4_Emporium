void keyPressed() {
  if (key == '1') {
    oscSendData1 = 1;
    oscSend1();
  }
  if (key == '2') {
    oscSendData2 = 1;
    oscSend2();
  }
  if (key == '3') {
    oscSendData3 = 1;
    oscSend3();
  }
  if (key == '4') {
    oscSendData4 = 1;
    oscSend4();
  }

  if (key == 'x') {
     doorOpen.play();
    if (waterUnlocked) {
      waterUnlocked = false;
    } else waterUnlocked = true;
   
  }




    
  
}

void mouseDragged() {
  // add point based on width/height
  if (xpos > 0) {
    oscSendData5 = mouseLoc; 
    oscSend5();
  }


  if (strokes.size() > 0) {
    Stroke stroke = strokes.get(strokes.size()-1);
    stroke.points.add(new PVector(mouseX, mouseY));
    stroke.timestamp = millis();
  }

  marktime = millis();
}

void mousePressed() {
  Stroke stroke = new Stroke();
  strokes.add(stroke);
}
