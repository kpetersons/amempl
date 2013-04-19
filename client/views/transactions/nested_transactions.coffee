Meteor.subscribe("transactions")
Template['transactions/nested_transactions'].nested_transactions= ->
	@transactions