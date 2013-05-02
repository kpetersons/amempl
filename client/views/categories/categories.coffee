Meteor.subscribe("categories")
Template['categories/categories'].categories= ->	
	Categories.forUser(1, Categories.full_transform)
	
Template['categories/categories'].helpers
	url_prefix: ->
		''
		
Template['categories/categories'].events		
	'click a.clear': (evt) ->
		Meteor.call 'Categories.update_unselected', {}
		Meteor.Router.to('/categories')