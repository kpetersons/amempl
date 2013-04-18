Meteor.methods
	'Accounts.create': (account, success, failure)->
		# TODO validations
		account = Validator.uniqueness(Accounts, account, 'name')
		if account.isValid
      toSave = _.omit(account, ['messages'])
      _.extend toSave, createdAt: new Date()
			Accounts.insert(toSave)
		account