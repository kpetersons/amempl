Meteor.methods
	'Categories.update': (category, success, failure)->
		category.isValid = true    
		category = Validator.uniqueness(Categories, category, 'name')    
		if category.isValid
			Categories.update(category._id, $set: _.omit(category, ['messages', '_id']))
		category