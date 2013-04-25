Meteor.methods
	'Targets.delete': (target, success, failure)->
		Targets.remove(target._id)
		target