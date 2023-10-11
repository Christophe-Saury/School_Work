// Christophe SAURY Creative Algorithm Homework 1

import javax.swing.JOptionPane; // Import the JOptionPane class

float angleOffset = 10; // Initialize angleOffset with 10 degrees in radians

void setup() {
  size(1920, 1080);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  
  float wave = sin(radians(frameCount));
  float w = wave * map(mouseX, 0, height, 2500, 0);
  
  for (int i = 0; i < 500; i++) {
    rotate(angleOffset); 
    stroke(0, 0, 150);
    line(850, i - w/2, -850, i++);
    stroke(255, 255, 0);
    line(-850, -i + w, 550, i++);
    stroke(100);
    line(-850, i - w, 850, i++);
    stroke(255, 0, 0);
    line(850, i + w/2, -850, i++);
    stroke(155, 155, 50);
    line(850, i + w/2, -850, i++);
  }
}

void mousePressed() {
  angleOffset = radians(random(360)); // Generate a new random angle in degrees upon mouse click and convert to radians
  
  // Display the angle in a popup dialog
  String message = "Current Angle: " + degrees(angleOffset) + " degrees";
  JOptionPane.showMessageDialog(null, message, "Angle Information", JOptionPane.INFORMATION_MESSAGE);
}
