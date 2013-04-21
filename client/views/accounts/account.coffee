Template['accounts/account'].account= ->
	Session.get('detailsAccount')
  
Template['accounts/account'].transactions= ->
	Transactions.find(account_id: Session.get('detailsAccount')._id)

Template['accounts/account'].helpers  
	transaction_account: ->
		_.extend({}, Accounts.findOne(_id: @transaction.account_id)).name
	
	transaction_category: ->
		_.extend({}, Categories.findOne(_id: @transaction.category_id)).name		

	transaction_when: ->
		@transaction.when
		
	transaction_amount: ->
		accounting.formatMoney(@transaction.amount, '', 2)
		
	url_prefix: ->
		"/accounts/#{Session.get('detailsAccount')._id}"		