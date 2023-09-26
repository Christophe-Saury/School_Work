
// add explanations
public class Problem1 {

    private int a;
    private int sum;

    public static void main (String[] args) {
        Problem1 problem1 = new Problem1();
        problem1.call_sequence(9);
        problem1.print_sum();
    }

    public void print_sum(){
        System.out.println("This is the sum : "+ this.getSum());
    }

    public void call_sequence(int max_n){
        // Check How to replace this by streams
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
}
