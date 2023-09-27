
// TODO check clean code principles + streams api + other apis + write tests + separate in different fonctions
import java.util.Scanner;

public class Problem5 {

    private long account_number;
    private int balance;


    public static void main(String[] args) {

        Problem5 problem5 = new Problem5();
        Scanner scanner = new Scanner(System.in);
        System.out.println("Create your account number : ");
        // TODO add a try and catch
        long account_number=0;

        boolean bError = true;
        while (bError) {
            if (scanner.hasNextLong()) {
                account_number = scanner.nextLong();
                if (account_number <= 0 | account_number > 100000000000L) {
                    scanner.next();
                    continue;
                } else {
                }
            } else {
                scanner.next();
                continue;
            }
            bError = false;
        }

        problem5.setAccount_number(account_number);

        account_operations:
        while(true) {
            System.out.println("--------------------------------------------------------------------");
            System.out.println("1. Deposit | 2. Withdrawal | 3. Balance | 4. Exit");
            System.out.println("--------------------------------------------------------------------");
            System.out.println("Input : ");
            int chosen_option = scanner.nextInt();

            switch (chosen_option) {
                case 1:
                    System.out.println("Deposit money : ");
                    int deposit_amount = scanner.nextInt();
                    problem5.setBalance(problem5.getBalance() + deposit_amount);
                    break;
                case 2:

                    System.out.println("Withdrawal money : ");
                    int withdraw_amount = scanner.nextInt();
                    int new_balance = problem5.getBalance() - withdraw_amount;
                    if (new_balance > 0) {
                        problem5.setBalance(new_balance);
                    } else {
                        int shortage_amount = -1 * (new_balance);
                        System.out.println("!! Insufficient Balance !!\nShortage amount : " + shortage_amount);
                    }
                    break;
                case 3:
                    System.out.println("Balance : " + problem5.getBalance());
                    break;
                case 4:
                    break account_operations;
                default:
            }
        }



    }

    public long getAccount_number() {
        return account_number;
    }

    public void setAccount_number(long account_number) {
        this.account_number = account_number;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }



    public void deposit(){

    }

    public void withdraw(){

    }

    public void check_balance(){

    }

    public void choose_option(){}

    public void exit(){

    }

    public void create_account(){

    }

}
