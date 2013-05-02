Meteor.methods
	'TargetCategories.create': (targetCategory, success, failure)->
		# TODO validations
		targetCategory.isValid = true
		if targetCategory.isValid
			TargetCategories.insert(_.omit(targetCategory, ['messages']))
		targetCategory