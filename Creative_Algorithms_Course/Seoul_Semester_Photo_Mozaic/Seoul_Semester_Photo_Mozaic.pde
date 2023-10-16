PImage seoulImage;
PImage[] photos; // Array to store your replacement photos
int tileSize = 40; // Size of each tile in pixels
float zoomLevel = 0.2; // Initial zoom level
int borderSize = 2; // Size of the black border

void setup() {
  size(1600, 1200);
  seoulImage = loadImage("National-Animal-Of-South-Korea.jpg");
  seoulImage.resize(width, height); // Resize the image to fit the canvas
  loadPhotos(); // Load your replacement photos
  noLoop(); // Disable continuous drawing
}

void draw() {
  background(200); // Set the background color to grey (change the value to your preferred shade)
  scale(zoomLevel); // Apply the current zoom level
  
  // Calculate the number of tiles based on the current tileSize and zoom level
  int numTilesX = int(width / (tileSize * zoomLevel));
  int numTilesY = int(height / (tileSize * zoomLevel));
  
  for (int y = 0; y < numTilesY; y++) {
    for (int x = 0; x < numTilesX; x++) {
      // Calculate the average color of the tile
      color avgColor = getAverageColor(x * tileSize, y * tileSize, tileSize, tileSize);
      
      // Draw a black border around each tile
      fill(0);
      noStroke(); // No outline for the border
      rect(x * tileSize - borderSize, y * tileSize - borderSize, tileSize + borderSize * 2, tileSize + borderSize * 2);
      
      // Randomly select a photo from the array
      PImage randomPhoto = photos[int(random(photos.length))];
      
      // Apply average color as a tint with some transparency to the border pixels
      tint(avgColor, 200); // Higher transparency for the border pixels
      image(randomPhoto, x * tileSize, y * tileSize, tileSize, tileSize);
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

void loadPhotos() {
  int numPhotos = 45; // Adjust to the number of photos you have
  photos = new PImage[numPhotos];
  for (int i = 0; i < numPhotos; i++) {
    photos[i] = loadImage("Seoul/photo- (" + (i + 1) + ").jpg");
  }
}

void mouseWheel(MouseEvent event) {
  float zoomChange = event.getCount() > 0 ? 0.1 : -0.1; // Positive count is zoom in, negative count is zoom out
  zoomLevel = constrain(zoomLevel + zoomChange, 0.1, 5.0); // Limit zoom range
  redraw(); // Redraw the canvas to apply the new zoom level
}
