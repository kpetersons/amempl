Meteor.methods
	'Accounts.update': (account, success, failure)->
		account = Validator.uniqueness(Accounts, account, 'name')
		if account.isValid
			Accounts.update(account._id, $set: _.omit(account, ['messages', '_id']))
		account
    
	'Accounts.update_default': (account)->
		_.each Accounts.find().fetch(), (item) ->
			Accounts.update item._id, 
				$set: 
					default: false
		Accounts.update account._id, 
			$set:
				default: true