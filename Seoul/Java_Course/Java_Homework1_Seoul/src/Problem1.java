/*
Write a Java program that sums up the sequence that is defined by given recurrence
𝑎 = 1,
0
𝑎
𝑛 = 2𝑎
𝑛−1 + 1, (𝑛 = 1, 2, 3, ....)
The variables you can use inside the main method will be restricted as follows
1) int a // you have to store the term of given sequence to this variable
2) int sum // you have to store the result of summation to this variable
3) int i // this variable is for the index inside the loop
Specifically, the operators that can be used with the variable 'a' are restricted to
bitwise operators and assignment operators. That means, you cannot use any
arithmetic operators( ‘+’, ‘-’, ‘*’, ‘/’ …) with variable ‘a’
 */

public class Problem1 {

    private int a;
    private int sum;

    // ---------------------------- Main method ---------------------------------------
    public static void main (String[] args) {
        Problem1 problem1 = new Problem1();
        problem1.call_sequence(9);
        problem1.print_sum();
    }


    // ---------------------------- Getters and Setters --------------------------------
    public int getA() {
        return a;
    }

    public void setA(int a) {
        this.a = a;
    }

    public int getSum() {
        return sum;
    }

    public void setSum(int sum) {
        this.sum = sum;
    }


    // --------------------------------- Class Methods ----------------------------
    public void print_sum(){
        System.out.println("This is the sum : "+ this.getSum());
    }

    public void call_sequence(int max_n){
        for(int i=0; i<=max_n; i++) {
            this.calculate_a(this.getA(), i);
            this.setSum(this.getSum()+ this.getA());
        }
    }

    public void calculate_a(int a, int n){
        a = (2*a) + 1;
        setA(a);
        System.out.println("This is a"+ n+" : "+getA());

    }


}
