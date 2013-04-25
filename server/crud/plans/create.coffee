Meteor.methods
	'Plans.create': (plan, success, failure)->
		# TODO validations
		Validator.uniqueness Plans, plan, 'name'
		Validator.is_empty Plans, plan, 'from'
		Validator.is_empty Plans, plan, 'to'
		if plan.isValid
      Plans.insert(_.omit(plan, ['messages']))
		plan