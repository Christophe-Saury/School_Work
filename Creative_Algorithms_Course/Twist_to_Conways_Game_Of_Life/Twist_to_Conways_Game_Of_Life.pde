int cols, rows;
int resolution = 10; // Size of each cell
int[][] grid;
int[][] next;
boolean manualAdvance = false; // Flag to control manual advancement

void setup() {
  size(900, 900);
  cols = width / resolution;
  rows = height / resolution;

  // Initialize grid and next as 2D arrays of the same size
  grid = new int[cols][rows];
  next = new int[cols][rows];

  // Initialize the grid with L-system-generated patterns
  //initializeGridWithLSystemPattern("block", cols / 4, rows / 4, blockRules);
  initializeGridWithLSystemPattern("pulsar", cols / 4, rows / 4, pulsarRules);
  //initializeGridWithLSystemPattern("lwss", cols / 4, rows / 4, lwssRules);
}

void draw() {
  background(255);

  // Check if manual advancement is enabled and the mouse is pressed
  if (manualAdvance && mousePressed) {
    // Update the grid based on Game of Life rules
    updateGrid();
  }

  // Visualize the grid
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = i * resolution;
      float y = j * resolution;
      if (grid[i][j] == 1) {
        fill(0);
        stroke(255);
        rect(x, y, resolution, resolution);
      }
    }
  }
}

void mousePressed() {
  // Toggle manual advancement when the mouse is clicked
  manualAdvance = !manualAdvance;
}

// Define L-system rules for the new patterns
String blockRules[] = {"A=AA", "B=AA"};
String pulsarRules[] = {
  "A=BCDCDCDDDEEEDDDCDCDCB",
  "B=C",
  "C=B",
  "D=EE",
  "E=D",
};
String lwssRules[] = {
  "A=BCCCCCB",
  "B=DD",
  "C=D",
  "D=E",
  "E=E",
};

void initializeGridWithLSystemPattern(String patternType, int xOffset, int yOffset, String[] rules) {
  String axiom = "";

  // Determine the L-system axiom based on the patternType
  if (patternType.equals("block")) {
    axiom = "A";
  } else if (patternType.equals("pulsar")) {
    axiom = "A";
  } else if (patternType.equals("lwss")) {
    axiom = "A";
  } else {
    // Default to an empty pattern if the patternType is not recognized
    axiom = "";
  }

  // Generate the L-system pattern
  String pattern = axiom;
  for (int i = 0; i < 5; i++) { // You can adjust the number of iterations
    StringBuilder nextPattern = new StringBuilder();
    for (char ch : pattern.toCharArray()) {
      boolean ruleApplied = false;
      for (String rule : rules) {
        String[] parts = rule.split("=");
        if (parts.length == 2 && ch == parts[0].charAt(0)) {
          nextPattern.append(parts[1]);
          ruleApplied = true;
          break;
        }
      }
      if (!ruleApplied) {
        nextPattern.append(ch);
      }
    }
    pattern = nextPattern.toString();
  }

  // Use the L-system pattern to initialize the grid
  int x = xOffset;
  int y = yOffset;
  for (char ch : pattern.toCharArray()) {
    if (ch == 'A' || ch == 'B' || ch == 'C' || ch == 'D' || ch == 'E') {
      grid[x][y] = 1; // Set the cell to be alive
    }
    // Adjust the coordinates based on your L-system rules to create the pattern
    // You may need to modify this part to match your specific L-system pattern
    if (ch == 'D') {
      x++;
    }
    if (ch == 'E') {
      x--;
    }
     if (ch == 'A') {
      y++;
    }
     if (ch == 'B') {
      y--;
    }
     if (ch == 'C') {
      y=y+2;
    }
  }
}

int countLiveNeighbors(int x, int y) {
  int count = 0;

  int[][] neighbors = {
    {-1, -1}, {0, -1}, {1, -1},
    {-1, 0},           {1, 0},
    {-1, 1}, {0, 1}, {1, 1}
  };

  for (int[] neighborOffset : neighbors) {
    int nx = x + neighborOffset[0];
    int ny = y + neighborOffset[1];

    if (nx >= 0 && nx < cols && ny >= 0 && ny < rows) {
      if (grid[nx][ny] == 1) {
        count++;
      }
    }
  }

  return count;
}

void updateGrid() {
  // Create a new grid to store the next state
  int[][] newGrid = new int[cols][rows];

  // Loop through each cell in the current grid
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Count the number of live neighbors
      int neighbors = countLiveNeighbors(i, j);

      // Apply the Game of Life rules
      if (grid[i][j] == 1) { // If the cell is currently alive
        if (neighbors < 2 || neighbors > 3) {
          // Any live cell with fewer than two live neighbors or more than three dies
          newGrid[i][j] = 0;
        } else {
          // Any live cell with two or three live neighbors lives on
          newGrid[i][j] = 1;
        }
      } else { // If the cell is currently dead
        if (neighbors == 3) {
          // Any dead cell with exactly three live neighbors becomes alive
          newGrid[i][j] = 1;
        }
      }
    }
  }

  // Update the current grid with the new state
  grid = newGrid;
}
