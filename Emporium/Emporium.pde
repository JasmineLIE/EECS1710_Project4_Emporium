import processing.sound.*;
SoundFile eyeClick, doorOpen;
Layout layout;

int circleTest = 5;
float maxDist;

void setup() {
  size(1600, 800, P2D);
  oscSetup();
  maxDist = dist(0, 0, width, height);
  //set up lochalhost for udpsend from MAX
  instru1 = new OscP5(this, 6000); 
  instru2 = new OscP5(this, 6001);
  instru3 = new OscP5(this, 6002);
  instru4 = new OscP5(this, 6003);

  instru1.plug(this, "setAmp1", "/amp");
  instru2.plug(this, "setAmp2", "/amp"); 
  instru3.plug(this, "setAmp3", "/amp");
  instru4.plug(this, "setAmp4", "/amp");
  //each one has an individual destination

  //load sfx
  eyeClick = new SoundFile(this, "ButtonPress.mp3");
  doorOpen = new SoundFile(this, "stoneMove.mp3");
  //load sfx

  layout = new Layout();
  layout.loadImages();


  strokes = new ArrayList<Stroke>();

  shader = loadShader("example.glsl");
  shader.set("resolution", float(width), float(height));
  shader.set("rate", 0.1);
}




void draw() {
  background(157);




  layout.draw();
    ellipse(300, height/2, intensity1, intensity1);
  ellipse(600, height/2, intensity2, intensity2);
  ellipse(900, height/2, intensity3, intensity3);
  ellipse(1200, height/2, intensity4, intensity4);
}
