PImage bg, border, water, door, eyeOpen, eyeClosed;
boolean waterUnlocked = false;
float xpos = 0;
PGraphics pg;

class Layout {

  void loadImages() {
    bg = loadImage("bg.png"); 
    border = loadImage("border.png");
    water = loadImage("water.png");
    door = loadImage("door.png");
    eyeOpen = loadImage("eyeOpened.png");
    eyeClosed = loadImage("eyeClosed.png");

    pg = createGraphics(water.width, water.height, P2D);
  }

  void doorAnimation() {
    if (waterUnlocked && xpos < 600) {
      xpos = xpos + 15;
    } else if (!waterUnlocked && xpos != 0) {
      xpos = xpos - 15;
    }
  }

  void draw() {
    if (waterUnlocked) {  
      mouseLoc = mouseY / 200;
    } else {
      mouseLoc = 1;
      oscSendData5 = mouseLoc; 
      oscSend5();
    }



    pg.beginDraw();
    pg.image(water, 0, 0, pg.width, pg.height);


    pg.endDraw();
    if (xpos > 0) {
      image(pg, 0, 0);
      for (int i=strokes.size()-1; i >= 0; i--) {
        Stroke stroke = strokes.get(i);
        stroke.run();
        if (!stroke.alive) strokes.remove(i);
      }



      shader.set("time", float(millis())/2000.0);
      shader.set("tex0", get());
      filter(shader);
    }
    image(door, xpos, 0);       
    doorAnimation();


    image(bg, 0, 0);

    image(border, 0, 0);

    if (waterUnlocked) {
      image(eyeOpen, 0, 0);
    } else {
      image(eyeClosed, 0, 0);
    }
  }
}
