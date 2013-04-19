Template['accounts/account'].account= ->
	Session.get('detailsAccount')
  
Template['accounts/account'].transactions= ->
	Transactions.find(account_id: Session.get('detailsAccount')._id)

Template['accounts/account'].helpers
	url_prefix: ->
		"/accounts/#{Session.get('detailsAccount')._id}"