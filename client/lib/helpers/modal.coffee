Meteor.onModalSuccess= (domElement, targetRoute, shouldClose)->
	Meteor.Router.to targetRoute;
	if shouldClose
		$(domElement).modal 'hide'