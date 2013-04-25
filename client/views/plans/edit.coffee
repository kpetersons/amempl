Template['plans/edit'].plan= ->
	Session.get('editPlan')

Template['plans/edit'].rendered= ()->
	$(@lastNode).modal
		backdrop: 'static'
		keyboard: false	
    
Template['plans/edit'].events=
	'click button.save': (event)->    			
    plan = Session.get('editPlan')
    Meteor.call 'Plans.update', {_id: plan._id, name: $('#plan_name').val(), description: $('#plan_description').val(), categories: Session.get('planCategories'), from: $('#plan_from').val(), to: $('#plan_to').val()}, (error, plan)->
      if plan.isValid
        $('.modal.plans.edit').modal 'hide'
        Meteor.Router.to('/plans');
      Session.set('editPlan', plan)
	'click button.cancel': (event)->    	
		$('.modal.plans.edit').modal 'hide'
		Meteor.Router.to('/plans');
    
Template['plans/edit'].helpers
	messages: ->
  	Session.get('editPlan').messages
        