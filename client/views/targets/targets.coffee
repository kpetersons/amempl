Meteor.subscribe("targets")
Template['targets/targets'].targets= ->	
	Targets.find()