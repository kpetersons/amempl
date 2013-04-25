Meteor.methods
	'PlansCategories.delete': (plan, success, failure)->
		Plans.remove(plan._id)
		plan