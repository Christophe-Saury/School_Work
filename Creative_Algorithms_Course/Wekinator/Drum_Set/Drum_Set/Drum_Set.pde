import oscP5.*;
import netP5.*;
import processing.sound.*;

OscP5 oscP5;
NetAddress dest;

int message = 0;
int previousMessage = 0;

// Sound file variables
SoundFile sound1, sound2, sound3;

void setup() {
  size(963, 1080, P2D);
  oscP5 = new OscP5(this, 12000);
  dest = new NetAddress("127.0.0.1", 6448);

  // Load sound files
  sound1 = new SoundFile(this, "Snare.mp3");
  sound2 = new SoundFile(this, "Bass.mp3");
  sound3 = new SoundFile(this, "HiHat.mp3");
}

void draw() {
  // background(190);
  print(message);

  // Check if the state has changed
  if (message != previousMessage) {
    // Play sounds immediately upon state change
    switch (message) {
      case 1:
        sound3.play(); // hi-hat
        break;
      case 2:
        sound2.play(); // Bass
//                sound3.play();
        break;
      case 3:
        //sound3.play();
        sound1.play(); // snare
        break;
      case 4:
        // sound4.play();
        break;
    }

    // Update the previous state
    previousMessage = message;
  }
}

// automatically called whenever osc message is received
void oscEvent(OscMessage m) {
  m.print();

  // message from wekinator to processing
  if (m.checkAddrPattern("/output_1") == true) { // hit knife top plastic
    message = 1;
  } 
  if (m.checkAddrPattern("/output_2") == true) { // slide bottle along the table
    message = 2;
  } 
  if (m.checkAddrPattern("/output_3") == true) { // hit side of the bottle
    message = 3;
  } 
  if (m.checkAddrPattern("/output_4") == true) { // default: no sound
    message = 4;
  } 
}
