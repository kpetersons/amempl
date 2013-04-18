Meteor.Router.add
	'/accounts/:id/edit': (_id)->
		editAccount = Accounts.findOne(_id: _id)
		if editAccount
			Session.set('editAccount', editAccount)
			'accounts/edit'
	'/accounts/new': ->
		Session.set('newAccount', {name: 'untitled', description: ''})
		'accounts/new'
	'/accounts': ->
  	'accounts/accounts'