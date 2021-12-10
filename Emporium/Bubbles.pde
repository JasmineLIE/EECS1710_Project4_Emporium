//reference: https://processing.org/examples/simpleparticlesystem.html



int ballWidth;
class Bubbles {
  color col1, col2, col3, col4;
  PVector position;
  PVector acceleration;
  float lifespan;
  PVector velocity;
  float accel1 = 0;
  float accel2 = 0.010;
  float y;




  Bubbles (PVector l) {
    acceleration = new PVector(accel1, accel2);
    velocity = new PVector(random(-intensity1 / 10, intensity1 / 10), random(-intensity1 / 10, intensity1 / 10));
    position = l.copy();
  }

  void update() {
    col1 = color(60 + random(-50, 100), 18+ random(-10, 10), 32+ random(-10, 10));
    col2 = color(88 + random(-50, 100), 45+ random(-10, 10), 45+ random(-10, 10));
    col3 = color(29 + random(-50, 100), 48+ random(-10, 10), 62+ random(-10, 10));
    col4 = color(22+ random(-50, 100), 111+ random(-10, 10), 84+ random(-10, 10));
 velocity.add(acceleration);
    position.add(velocity);
   
    lifespan -= 0.2;
  }
  void display() {


 
   if (position.x >=0 && position.x <= 300) {
        lifespan = intensity1 * 2; 
     fill(col1, lifespan);

      noStroke();
   ellipse(position.x, position.y, random(5, 20), random(5, 20));

  
   } else if (position.x >= 300 && position.x <= 600){
           lifespan = intensity2 * 2; 
     fill(col2, lifespan);

      noStroke();
   ellipse(position.x, position.y, random(5, 20), random(5, 20));
   } else if ( position.x >=500 && position.x <= 800) {
          lifespan = intensity3 * 2; 
     fill(col3, lifespan);

      noStroke();
   ellipse(position.x, position.y, random(5, 20), random(5, 20));
   }else if ( position.x >=800 && position.x <= 1100) {
          lifespan = intensity4 * 2; 
     fill(col4, lifespan);

      noStroke();
   ellipse(position.x, position.y,random(5, 20), random(5, 20));
   }
  }

  boolean isDead() {
    if (lifespan < 5) {
      return true;
    } else {
      return false;
    }
  }

  void run() {
    update();
    display();
  }
}
