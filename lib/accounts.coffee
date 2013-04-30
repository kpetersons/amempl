@Accounts = new Meteor.Collection 'accounts', transform: (doc) ->
	transactions = Transactions.forAccount(_id: doc._id).fetch()
	incomes = _.reject transactions, (transaction) -> transaction.type == 'expense'
	expenses = _.reject transactions, (transaction) -> transaction.type == 'income'
	incomes = _.pluck incomes, 'amount' 
	expenses = _.pluck expenses, 'amount' 
	incomesSum = _.reduce incomes, (memo, num) -> 
	 	memo + new Number(num)
	, 0
	expensesSum = _.reduce expenses, (memo, num) -> 
		memo + new Number(num)
	, 0
	amount = incomesSum - expensesSum
	doc = _.extend doc, 
		balance: amount
		totalTransactions: transactions.length
		transactions: transactions
		totalIncomes: incomes.length
		totalExpenses: expenses.length
		incomesSum: incomesSum
		expensesSum: expensesSum
		is_balance_positive: incomesSum >= expensesSum
	return new Account(doc)

@Account = (doc)->
	_.extend(this, doc);
		
@Account.prototype=
	constructor: Account	