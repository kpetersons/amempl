Meteor.Router.add
	'/transactions/:id/edit': (_id)->
		editTransaction = Transactions.findOne(_id: _id)
		if editTransaction
			Session.set('editTransaction', editTransaction)
			'transactions/edit'
	'/transactions/new': ->
		Session.set('newTransaction', {})
		'transactions/new'
	'/transactions': ->
  	'transactions/transactions'