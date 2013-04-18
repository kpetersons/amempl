Template['accounts/accounts_item'].helpers
	account_name: ->
  	@account.name
    
	account_description: ->
  	@account.description
    
	account_balance: ->
  	accounting.formatMoney(@account.balance, '', 2)
    
	account_default: ->
		console.log 'is', @account, 'default', @account.default
		@account.default == true
		
Template['accounts/accounts_item'].events
	'click a.default': (evt) ->
		Meteor.call 'Accounts.update_default', @account, (error, account)-> return						
		console.log 'account', @account