Meteor.Router.add
	'/accounts/:account_id/transactions/new': (account_id)->
		account = Accounts.findOne _id: account_id
		if account
			Session.set('newTransaction', account_id: account._id)
			Session.set('url_return', "/accounts/#{account._id}/details")
			'transactions/new'
	'/accounts/:account_id/transactions/:transaction_id/edit': (account_id, transaction_id)->
		editTransaction = Transactions.findOne(
			_id: transaction_id
			account_id: account_id
		)
		if editTransaction
			Session.set('editTransaction', editTransaction)
			Session.set('url_return', "/accounts/#{account_id}/details")
		'transactions/edit'
	'/accounts/:id/delete': (_id)->
		deleteAccount = Accounts.findOne(_id: _id)
		if deleteAccount
			Session.set('deleteAccount', deleteAccount)
			'accounts/delete'    
	'/accounts/:id/details': (_id)->
		detailsAccount = Accounts.findOne(_id: _id)
		if detailsAccount
			Session.set('detailsAccount', detailsAccount)
			'accounts/account'
	'/accounts/:id/edit': (_id)->
		editAccount = Accounts.findOne(_id: _id)
		if editAccount
			Session.set('editAccount', editAccount)
			'accounts/edit'
	'/accounts/new': ->
		Session.set('newAccount', {name: 'untitled', description: ''})
		'accounts/new'
	'/accounts': ->
		Meteor.Nav.setInactiveAll()
		Meteor.Nav.setActive('accounts_active')
		detailsAccount = Accounts.findOne selected: true
		if detailsAccount
			Meteor.Router.to("/accounts/#{detailsAccount._id}/details");
			return 'accounts/account'
		'accounts/accounts'