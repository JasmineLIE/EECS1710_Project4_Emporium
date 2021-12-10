PShader shader;

ArrayList<Stroke> strokes;
int marktime = 0;


class Stroke {

  ArrayList<PVector> points;
  int lifetime = 1000;
  int timestamp = 0;
  boolean alive = true;

  Stroke() {
    points = new ArrayList<PVector>();
    timestamp = millis();
  }

  void update() {
    if (millis() > timestamp + lifetime) { //if the stroke has existed for longer than 1000, which is calculated by millis the moment the mouse is released, then reset
      alive = false;

      if (!alive) {
        mouseLoc = 1;
        oscSendData5 = mouseLoc; 
        oscSend5(); //reset the freq to 1
      }
    }
  }

  void draw() {
    for (int i=0; i<points.size(); i++) {
      PVector p = points.get(i);
      p.x += mouseX - mouseX;
      strokeWeight(2);
      point(p.x, p.y);
      if (i > 0) {
        PVector p2 = points.get(i-1);
        strokeWeight(2);
        line(p.x, p.y, p2.x, p2.y);
        stroke(#52FFDB);
      }
    }
  }

  void run() {
    update();
    draw();
  }
}
