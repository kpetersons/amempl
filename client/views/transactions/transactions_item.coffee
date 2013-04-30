Template['transactions/transactions_item'].helpers
	transaction_account: ->
		_.extend({}, Accounts.findOne(_id: @transaction.account_id)).name
	
	transaction_category: ->
		_.extend({}, Categories.findOne(_id: @transaction.category_id)).name		

	transaction_when: ->
		moment(@transaction.when).format('DD/MMM/YYYY')
		
	transaction_amount: ->
		amount = @transaction.amount
		if @transaction.type == 'expense'
			amount = -1 * amount
		accounting.formatMoney(amount, '', 2)
		
	transaction_type_class: ->
		if @transaction.type == 'income'
			'text-success'
		else
			'text-error'
Template['transactions/transactions_item'].events
	'click a.accounts.details': (evt) ->
		Meteor.call 'Accounts.update_selected', Accounts.findOne(_id: @transaction.account_id), (error, account)->
			Meteor.Router.to("/accounts/#{account._id}/details");    
			
	'click a.categories.details': (evt) ->
		Meteor.call 'Categories.update_selected', Categories.findOne(_id: @transaction.category_id), (error, category)->
			Meteor.Router.to("/categories/#{category._id}/details");    			