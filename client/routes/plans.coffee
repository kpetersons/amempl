Meteor.Router.add
	'/plans/:plan_id/transactions/new': (plan_id)->
		plan = Plans.findOne _id: plan_id
		if plan
			Session.set('newTransaction', {})
			Session.set('url_return', "/plans/#{plan._id}/details")
			'transactions/new'
	'/plans/:plan_id/transactions/:transaction_id/edit': (plan_id, transaction_id)->
		editTransaction = Transactions.findOne(
			_id: transaction_id
		)
		if editTransaction
			Session.set('editTransaction', editTransaction)
			Session.set('url_return', "/plans/#{plan_id}/details")
		'transactions/edit'
	'/plans/:id/delete': (_id)->
		deletePlan = Plans.findOne(_id: _id)
		if deletePlan
			Session.set('deletePlan', deletePlan)
			'plans/delete'          
	'/plans/:id/details': (_id)->
		detailsPlan = Plans.findOne(_id: _id)
		if detailsPlan
			Session.set('detailsPlan', detailsPlan)
			Session.set('planCategories', detailsPlan.categories)
			'plans/plan'
	'/plans/:id/edit': (_id)->
		editPlan = Plans.findOne(_id: _id)
		if editPlan
			Session.set('editPlan', editPlan)
			Session.set('planCategories', editPlan.categories)      
			'plans/edit'
	'/plans/new': ->
		Session.set('newPlan', {name: 'untitled', description: ''})
		'plans/new'
	'/plans': ->
		Meteor.Nav.setInactiveAll()
		Meteor.Nav.setActive('plans_active')	
		detailsPlan = Plans.findOne selected: true
		if detailsPlan
			Meteor.Router.to("/plans/#{detailsPlan._id}/details");
			return 'plans/plan'
		'plans/plans'