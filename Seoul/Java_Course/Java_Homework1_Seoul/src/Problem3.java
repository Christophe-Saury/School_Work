/*
Java class homework problem 3
1. Generate random numbers within the range from 0 to the length of the string.
2. Check if the character at the corresponding position(generated random number) in the
string s is 'O'.
3. If the character is 'O', print "hit" along with the generated random number and exit the
loop.
4. If the character is 'X', print "miss" along with the generated random number and continue
to the next iteration of the loop.
*/
import java.util.Scanner;

public class Problem3 {

    public static void main(String[] args) {

        String input = "XXXXOXXXX";
        int length_string = input.length();
        System.out.println(length_string);
        int random;

        while(true){
            random =(int) (Math.random() * length_string);
            char single = input.charAt(random);
            if(single == 'O'){
                System.out.println("hit : "+ random);
                break;
            } else {
                System.out.println("miss : " + random);
            }
        }
    }
}
