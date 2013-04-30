Meteor.subscribe("transactions")
Template['transactions/transactions'].transactions= ->
	filter = Session.get('transactionFilter')
	unless _.isEmpty filter
		filter = new RegExp(filter, 'i')
		Transactions.findQuery({$or: [{transaction_account: filter}, {transaction_category: filter}, {when: filter}, {amount: filter}]}, Transactions.full_transform)
	else
		Transactions.findQuery({}, Transactions.full_transform)

Template['transactions/transactions'].helpers
	url_prefix: ->
		''
Template['transactions/transactions'].filter= ->
	Session.get('transactionFilter')
		
Template['transactions/transactions'].events
	'keyup .filter': (evt)->
		Session.set 'transactionFilter', $(evt.target).val()
		return