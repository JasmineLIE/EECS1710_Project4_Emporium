void keyPressed() {
  //number keys from 1-4 activate and deactivate toggle for each assigned button.  They also send a bang to MAX which than routes the freq change to the corresponding audio
  if (key == '1') {
    println(freqSelect1);
    oscSendData6 = 1;
    oscSend6();
    if (freqSelect1) {
      freqSelect1 = false;
    } else {
      freqSelect1 = true;
    }
  }
  
  if (key == '2') {

    oscSendData7 = 1;
    oscSend7();

    if (freqSelect2) {
      freqSelect2 = false;
    } else {
      freqSelect2 = true;
    }
  }
  
  if (key == '3') {

    oscSendData8 = 1;
    oscSend8();
    if (freqSelect3) {
      freqSelect3 = false;
    } else {
      freqSelect3 = true;
    }
  }
  
  if (key == '4') {

    oscSendData9 = 1;
    oscSend9();
    if (freqSelect4) {
      freqSelect4 = false;
    } else {
      freqSelect4 = true;
    }
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
    
    //if the xpos, which is the door position that covers the water, is greater than 0, meaning it's off screen, than send the data from mouseLoc which is MouseY to MAX
    //This ensures that you can only draw and change freq in the pool when the door is unlocked and absent from frame
    oscSendData5 = mouseLoc; 
    oscSend5();
  }


  if (strokes.size() > 0) { //if a stroke has been added, add the coordinates of the mouse  to the stroke
    Stroke stroke = strokes.get(strokes.size()-1);
    stroke.points.add(new PVector(mouseX, mouseY));
    stroke.timestamp = millis();
  }

  marktime = millis();
}

void mousePressed() { //create a new Stroke when the mouse is pressed, then add that stroke to strokes to draw
  Stroke stroke = new Stroke();
  strokes.add(stroke);
}
