Template['nav'].helpers
	home_active_class: ->
		if Meteor.Nav.isActive('home_active') == true
			'active'
	accounts_active_class: ->
		if Meteor.Nav.isActive('accounts_active') == true
			'active'
	categories_active_class: ->
		if Meteor.Nav.isActive('categories_active') == true
			'active'
	transactions_active_class: ->
		if Meteor.Nav.isActive('transactions_active') == true
			'active'
	targets_active_class: ->
		if Meteor.Nav.isActive('targets_active') == true
			'active'
	plans_active_class: ->
		if Meteor.Nav.isActive('plans_active') == true
			'active'