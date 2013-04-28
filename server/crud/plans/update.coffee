Meteor.methods
	'Plans.update': (plan, success, failure)->
		# TODO validations
		plan.isValid = true
		Validator.uniqueness Plans, plan, 'name'
		Validator.is_empty Plans, plan, 'from'
		Validator.is_empty Plans, plan, 'to'
		Validator.is_empty Plans, plan, 'categories' 
		if plan.isValid
			Plans.update(plan._id, $set: _.omit(plan, ['messages', '_id']))
			_.each plan.categories, (item) ->
				planCategory = PlanCategories.findOne({plan_id: plan._id, category_id: item._id})
				if planCategory
					PlanCategories.update(planCategory._id, $set: _.omit(planCategory, ['messages', '_id']))
				else
					PlanCategories.insert({plan_id: plan._id, category_id: item._id, plan_category_name: item.name})			
		plan
		
	'Plans.update_selected': (plan)->
		Plans.update({}, {$set: {selected: false}}, {multi: true})
		Plans.update plan._id, 
			$set:
				selected: true
		plan
		
	'Plans.update_unselected': (plan)->
		Plans.update({}, {$set: {selected: false}}, {multi: true})
		plan