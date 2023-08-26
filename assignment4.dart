abstract class Account {
  int accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print('Deposited: ${amount.toStringAsFixed(2)}');
    } else {
      print('Invalid deposit amount');
    }
  }

  void withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount > 0) {
      if (amount <= balance) {
        balance -= amount;
        balance += balance * (interestRate / 100);
        print('Withdrawn: ${amount.toStringAsFixed(2)}');
      } else {
        print('Insufficient funds');
      }
    } else {
      print('Invalid withdrawal amount');
    }
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount > 0) {
      if (amount <= balance + overdraftLimit) {
        balance -= amount;
        print('Withdrawn: ${amount.toStringAsFixed(2)}');
      } else {
        print('Insufficient funds');
      }
    } else {
      print('Invalid withdrawal amount');
    }
  }
}

void main() {
  var savings = SavingsAccount(12345, 10000.0, 2.5);
  savings.deposit(50000.0);
  savings.withdraw(30000.0);

  var current = CurrentAccount(54321, 20000.0, 10000.0);
  current.deposit(100000.0);
  current.withdraw(25000.0);
}
