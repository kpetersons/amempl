Meteor.methods
	'Transactions.delete': (transaction, success, failure)->
		Transactions.remove(transaction._id)
		transaction