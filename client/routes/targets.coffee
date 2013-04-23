Meteor.Router.add
	'/targets/:target_id/transactions/new': (target_id)->
		target = Targets.findOne _id: target_id
		if target
			Session.set('newTransaction', target_id: target._id)
			Session.set('url_return', "/targets/#{target._id}/details")
			'transactions/new'
	'/targets/:target_id/transactions/:transaction_id/edit': (target_id, transaction_id)->
		editTransaction = Transactions.findOne(
			_id: transaction_id
			target_id: target_id
		)
		if editTransaction
			Session.set('editTransaction', editTransaction)
			Session.set('url_return', "/targets/#{target_id}/details")
		'transactions/edit'
	'/targets/:id/details': (_id)->
		detailsTarget = Targets.findOne(_id: _id)
		if detailsTarget
			Session.set('detailsTarget', detailsTarget)
			'targets/target'
	'/targets/:id/edit': (_id)->
		editTarget = Targets.findOne(_id: _id)
		if editTarget
			Session.set('editTarget', editTarget)
			'targets/edit'
	'/targets/new': ->
		Session.set('newTarget', {name: 'untitled', description: ''})
		'targets/new'
	'/targets': ->
		detailsTarget = Targets.findOne selected: true
		if detailsTarget
			Meteor.Router.to("/targets/#{detailsTarget._id}/details");
			return 'targets/target'
		'targets/targets'