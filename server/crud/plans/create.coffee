Meteor.methods
	'Plans.create': (plan, success, failure)->
		# TODO validations
		plan.isValid = true
		Validator.uniqueness Plans, plan, 'name'
		Validator.is_empty Plans, plan, 'from'
		Validator.is_empty Plans, plan, 'to'
		Validator.is_empty Plans, plan, 'categories'
		if plan.isValid
			Plans.insert _.omit(plan, ['messages']), (error, plan_id) ->
				_.each plan.categories, (item) ->
					PlanCategories.insert({plan_id: plan_id, category_id: item._id, plan_category_name: item.name})
		plan