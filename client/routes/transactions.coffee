Meteor.Router.add
	'/transactions/:id/delete': (_id)->
		deleteTransaction = Transactions.findOne(_id: _id)
		if deleteTransaction
			Session.set('deleteTransaction', deleteTransaction)
			'transactions/delete'          
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