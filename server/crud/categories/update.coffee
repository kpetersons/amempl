Meteor.methods
	'Categories.update': (category, success, failure)->
		category.isValid = true    
		category = Validator.uniqueness(Categories, category, 'name')    
		if category.isValid
			Categories.update(category._id, $set: _.omit(category, ['messages', '_id']))
		category
    
	'Categories.update_selected': (category)->
		_.each Categories.find().fetch(), (item) ->
			Categories.update item._id, 
				$set: 
					selected: false
		Categories.update category._id, 
			$set:
				selected: true
		category