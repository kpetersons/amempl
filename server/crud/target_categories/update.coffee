Meteor.methods
	'TargetCategories.update': (targetCategory, success, failure)->
		targetCategory.isValid = true
		if targetCategory.isValid
			TargetCategories.update(targetCategory._id, $set: _.omit(targetCategory, ['messages', '_id']))
		targetCategory
    
	'TargetCategories.update_default': (targetCategory)->
		TargetCategories.update({}, {$set: {default: false}}, {multi: true})
		TargetCategories.update targetCategory._id, 
			$set:
				default: true
        
	'TargetCategories.update_selected': (targetCategory)->
		TargetCategories.update({}, {$set: {selected: false}}, {multi: true})
		TargetCategories.update targetCategory._id, 
			$set:
				selected: true
		targetCategory
		
	'TargetCategories.update_unselected': (targetCategory)->
		TargetCategories.update({}, {$set: {selected: false}}, {multi: true})
		targetCategory