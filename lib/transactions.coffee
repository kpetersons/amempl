@Transactions = new Meteor.Collection 'transactions'

@Transactions.full_transform= (doc)->
		doc = _.extend(doc, type: Categories.findOne(_id: doc.category_id).type)
		new Transaction(doc)

@Transactions.default_transform= (doc)->
		new Transaction(doc)		
		
@Transactions.forAccount= (account, transformer)->
	unless transformer
		transformer = Transactions.default_transform
	Transactions.find {account_id: account._id}, {transform: transformer}

@Transactions.forCategory= (category, transformer)->
	unless transformer
		transformer = Transactions.default_transform
	Transactions.find {category_id: category._id}, {transform: transformer}
				
@Transaction = (doc)->
	_.extend(this, doc);

@Transaction.prototype=
	constructor: Transaction