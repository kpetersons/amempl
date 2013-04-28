Meteor.methods
	'PlanCategories.delete': (plan, success, failure)->
		Plans.remove(plan._id)
		plan