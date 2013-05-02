Meteor.Router.add
	'/targets/:target_id/transactions/new': (target_id)->
		detailsTarget = Targets.findOne _id: target_id
		if detailsTarget
			Session.set('newTransaction', target_id: target._id)
			Session.set('detailsTarget', detailsTarget)		
			Session.set('url_return', "/targets/#{target._id}/details")
			'transactions/new'
	'/targets/:target_id/transactions/:transaction_id/edit': (target_id, transaction_id)->
		detailsTarget = Targets.findOne _id: target_id
		editTransaction = Transactions.findOne(
			_id: transaction_id
			target_id: target_id
		)
		if detailsTarget 
			Session.set('detailsTarget', detailsTarget)		
			Session.set('editTransaction', editTransaction)
			Session.set('url_return', "/targets/#{target_id}/details")
		'transactions/edit'
	'/targets/:target_id/categories/:category_id/details': (target_id, category_id)->
		detailsTarget = Targets.findOne _id: target_id
		detailsCategory = Categories.findOne _id: category_id
		if detailsTarget
			Session.set('detailsCategory', detailsCategory)
			Session.set('detailsTarget', detailsTarget)
			Session.set('url_return', "/targets/#{target_id}/details")
			console.log detailsTarget
			'targets/target'	
	'/targets/:id/delete': (_id)->
		deleteTarget = Targets.findOne(_id: _id)
		if deleteTarget
			Session.set('deleteTarget', deleteTarget)
			'targets/delete'          
	'/targets/:id/details': (_id)->
		detailsTarget = Targets.findOne(_id: _id)
		if detailsTarget
			Session.set('detailsTarget', detailsTarget)
			'targets/target'
	'/targets/:id/edit': (_id)->
		editTarget = Targets.findOne(_id: _id)
		if editTarget
			Session.set('editTarget', editTarget)
			Session.set('targetCategories', Categories.forTarget(editTarget).fetch())
			'targets/edit'
	'/targets/new': ->
		Session.set('newTarget', {name: 'untitled', description: ''})
		'targets/new'
	'/targets': ->
		Meteor.Nav.setInactiveAll()
		Meteor.Nav.setActive('targets_active')	
		detailsTarget = Targets.findOne selected: true
		if detailsTarget
			Meteor.Router.to("/targets/#{detailsTarget._id}/details");
			return 'targets/target'
		'targets/targets'