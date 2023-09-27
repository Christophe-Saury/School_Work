/*
Given a test string s = "JAVAjava", perform the following steps.
1. Print the length of the string.
2. Print the first character of the string (printing as a string type is also acceptable).
3. Print the last character of the string (printing as a string type is also acceptable)
*/
// TODO add description + clean code principles

public class Problem4 {

    // -------------------- Main method ------------------------
    public static void main(String[] args) {

        String s = "JAVAjava";
        int length_of_string = s.length();
        System.out.println("The length of the string is " + length_of_string);
        System.out.println("The first letter is " + s.charAt(0));
        System.out.println("The last letter is " + s.charAt(length_of_string-1));
    }
}
