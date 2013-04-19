Meteor.subscribe("transactions")
Template['transactions/transactions'].transactions= ->
		Transactions.find()

Template['transactions/transactions'].helpers
	url_prefix: ->
		''