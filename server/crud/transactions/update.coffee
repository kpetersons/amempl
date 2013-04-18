Meteor.methods
	'Transactions.update': (transaction, success, failure)->
		transaction.account_id = _.extend({}, Accounts.findOne(name: transaction.transaction_account))._id
		transaction.category_id = _.extend({},Categories.findOne(name: transaction.transaction_category))._id
		transaction.amount = transaction.transaction_amount
		transaction.when = transaction.transaction_when
		transaction.isValid = true
		Validator.reference_exists Accounts, transaction, 'transaction_account', 'name'
		Validator.reference_exists Categories, transaction, 'transaction_category', 'name'
		Validator.is_empty Transactions, transaction, 'amount'
		Validator.is_empty Transactions, transaction, 'when'
		if transaction.isValid
			Transactions.update(transaction._id, $set: _.omit(transaction, ['messages', '_id']))
		transaction
		