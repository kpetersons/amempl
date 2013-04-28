Meteor.subscribe("plan_categories")
Template['plans/plan'].plan= ->
	Session.get('detailsPlan')
  
Template['plans/plan'].transactions= ->
	Transactions.find({category_id: {$in: _.pluck(Session.get('detailsPlan').categories, '_id')}}).fetch()	

Template['plans/plan'].plan_categories= ->
	PlanCategories.find({plan_id: Session.get('detailsPlan')._id}).fetch()		
	
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
		
Template['plans/plan'].events
	'click .save': ->
		planCategories = $('td input')
		_.each planCategories, (planCategory) ->
			planCategoryId = $(planCategory).attr('data-plan-category')
			planCategoryPlanned = $(planCategory).val()
			Meteor.call 'PlanCategories.update', {_id: planCategoryId, planned: planCategoryPlanned}, (error, planCategory)-> return
			console.log planCategoryId, planCategoryPlanned
			