Template['accounts/accounts_item'].helpers
	account_name: ->
  	@account.name
    
	account_description: ->
  	@account.description
    
	account_balance: ->
  	accounting.formatMoney(@account.balance, '', 2)
    
	account_default: ->
		@account.default == true

	account_selected: ->
		if @account.selected == true
			'success'
      
Template['accounts/accounts_item'].events
	'click a.default': (evt) ->
		Meteor.call 'Accounts.update_default', @account, (error, account)-> return					
	'click a.details': (evt) ->
		Meteor.call 'Accounts.update_selected', @account, (error, account)->
			Meteor.Router.to("/accounts/#{account._id}/details");