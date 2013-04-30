@Transactions = new Meteor.Collection 'transactions'

@Transactions.full_transform= (doc)->
		category = 	Categories.findOne(_id: doc.category_id)
		account = 	Accounts.findOne(_id: doc.account_id)
		doc = _.extend doc, 
			type: category.type	
			category_name: category.name
			account_name: account.name
		new Transaction(doc)

@Transactions.default_transform= (doc)->
		new Transaction(doc)		

@Transactions.findQuery= (query, transformer)->
	unless transformer
		transformer = Transactions.default_transform
	Transactions.find query, {transform: transformer}
	
@Transactions.forAccount= (account, transformer)->
	unless transformer
		transformer = Transactions.default_transform
	Transactions.find {account_id: account._id}, {transform: transformer}

@Transactions.forCategory= (category, transformer)->
	unless transformer
		transformer = Transactions.default_transform
	Transactions.find {category_id: category._id}, {transform: transformer}
				
@Transactions.forUser= (user, transformer)->
	unless transformer
		transformer = Transactions.default_transform
	Transactions.find {}, {transform: transformer}
		
@Transaction = (doc)->
	_.extend(this, doc);

@Transaction.prototype=
	constructor: Transaction