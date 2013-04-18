Meteor.subscribe("categories")
Template['categories/categories'].categories= ->	
	Categories.find()
  