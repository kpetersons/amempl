Template['plans/plan'].plan= ->
	Session.get('detailsPlan')
  
Template['plans/plan'].transactions= ->
	Transactions.find({category_id: {$in: _.pluck(Session.get('detailsPlan').categories, '_id')}}).fetch()	

Template['plans/plan'].helpers  
	transaction_account: ->
		_.extend({}, Accounts.findOne(_id: @transaction.account_id)).name
	
	transaction_category: ->
		_.extend({}, Categories.findOne(_id: @transaction.category_id)).name		

	transaction_when: ->
		@transaction.when
		
	transaction_amount: ->
		accounting.formatMoney(@transaction.amount, '', 2)
		
	url_prefix: ->
		"/plans/#{Session.get('detailsPlan')._id}"		