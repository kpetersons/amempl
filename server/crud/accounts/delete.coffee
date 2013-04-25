Meteor.methods
	'Accounts.delete': (account, success, failure)->
		Accounts.remove(account._id)
		account