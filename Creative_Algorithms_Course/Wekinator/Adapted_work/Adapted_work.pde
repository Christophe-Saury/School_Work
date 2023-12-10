
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress dest;

PVector accel;

void setup() {
  size(700, 410, P2D);

  oscP5 = new OscP5(this, 12000);
  dest = new NetAddress("127.0.0.1", 6448);

}

void draw() {
  background(255);

 


}

// automatically called whenever osc message is received
void oscEvent(OscMessage m) {
  //m.print();

  // message from wekinator to processing
  if (m.checkAddrPattern("/output_1")==true) { // move phone towards top
     print(1);
  } 
  if (m.checkAddrPattern("/output_2")==true) { // roll phone towards the right
     print(2);
  } 
    if (m.checkAddrPattern("/output_3")==true) { // default + move phone towards bottom
     print(3);
  } 
  if (m.checkAddrPattern("/output_4")==true) {  // roll phone towards left
     print(4);
  } 
  
  // message from phone to processing
  //if (m.checkAddrPattern("/oschook")==true) {
  //  /* check if the typetag is the right one. */
  //  if (m.checkTypetag("ifffffffff")) {
  //    /* extract the acceleration values from the osc message */
  //    accel.x = m.get(4).floatValue();  
  //    accel.y = m.get(5).floatValue();  
  //    accel.z = m.get(6).floatValue();  
  //    sendOsc();
  //  }
  //}
}

//void sendOsc() {
//  OscMessage msg = new OscMessage("/wek/inputs");
//  msg.add(accel.x); 
//  msg.add(accel.y);
//  msg.add(accel.z);
//  oscP5.send(msg, dest);
//}
