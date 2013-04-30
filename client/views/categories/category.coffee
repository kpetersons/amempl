Template['categories/category'].category= ->
	Session.get('detailsCategory')
  
Template['categories/category'].transactions= ->
	category = Session.get('detailsCategory')
	Transactions.forCategory category, Transactions.full_transform

Template['categories/category'].helpers
	url_prefix: ->
		"/categories/#{Session.get('detailsCategory')._id}"