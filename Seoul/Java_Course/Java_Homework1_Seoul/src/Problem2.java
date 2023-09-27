/*
Write a Java program that draws the Hourglass-like (모래시계) shape only using two
permitted characters - ‘*’, ‘ ‘ (asterisk, blank)
You don’t need to draw the shape exactly as the expected output below, that means
you don’t have to count down the exact number of asterisks in the example below.
Full score will be given for the program that draws a symmetric Hourglass-like shape.
(If the output is asymmetric to the center of the draw, there will be some point
deduction.)
It is mandatory to use a loop to draw the desired shape. If you don’t use any loop to
draw you will get 0 points.
*/
import java.util.Scanner;

// TODO check to replace for by streams api and replace other apis
// TODO check clean code principles
public class Problem2 {

    private int original_length;
    private String result="";

    // ------------------------ Main method ------------------------
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);  // Create a Scanner object
        System.out.println("Enter length of the string");
        int original_length = scanner.nextInt();  // Read user input

        while(original_length%2==1 | original_length<=0){ // check if it's a valid input
            System.out.println("Input must be pair and superior to 0, please enter a new input");
            original_length = scanner.nextInt();  // Read user input
        }

        Problem2 problem2 = new Problem2();     // Creates the class object
        problem2.initialize(original_length);
        problem2.draw_hourglass();
        problem2.print_result();
    }

    //--------------------------- Getters and setters ---------------------------------
    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public int getOriginal_length() {
        return original_length;
    }

    public void setOriginal_length(int original_length) {
        this.original_length = original_length;
    }


    // --------------------------- Methods ------------------------
    public void initialize(int original_length){
        this.setOriginal_length(original_length);

        String result = this.getResult();
        for(int i = 0; i<this.original_length; i++){
            result += "_";
        }
        this.setResult(result);
    }

    public void print_result(){
        System.out.println(this.getResult());
    }

    public void draw_line(int line_length){

        int side_length = (this.original_length - line_length)/2;
        String line = "\n";

        line = this.draw_side_space(line, side_length); // adds the side space to the line

        for(int i=0; i<line_length; i++){
            line += "*";          // adding the * to the line in between the side spaces
        }

        line = this.draw_side_space(line, side_length);
        result = this.getResult()+line;
        this.setResult(result);
    }

    public String draw_side_space(String line, int side_length){
        for(int i=0; i<side_length; i++){
            line += " ";
        }
        return line;
    }

    public void draw_hourglass(){
        for(int i = this.original_length; i >= 2; i=i-2){
            this.draw_line(i);
        }
        for(int i = 2; i <= this.original_length; i=i+2){
            this.draw_line(i);
        }
    }

}
