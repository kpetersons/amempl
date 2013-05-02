Meteor.methods
	'TargetCategories.delete': (targetCategory, success, failure)->
		TargetCategories.remove(targetCategory._id)
		targetCategory