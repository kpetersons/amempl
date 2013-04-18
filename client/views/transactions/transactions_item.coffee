Template['transactions/transactions_item'].helpers
	transaction_account: ->
		console.log 'Accounts.findOne(_id: @transaction.account_id)).name', 		_.extend({}, Accounts.findOne(_id: @transaction.account_id)).name, @transaction.account_id
		_.extend({}, Accounts.findOne(_id: @transaction.account_id)).name
	
	transaction_category: ->
		_.extend({}, Categories.findOne(_id: @transaction.category_id)).name		

	transaction_when: ->
		@transaction.when
		
	transaction_amount: ->
		accounting.formatMoney(@transaction.amount, '', 2)