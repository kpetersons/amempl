@Transactions = new Meteor.Collection 'transactions', transform: (doc) ->	
	doc = _.extend(doc, type: Categories.findOne(_id: doc.category_id).type)
	return new Transaction(doc)

Transaction = (doc)->
	_.extend(this, doc);

Transaction.prototype=
	constructor: Transaction

	getType: ()->
		@type		