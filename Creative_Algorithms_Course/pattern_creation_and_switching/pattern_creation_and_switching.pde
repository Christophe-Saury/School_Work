int currentDesign = 0; // 0 for the first design, 1 for the second design, 2 for the third design
color[] palette = new color[5];

void setup() {
  size(500, 500);
  palette[0] = color(255, 0, 0); // Red
  palette[1] = color(0, 255, 0); // Green
  palette[2] = color(0, 0, 255); // Blue
  palette[3] = color(255, 255, 0); // Yellow
  palette[4] = color(255); // White background
  background(palette[4]);
}

void draw() {
  if (currentDesign == 0) {
    drawDesign1();
  } else if (currentDesign == 1) {
    drawDesign2();
  } else if (currentDesign == 2) {
    drawDesign3();
  } else if (currentDesign == 3) {
    draw_design4();
  }
}

void draw_design4() {
  background(0);
  int size_grid = 450;
  // Your code to draw lines and crosses
  stroke(palette[0]); // Set the color for the main lines
  strokeWeight(2); // Set thicker stroke for main lines
  // Draw main lines here

  // Apply shading or gradient to crosses
  for (int i = 50; i <= size_grid; i += 50) {
    for (int j = 50; j <= size_grid; j += 25) {
      stroke(lerpColor(palette[1], palette[2], map(i, 0, size_grid, 0, 1))); // Apply gradient
      strokeWeight(1); // Set thinner stroke for crosses
      line(i - 10, j - 10, i + 10, j + 10);
      line(i - 10, j + 10, i + 10, j - 10);
      // Draw crosses here
    }
  }
}


void drawDesign1() {
  background(0);
  int size_grid = 450;
  for (int i = 50; i <= size_grid; i = i + 50) {
    for (int j = 25; j <= size_grid; j = j + 25) {
      stroke(255);
      line(i - 10, j - 10, i + 10, j + 10);
      line(i - 10, j + 10, i + 10, j - 10);
    }
  }
}

void drawDesign2() {
  background(0);
  int size_grid = 450;
  for (int i = 50; i <= size_grid; i = i + 50) {
    for (int j = 25; j <= size_grid; j = j + 25) {
      stroke(0);
      ellipse(i, j, 40, 40);
    }
  }
}

void drawDesign3() {
  background(0);
  int size_grid = 450;
  for (int i = 50; i <= size_grid; i = i + 50) {
    for (int j = 25; j <= size_grid; j = j + 25) {
      stroke(255);
      line(i, j, 250, 250);
    }
  }
}

void mousePressed() {
  currentDesign = (currentDesign + 1) %4; // Cycle through the designs when the mouse is clicked
}
