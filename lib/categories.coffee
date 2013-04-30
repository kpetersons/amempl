@Categories = new Meteor.Collection 'categories'

@Categories.full_transform= (doc)->
	transactions = Transactions.forCategory(_id: doc._id).fetch()
	transactions = _.pluck transactions, 'amount' 
	transactionsSum = _.reduce transactions, (memo, num) -> 
	 	memo + new Number(num)
	, 0
	amount = transactionsSum
	doc = _.extend doc, 
		balance: amount
		totalTransactions: transactions.length
		transactions: transactions
		is_balance_positive: doc.type == 'income'
	return new Category(doc)

@Categories.default_transform= (doc)->
		new Category(doc)		

@Categories.forUser= (user, transformer)->
	unless transformer
		transformer = Categories.default_transform
	Categories.find {}, {transform: transformer}

@Category = (doc)->
	_.extend(this, doc);
		
@Category.prototype=
	constructor: Category