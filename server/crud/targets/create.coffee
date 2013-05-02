Meteor.methods
	'Targets.create': (target, success, failure)->
		# TODO validations
		target.isValid = true
		Validator.uniqueness Targets, target, 'name'
		Validator.is_empty Targets, target, 'from'
		Validator.is_empty Targets, target, 'to'
		Validator.is_empty Targets, target, 'amount'
		Validator.is_empty Targets, target, 'categories'
		if target.isValid
			target.from = moment(target.from, 'DD/MM/YYYY').toDate()
			target.to = moment(target.to, 'DD/MM/YYYY').toDate()			
			Targets.insert(_.omit(target, ['messages']))
		target