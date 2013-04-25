Meteor.methods
	'Plans.delete': (plan, success, failure)->
		Plans.remove(plan._id)
		plan