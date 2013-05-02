unless Meteor.Nav
	Meteor.Nav = {}

Meteor.Nav.items=['home_active', 'accounts_active', 'categories_active', 'transactions_active', 'targets_active','plans_active']
Meteor.Nav.isActive= (item)->
	Session.get(item)
Meteor.Nav.setActive= (item)->
	Session.set(item, true)
Meteor.Nav.setInactiveAll= ()->
	_.each Meteor.Nav.items, (item) ->
		Session.set(item, false)