Meteor.methods
	'Categories.create': (category, success, failure)->
		# TODO validations
		category.isValid = true
		category = Validator.uniqueness(Categories, category, 'name')    
		if category.isValid
			Categories.insert(_.omit(category, ['messages']))
		category