Meteor.methods
	'Targets.update': (target, success, failure)->
		target.isValid = true
		Validator.uniqueness Targets, target, 'name'
		Validator.is_empty Targets, target, 'from'
		Validator.is_empty Targets, target, 'to'
		Validator.is_empty Targets, target, 'amount'
		Validator.is_empty Targets, target, 'categories'
		if target.isValid
			Targets.update(target._id, $set: _.omit(target, ['messages', '_id']))
		target
            
	'Targets.update_selected': (target)->
		Targets.update({}, {$set: {selected: false}}, {multi: true})
		Targets.update target._id, 
			$set:
				selected: true
		target
		
	'Targets.update_unselected': (target)->
		Targets.update({}, {$set: {selected: false}}, {multi: true})
		target		