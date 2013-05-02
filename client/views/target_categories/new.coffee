Template['plans/new'].plan= ->
	Session.get('newPlan')

Template['plans/new'].rendered= ()->
	$(@lastNode).modal
		backdrop: 'static'
		keyboard: false	
    
Template['plans/new'].events=
	'click button.save': (event)->    			
    Meteor.call 'Plans.create', {name: $('#plan_name').val(), description: $('#plan_description').val(), categories: Session.get('planCategories'), from: $('#plan_from').val(), to: $('#plan_to').val()}, (error, plan)->						
      if plan.isValid
        $('.modal.plans.new').modal 'hide'
        Meteor.Router.to('/plans');
      Session.set('newPlan', plan)
	'click button.cancel': (event)->    	
		$('.modal.plans.new').modal 'hide'
		Meteor.Router.to('/plans');
    
Template['plans/new'].helpers
	messages: ->
  	Session.get('newPlan').messages
        