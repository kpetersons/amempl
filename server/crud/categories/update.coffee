Meteor.methods
	'Categories.update': (category, success, failure)->
		category.isValid = true    
		category = Validator.uniqueness(Categories, category, 'name')    
		if category.isValid
			Categories.update(category._id, $set: _.omit(category, ['messages', '_id']))
			Transactions.update({category_id: category._id}, {$set: {transaction_category: category.name}}, {multi:true})
		category
    
	'Categories.update_selected': (category)->
		Categories.update({}, {$set: {selected: false}}, {multi: true})
		Categories.update category._id, 
			$set:
				selected: true
		category