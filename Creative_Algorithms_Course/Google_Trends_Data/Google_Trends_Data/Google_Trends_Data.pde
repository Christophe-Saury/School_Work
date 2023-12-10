import processing.net.*;
import processing.data.*;

String apiKey = "dcc9d52747a526a86f0b218ee1b82bcce455da568f0d80218af50db6bcb494e6"; // Replace with your SerpApi API key
String searchQuery = "happy,good,bad,sad,lost";
String apiUrl = "https://serpapi.com/search.json?engine=google_trends&q=" + searchQuery + "&api_key=" + apiKey;

String[] response;
float happyAverageValue; // Average value for "happy"
float goodAverageValue;  // Average value for "good"
float badAverageValue;   // Average value for "bad"
float sadAverageValue;   // Average value for "sad"
float lostAverageValue;  // Average value for "lost"

float x, y;
float shape_width, shape_height;
String[] shape = {"line", "star", "ellipse", "triangle", "rectangle"};
int shapeType = 0;

void setup() {
  size(1500, 1200);
  background(0);
  frameRate(10);

  // Make an HTTP request to the SerpApi endpoint
  response = loadStrings(apiUrl);

  if (response != null) {
    String jsonText = join(response, "\n");
    JSONObject data = parseJSONObject(jsonText);

    if (data != null) {
      JSONObject interestOverTime = data.getJSONObject("interest_over_time");

      if (interestOverTime != null) {
        JSONArray averages = interestOverTime.getJSONArray("averages");

        // Loop through the "averages" array to find the values for emotions
        for (int i = 0; i < averages.size(); i++) {
          JSONObject averageData = averages.getJSONObject(i);
          String query = averageData.getString("query");
          float value = averageData.getFloat("value");

          // Store the average values for each emotion
          if (query.equals("happy")) {
            happyAverageValue = value;
          } else if (query.equals("good")) {
            goodAverageValue = value;
          } else if (query.equals("bad")) {
            badAverageValue = value;
          } else if (query.equals("sad")) {
            sadAverageValue = value;
          } else if (query.equals("lost")) {
            lostAverageValue = value;
          }

          println("Query: " + query);
          println("Value: " + value);
        }
      }
    }
  }
}

void draw() {
  fill(255);

  color happyColor = color(#52BDEA);
  color goodColor = color(#AAF797);
  color badColor = color(#BE030A);
  color sadColor = color(#980177);
  color lostColor = color(#F6B646);

  for (int i = 0; i < 10; i++) {
    switch (shape[shapeType]) {
      case "ellipse":
        drawellipse(happyAverageValue, happyColor);
        drawellipse(goodAverageValue, goodColor);
        drawellipse(badAverageValue, badColor);
        drawellipse(sadAverageValue, sadColor);
        drawellipse(lostAverageValue, lostColor);
        break;

      case "triangle":
        drawtriangle(happyAverageValue, happyColor);
        drawtriangle(goodAverageValue, goodColor);
        drawtriangle(badAverageValue, badColor);
        drawtriangle(sadAverageValue, sadColor);
        drawtriangle(lostAverageValue, lostColor);
        break;

      case "rectangle":
        drawrectangle(happyAverageValue, happyColor);
        drawrectangle(goodAverageValue, goodColor);
        drawrectangle(badAverageValue, badColor);
        drawrectangle(sadAverageValue, sadColor);
        drawrectangle(lostAverageValue, lostColor);
        break;

      case "line":
        drawline(happyAverageValue, happyColor);
        drawline(goodAverageValue, goodColor);
        drawline(badAverageValue, badColor);
        drawline(sadAverageValue, sadColor);
        drawline(lostAverageValue, lostColor);
        break;

      case "star":
        drawStars(happyAverageValue, happyColor);
        drawStars(goodAverageValue, goodColor);
        drawStars(badAverageValue, badColor);
        drawStars(sadAverageValue, sadColor);
        drawStars(lostAverageValue, lostColor);
        break;
    }
  }
}

void drawStars(float average_value, color starColor) {
  for (int i = 0; i < 50; i++) {
    float starX = random(width);
    float starY = random(height);
    fill(starColor);
    noStroke();
    ellipse(starX, starY, 3, 3);
  }
}

void drawellipse(float average_value, color ellipseColor) {
  x = random(1500);
  y = random(1200);
  shape_width = random(average_value * 0.3);
  shape_height = random(average_value * 0.3);

  fill(ellipseColor);
  noStroke();
  ellipse(x, y, shape_width, shape_height);
}

void drawtriangle(float average_value, color triangleColor) {
  float x1 = random(1500);
  float y1 = random(1200);
  float x2 = random(x1 - average_value * 0.3, x1 + average_value * 0.3);
  float y2 = random(y1 - average_value * 0.3, y1 + average_value * 0.3);
  float x3 = random(x2 - average_value * 0.3, x2 + average_value * 0.3);
  float y3 = random(y2 - average_value * 0.3, y2 + average_value * 0.3);

  fill(triangleColor);
  noStroke();
  triangle(x1, y1, x2, y2, x3, y3);
}

void drawline(float average_value, color lineColor) {
  float x1 = random(1500);
  float y1 = random(1200);
  float x2 = random(x1 - average_value * 0.3, x1 + average_value * 0.3);
  float y2 = random(y1 - average_value * 0.3, y1 + average_value * 0.3);

  stroke(lineColor);
  line(x1, y1, x2, y2);
}

void drawrectangle(float average_value, color rectangleColor) {
  float x = random(1500);
  float y = random(1200);
  shape_width = random(average_value * 0.2);
  shape_height = random(average_value * 0.2);

  fill(rectangleColor);
  noStroke();
  rect(x, y, shape_width, shape_height);
}

void mousePressed() {
  if (mouseX >= 400 && mouseX <= 1000) {
    shapeType = (shapeType + 1) % 5;
  }
  background(0);
}
