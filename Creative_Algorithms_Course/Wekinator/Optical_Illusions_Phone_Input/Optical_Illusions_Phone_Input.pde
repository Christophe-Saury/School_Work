import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress dest;

PVector accel;
 float angle;
 color Mycolor = 0;
 float variable_scale= 1;

void setup() {
  size(963, 1080, P2D);
  oscP5 = new OscP5(this, 12000);
  dest = new NetAddress("127.0.0.1", 6448);

  surface.setLocation(957, 0);
  noStroke();
  fill(0, 15, 30);
}

void draw(){
  background(190);
  float x = width;
  float dia = 150;
  int num = 100;
        scale(variable_scale);
  translate(width/2, height/2);
  
  for(float a=0; a<360; a+=22.5){
    rotate(radians(a));
    pushMatrix();
    for(int i=0; i<num; i++){
      scale(0.95);
     // scale(variable_scale);
      rotate(radians(angle));
      stroke(Mycolor);
      fill(Mycolor);
      ellipse(x, 0, dia, dia);
    }
    popMatrix();
    pushMatrix();
    for(int i=0; i<num; i++){
      scale(0.95);

      rotate(-radians(angle));
      ellipse(x, 0, dia, dia);
    }
    popMatrix();
  }
  angle+=0.01;
}



// automatically called whenever osc message is received
void oscEvent(OscMessage m) {
  //m.print();

  // message from wekinator to processing
  if (m.checkAddrPattern("/output_1")==true) { // move phone towards top
     Mycolor = color(random(255),random(255),random(255));
  } 
  if (m.checkAddrPattern("/output_2")==true) { // roll phone towards the right
     variable_scale = variable_scale * 0.95;
  } 
    if (m.checkAddrPattern("/output_3")==true) { // default + move phone towards bottom
     angle+=1;
  } 
  if (m.checkAddrPattern("/output_4")==true) {  // Doesn't work as much
    // variable_scale = variable_scale * 1.1;
  } 
}
  
  
