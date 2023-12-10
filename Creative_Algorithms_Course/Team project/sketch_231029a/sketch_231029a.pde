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
  background(255);
  scale(zoomLevel); // Apply the current zoom level
  
  // Calculate the number of tiles based on the current tileSize and zoom level
  int numTilesX = int(width / (tileSize * zoomLevel));
  int numTilesY = int(height / (tileSize * zoomLevel));
  
  for (int y = 0; y < numTilesY; y++) {
    for (int x = 0; x < numTilesX; x++) {
      // Calculate the average color of the tile
      color avgColor = getAverageColor(x * tileSize, y * tileSize, tileSize, tileSize);
  
      // Fill a square with the average color
      fill(avgColor);
      rect(x * tileSize, y * tileSize, tileSize, tileSize);
    }
  }
}

color getAverageColor(int x, int y, int w, int h) {
  float r = 0;
  float g = 0;
  float b = 0;
  
  for (int i = x; i < x + w; i++) {
    for (int j = y; j < y + h; j++) {
      color c = seoulImage.get(i, j);
      r += red(c);
      g += green(c);
      b += blue(c);
    }
  }
  
  int numPixels = w * h;
  r /= numPixels;
  g /= numPixels;
  b /= numPixels;
  
  return color(r, g, b);
}

void mouseWheel(MouseEvent event) {
  float zoomChange = event.getCount() > 0 ? 0.1 : -0.1; // Positive count is zoom in, negative count is zoom out
  zoomLevel = constrain(zoomLevel + zoomChange, 0.1, 5.0); // Limit zoom range
  redraw(); // Redraw the canvas to apply the new zoom level
}
