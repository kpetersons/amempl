Template['categories/category'].category= ->
	Session.get('detailsCategory')
  
Template['categories/category'].transactions= ->
	Transactions.find(category_id: Session.get('detailsCategory')._id)

Template['categories/category'].helpers
	url_prefix: ->
		"/categories/#{Session.get('detailsCategory')._id}"