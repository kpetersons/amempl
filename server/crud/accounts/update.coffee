Meteor.methods
	'Accounts.update': (account, success, failure)->
		account.isValid = true
		account = Validator.uniqueness(Accounts, account, 'name')
		if account.isValid
			Accounts.update(account._id, $set: _.omit(account, ['messages', '_id']))
			Transactions.update({account_id: account._id}, {$set: {transaction_account: account.name}}, {multi: true})
		account
    
	'Accounts.update_default': (account)->
		Accounts.update({}, {$set: {default: false}}, {multi: true})
		Accounts.update account._id, 
			$set:
				default: true
        
	'Accounts.update_selected': (account)->
		Accounts.update({}, {$set: {selected: false}}, {multi: true})
		Accounts.update account._id, 
			$set:
				selected: true
		account
		
	'Accounts.update_unselected': (account)->
		Accounts.update({}, {$set: {selected: false}}, {multi: true})
		account		