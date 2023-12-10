PImage seoulImage;
int tileSize = 10; // Size of each tile in pixels
float zoomLevel = 1.0; // Initial zoom level

void setup() {
  size(1300, 1000);
  seoulImage = loadImage("National-Animal-Of-South-Korea.jpg");
  seoulImage.resize(width, height); // Resize the image to fit the canvas
  noLoop(); // Disable continuous drawing
}

void draw() {
  background(255); // Clear the main canvas

  // Draw the image on the main canvas
  pushMatrix();
  scale(zoomLevel); // Apply the current zoom level
  image(seoulImage, 0, 0); // Draw the image at the top-left corner
  popMatrix();

  // Draw the gray canvas on top
  drawGrayCanvas();
}

void mouseWheel(MouseEvent event) {
  float zoomChange = event.getCount() > 0 ? 0.1 : -0.1; // Positive count is zoom in, negative count is zoom out
  zoomLevel = constrain(zoomLevel + zoomChange, 0.1, 5.0); // Limit zoom range
  redraw(); // Redraw the canvas to apply the new zoom level
}

void drawGrayCanvas() {
  // Draw on the gray canvas
  push();
  noFill();
  stroke(128); // Set the stroke color to gray
  rect(0, 0, 500, 500); // Draw a gray rectangle covering the entire canvas
  pop();
  // You can draw additional elements on the gray canvas if needed.
}
