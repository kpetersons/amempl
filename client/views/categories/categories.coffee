Meteor.subscribe("categories")
Template['categories/categories'].categories= ->	
	Categories.forUser(1, Categories.full_transform)
  