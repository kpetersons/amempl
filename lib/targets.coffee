@Targets = new Meteor.Collection 'targets'

@Targets.full_transform= (doc)->
	transactions = Transactions.forCategories({_ids: _.pluck(doc.categories, '_id')}, Transactions.full_transform).fetch()
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

@Targets.default_transform= (doc)->
		new Account(doc)		

@Targets.forUser= (user, transformer)->
	unless transformer
		transformer = Accounts.default_transform
	Accounts.find {}, {transform: transformer}

@Target = (doc)->
	_.extend(this, doc);
		
@Target.prototype=
	constructor: Target