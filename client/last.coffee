Meteor.Router.add
	'*': ->
		Meteor.Nav.setInactiveAll()
		Meteor.Nav.setActive('home_active')		
		'home/home'