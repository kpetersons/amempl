Template['targets/delete'].target= ->
	Session.get('deleteTarget')

Template['targets/delete'].rendered= ()->
	$(@lastNode).modal
		backdrop: 'static'
		keyboard: false	
    
Template['targets/delete'].events=
	'click button.delete': (event)->    			
    target = Session.get('deleteTarget')
    Meteor.call 'Targets.delete', {_id: target._id}, (error, target)->
      $('.modal.targets.delete').modal 'hide'
      Meteor.Router.to('/targets')
      Session.set('deleteTarget', target)
	'click button.cancel': (event)->    	
		$('.modal.targets.delete').modal 'hide'
		Meteor.Router.to('/targets');
    
Template['targets/delete'].helpers
	messages: ->
  	Session.get('deleteTarget').messages
        