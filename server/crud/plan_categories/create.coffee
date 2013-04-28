Meteor.methods
	'PlanCategories.create': (planCategory, success, failure)->
		# TODO validations
		planCategory.isValid = true
		Validator.is_empty PlanCategory, planCategory, 'planned'
		if planCategory.isValid
      PlanCategories.insert(_.omit(planCategory, ['messages']))
		planCategory