Meteor.methods
	'Plans.create': (plan, success, failure)->
		# TODO validations
		Validator.uniqueness Plans, plan, 'name'
		Validator.is_empty Plans, plan, 'from'
		Validator.is_empty Plans, plan, 'to'
		Validator.is_empty Plans, plan, 'categories'    
		if plan.isValid
      Plans.insert(_.omit(plan, ['messages']))
		plan