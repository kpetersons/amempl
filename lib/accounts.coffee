@Accounts = new Meteor.Collection 'accounts', transform: (doc) ->
	transactions = Transactions.find(account_id: doc._id).fetch()
	incomes = _.reject transactions, (transaction) -> transaction.getType() == 'expense'
	expenses = _.reject transactions, (transaction) -> transaction.getType() == 'income'
	incomes = _.pluck incomes, 'amount' 
	expenses = _.pluck expenses, 'amount' 
	amount = _.reduce incomes, (memo, num) -> 
	 	memo + new Number(num)
	, 0
	amount = amount - _.reduce expenses, (memo, num) -> 
		memo + new Number(num)
	, 0
	doc = _.extend(doc, balance: amount)	
	return new Account(doc)

Account = (doc)->
	_.extend(this, doc);
		
Account.prototype=
	constructor: Account
	
	getBalance: ()->		
		@balance
		
	isBalancePositive: ()->
		if @getBalance() >= 0
			true
		else
			false