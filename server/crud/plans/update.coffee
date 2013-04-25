Meteor.methods
	'Plans.update': (plan, success, failure)->
		# TODO validations
		Validator.uniqueness Plans, plan, 'name'
		Validator.is_empty Plans, plan, 'from'
		Validator.is_empty Plans, plan, 'to'
		Validator.is_empty Plans, plan, 'categories' 
		if plan.isValid
			Plans.update(plan._id, $set: _.omit(plan, ['messages', '_id']))
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