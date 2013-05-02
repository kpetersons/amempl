Meteor.subscribe("plans")
Template['plans/plans'].plans= ->	
	Plans.find()