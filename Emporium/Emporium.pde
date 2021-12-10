import processing.sound.*;
SoundFile toggleClick, doorOpen;
Layout layout;

//setting up buttons
int numButts = 5;
Buttons[] buttons = new Buttons[numButts];
//setting up buttons


int numBubbles = 5;
BubblesSystem[] bs = new BubblesSystem[numBubbles];
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
  toggleClick = new SoundFile(this, "ButtonPress.mp3");
  doorOpen = new SoundFile(this, "stoneMove.mp3");
  //load sfx

  layout = new Layout();
  layout.loadImages();


  strokes = new ArrayList<Stroke>();

  shader = loadShader("example.glsl");
  shader.set("resolution", float(width), float(height));
  shader.set("rate", 0.1);
  for (int i = 0; i < bs.length; i++) {

    bs[1] = new BubblesSystem(new PVector(200, height/2 ));
    bs[2] = new BubblesSystem(new PVector(450, height/2));
    bs[3] = new BubblesSystem(new PVector(700, height/2));
    bs[4] = new BubblesSystem(new PVector(950, height/2));
  }
  for (int i = 0; i < buttons.length; i++) {
    buttons[1] = new Buttons(200, height/2, 100, color(60, 18, 32), "1", "port1");
    buttons[2] = new Buttons(450, height/2, 100, color(88, 45, 45), "2", "port2");
    buttons[3] = new Buttons(700, height/2, 100, color(29, 48, 62), "3", "port3");
    buttons[4] = new Buttons(950, height/2, 100, color(22, 111, 84), "4", "port4");
  }
}




void draw() {
  background(157);




  layout.draw();
  //ellipse(300, height/2, intensity1, intensity1);
  //ellipse(600, height/2, intensity2, intensity2);
  //ellipse(900, height/2, intensity3, intensity3);
  //ellipse(1200, height/2, intensity4, intensity4);

  bs[1].run();
  bs[2].run();
  bs[3].run();
  bs[4].run();

  buttons[1].update();
  buttons[2].update();
  buttons[3].update();
  buttons[4].update();
}
