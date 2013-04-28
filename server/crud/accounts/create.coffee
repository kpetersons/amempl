Meteor.methods
	'Accounts.create': (account, success, failure)->
		# TODO validations
		account.isValid = true
		account = Validator.uniqueness(Accounts, account, 'name')
		if account.isValid
			Accounts.insert(_.omit(account, ['messages']))
		account