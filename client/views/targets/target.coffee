Template['targets/target'].target= ->
	Session.get('detailsTarget')
  
Template['targets/target'].transactions= ->
	Transactions.find(target_id: Session.get('detailsTarget')._id)

Template['targets/target'].helpers  
	transaction_account: ->
		_.extend({}, Accounts.findOne(_id: @transaction.account_id)).name
	
	transaction_category: ->
		_.extend({}, Categories.findOne(_id: @transaction.category_id)).name		

	transaction_when: ->
		@transaction.when
		
	transaction_amount: ->
		accounting.formatMoney(@transaction.amount, '', 2)
		
	url_prefix: ->
		"/targets/#{Session.get('detailsTarget')._id}"		