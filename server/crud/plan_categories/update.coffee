Meteor.methods
	'PlanCategories.update': (planCategory, success, failure)->
		# TODO validations
		planCategory.isValid = true
		Validator.is_empty PlanCategories, planCategory, 'planned'
		console.log 'planCategory', planCategory
		if planCategory.isValid			
			PlanCategories.update(planCategory._id, $set: _.omit(planCategory, ['messages', '_id']))
		planCategory
		
	'PlanCategories.update_selected': (planCategory)->
		PlanCategories.update({}, {$set: {selected: false}}, {multi: true})
		PlanCategories.update planCategory._id, 
			$set:
				selected: true
		planCategory
		
	'PlanCategories.update_unselected': (planCategory)->
		PlanCategories.update({}, {$set: {selected: false}}, {multi: true})
		planCategory