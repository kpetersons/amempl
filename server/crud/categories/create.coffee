Meteor.methods
	'Categories.create': (category, success, failure)->
		category.isValid = true
		category = Validator.uniqueness(Categories, category, 'name')    
		category = Validator.isWithinList(Categories, category, 'type', ['income', 'expense'])
		if category.isValid
			Categories.insert(_.omit(category, ['messages']))
		category