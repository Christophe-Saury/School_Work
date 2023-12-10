import processing.net.*;
import processing.data.*;

String apiKey = "dcc9d52747a526a86f0b218ee1b82bcce455da568f0d80218af50db6bcb494e6";
String searchQuery = "happy,good,bad,sad,lost";
String apiUrl = "https://serpapi.com/search.json?engine=google_trends&q=" + searchQuery + "&api_key=" + apiKey;

String[] response;

void setup() {
  size(400, 400);
  background(255);
  
  // Make an HTTP request to the SerpApi endpoint
  response = loadStrings(apiUrl);
  
    // Check if the response has been loaded
  if (response != null) {
    String jsonText = join(response, "\n"); // Combine the response lines into a single string
    JSONObject data = parseJSONObject(jsonText);
    
    if (data != null) {
      // Access the "interest_over_time" JSON object
      JSONObject interestOverTime = data.getJSONObject("interest_over_time");
      
      if (interestOverTime != null) {
        // Access the "averages" JSON array within "interest_over_time"
        JSONArray averages = interestOverTime.getJSONArray("averages");
        
        // Loop through the "averages" array
        for (int i = 0; i < averages.size(); i++) {
          JSONObject averageData = averages.getJSONObject(i);
          String query = averageData.getString("query");
          float value = averageData.getFloat("value");
          
          println("Query: " + query);
          println("Value: " + value);
        }
      }
    }
  }
}

void draw() {
  // You can add your drawing code here
  

  noLoop();
}
