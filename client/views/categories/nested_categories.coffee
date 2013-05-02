Meteor.subscribe("categories")
Template['categories/nested_categories'].nested_categories= ->
	@categories