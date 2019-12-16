# Bank
## First tech test

**Tech used**
* Ruby
* RSpec

**To run this program**
* Fork and clone this repository
* Open IRB and type `require /lib/account.rb`
* Define a new instance of the Account class (e.g. `my_account = Account.new`)
As a user/account owner, you have only 3 actions:
* .deposit(amount) (e.g. `my_account.deposit(50`)
* .withdraw(amount) (e.g. `my_account.withdraw(10)`)
* .print_statement (e.g. `my_account.print_statement`)

**Flow of code**

The code has 3 classes: Account, Transaction and Statement.
The user only interacts with the Account class, via the methods above.

On initialization, the Account class creates a new instance of the Statement class.

Both the `.deposit` and `.withdraw` methods do the following:
* Add or subtract the amount to the account balance
* Create a new instance of the Transaction class, passing the transaction type, amount and current account balance
* Call the `statement.add` method, to add the created transaction to the statement's transaction history

The `print_statement` method calls the `print` statement from the Statement class.


The Transaction class takes parameters of the transaction type (withdrawal or deposit), the transaction amount, the current balance of the account at the point the transaction is made. It also takes a date parameter that defaults to a formatted version of `Time.now`, but which can be defined by the user, i.e. for the purposes of the tests to return the statement expected in the acceptance criteria.
