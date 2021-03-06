Meteor.methods
	'Targets.update': (target, success, failure)->
		target.isValid = true
		Validator.uniqueness Targets, target, 'name'
		Validator.is_empty Targets, target, 'from'
		Validator.is_empty Targets, target, 'to'
		Validator.is_empty Targets, target, 'categories'
		if target.isValid
			target.from = moment(target.from, 'DD/MM/YYYY').toDate()
			target.to = moment(target.to, 'DD/MM/YYYY').toDate()						
			Targets.update(target._id, $set: _.omit(target, ['messages', '_id']))
			_.each target.categories, (item) ->
				targetCategory = TargetCategories.findOne category_id: item._id, target_id: target._id
				if targetCategory
					TargetCategories.update(targetCategory._id, $set: _.omit(item, ['name','description', 'isValid', 'type', 'messages', '_id']))
				else
					targetCategory = _.extend {}, 
						target_id: target._id
						category_id: item._id
						amount: item.amount
					TargetCategories.insert(targetCategory)
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