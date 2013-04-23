Meteor.methods
	'Targets.update': (target, success, failure)->
		target = Validator.uniqueness(Targets, target, 'name')
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