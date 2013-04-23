Meteor.methods
	'Targets.create': (target, success, failure)->
		# TODO validations
		target = Validator.uniqueness(Targets, target, 'name')
		if target.isValid
      toSave = _.omit(target, ['messages'])
      _.extend toSave, createdAt: new Date()
			Targets.insert(toSave)
		target