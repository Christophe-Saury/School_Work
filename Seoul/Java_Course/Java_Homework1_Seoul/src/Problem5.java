/*
Complete the bank deposit and withdrawal program in Java.
First, you should create a personal account number.
And then, you can use the deposit and withdrawal system from the account. Also,
You can check the balance.
However, withdrawal is not possible if the balance is insufficient.
The functions are as follows.
1: Deposit money
2: Withdrawal
3: Check balance
4: Exit Program
Your account number is between 1 and 100000000000 as integer.

*/

import java.util.Scanner;

public class Problem5 {

    private long account_number;
    private int balance;

    // ------------------------------ MAIN METHOD -----------------------------------
    public static void main(String[] args) {

        Problem5 problem5 = new Problem5();
        Scanner scanner = new Scanner(System.in);

        problem5.create_account(scanner, problem5);

        while(true) {
            int chosen_action = problem5.choose_action(scanner);

            if(chosen_action != 4){
               problem5.do_action(scanner, problem5, chosen_action);
            } else {
               break;
            }
        }
    }

    // ---------------------------- Getters and Setters -------------------------------------------
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


    // ------------------------------ Methods to create an account ------------------------------------------
    public void create_account(Scanner scanner, Problem5 problem5){
        System.out.println("Create your account number : ");

        boolean bError = true;   // Try and catch that checks if input is as it should be
        while (bError) {
            if(filter_number(scanner, problem5)){ // Makes sure that input is a long and within range
                scanner.next();
                continue;
            }
            bError = false;
        }
        problem5.setAccount_number(account_number);
    }

    public boolean filter_number(Scanner scanner, Problem5 problem5){
        if (scanner.hasNextLong()) {
            account_number = scanner.nextLong();
            if (problem5.isAccountNbWithinRange(account_number)) {
                return true;
            }
        } else {
            return true;
        }
        return false;
    }

    public boolean isAccountNbWithinRange(long account_number){
        return (account_number <= 0 | account_number > 100000000000L);
    }


    // --------------------------------- Methods to make the user perform an action -------------------------
    public int choose_action(Scanner scanner){
        System.out.println("--------------------------------------------------------------------");
        System.out.println("1. Deposit | 2. Withdrawal | 3. Balance | 4. Exit");
        System.out.println("--------------------------------------------------------------------");
        System.out.println("Input : ");
        return scanner.nextInt();
    }

    public void do_action(Scanner scanner, Problem5 problem5, int chosen_option){
        switch (chosen_option) {
            case 1:
                problem5.deposit(scanner, problem5);
                break;
            case 2:
                problem5.withdraw(scanner, problem5);
                break;
            case 3:
                problem5.check_balance(problem5);
                break;
        }
    }


    // ------------- Main functions of the program --------------------------------
    public void deposit(Scanner scanner, Problem5 problem5){
        System.out.println("Deposit money : ");
        int deposit_amount = scanner.nextInt();
        problem5.setBalance(problem5.getBalance() + deposit_amount);
    }

    public void withdraw(Scanner scanner, Problem5 problem5){
        System.out.println("Withdrawal money : ");
        int withdraw_amount = scanner.nextInt();
        int new_balance = problem5.getBalance() - withdraw_amount;

        if (new_balance > 0) {
            problem5.setBalance(new_balance);
        } else {
            int shortage_amount = -1 * (new_balance);
            System.out.println("!! Insufficient Balance !!\nShortage amount : " + shortage_amount);
        }
    }

    public void check_balance(Problem5 problem5){
        System.out.println("Balance : " + problem5.getBalance());
    }
}
