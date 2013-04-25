Template['plans/delete'].plan= ->
	Session.get('deletePlan')

Template['plans/delete'].rendered= ()->
	$(@lastNode).modal
		backdrop: 'static'
		keyboard: false	
    
Template['plans/delete'].events=
	'click button.delete': (event)->    			
    plan = Session.get('deletePlan')
    Meteor.call 'Plans.delete', {_id: plan._id}, (error, plan)->
      $('.modal.plans.delete').modal 'hide'
      Meteor.Router.to('/plans')
      Session.set('deletePlan', plan)
	'click button.cancel': (event)->    	
		$('.modal.plans.delete').modal 'hide'
		Meteor.Router.to('/plans');
    
Template['plans/delete'].helpers
	messages: ->
  	Session.get('deletePlan').messages
        