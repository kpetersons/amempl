Meteor.methods
	'Categories.delete': (category, success, failure)->
		Categories.remove(category._id)
		category