# Bank

**Tech used**
* Ruby
* RSpec
* SimpleCov
* Rubocop

**To install this program**
* Fork and clone this repository
* Type `bundle install` in the command line

**To run the tests**
* Type `rspec` in the command line

**To run this program**
* Navigate to the project directory in your command line
* Type `irb -r ./lib/account.rb`
* Define a new instance of the Account class (e.g. `my_account = Account.new`)
<br>
As a user/account owner, you have only 3 actions:
* .deposit(amount) (e.g. `my_account.deposit(50`)
* .withdraw(amount) (e.g. `my_account.withdraw(10)`)
* .print_statement (e.g. `my_account.print_statement`)

[Program in action](Screenshot 2019-12-17 at 10.31.08.png)

**Flow of code**
The code has 3 classes: Account, Transaction and Statement.<br>
The user only interacts with the Account class, via the methods above.

On initialization, the **Account** class creates a new instance of the Statement class.

Both the `.deposit` and `.withdraw` methods do the following:
* Add or subtract the amount to the account balance
* Create a new instance of the Transaction class, passing the transaction type, amount and current account balance
* Call the `statement.add` method, to add the created transaction to the statement's transaction history

The `print_statement` method calls the `print` statement from the Statement class.
<br>

On initialization, the **Transaction** class takes parameters of the transaction type (withdrawal or deposit), the transaction amount, the current balance of the account at the point the transaction is made. It also takes a date parameter that defaults to a formatted version of `Time.now`, but which can be defined by the user, i.e. for the purposes of the tests to return the statement expected in the acceptance criteria. It stores these parameters as instance variables.

It has just one method: `.format`, which formats a string ready to be printed in the statement. The order of the data (i.e., whether the transaction amount appears as credit or debit) is determined by an if statment, based on whether the transaction type is withdrawal or deposit.
<br>

A new instance of the **Statement** class is created when a new Account is created. On initialization, it has an instance variable of `@transaction_history`, which is an empty array.

The `.add` method pushes the latest transaction to this array.

The `.print` method prints the hard-coded header, and all the transactions in the transaction history, joined together by `\n` in order to print each transaction on a new line.
<br>

When the user calls `my_account.withdraw(amount)` or `my_account.deposit(amount)`, this creates a new instance of the Transaction class, and calls the `transaction.format` method. This formatted string is then added to the `transaction_history` array of the Statement instance.

**My approach**
I initially sketched out a [diagram](IMG_20191217_101610.jpg) of the different objects (Classes) I thought would be involved in the program: Account, Transaction and Statement. I then added the different methods and properties I thought would be necessary for each class.

I then created a notes.md file, where I took down the details from the tech test, as well as the acceptance criteria. I also wrote up my own simpler input-output tests to build up to the Acceptance Criteria.

My program is TDD, and I followed the red-green-refactor process quite strictly. I started with the account_spec.rb tests. Once my tests were passing, I decided it would be better to refactor the code into separate classes. I created the Transaction class and then the Statement class, via TDD.
