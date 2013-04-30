Template['accounts/account'].account= ->
	Session.get('detailsAccount')
  
Template['accounts/account'].transactions= ->
	account = Session.get('detailsAccount')
	Transactions.forAccount account, Transactions.full_transform

Template['accounts/account'].helpers  
		
	url_prefix: ->
		"/accounts/#{Session.get('detailsAccount')._id}"		