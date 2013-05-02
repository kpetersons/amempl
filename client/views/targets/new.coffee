Template['targets/new'].target= ->
	Session.get('newTarget')

Template['targets/new'].rendered= ()->
	$(@lastNode).modal
		backdrop: 'static'
		keyboard: false	
    
Template['targets/new'].events=
	'click button.save': (event)->    			
    Meteor.call 'Targets.create', {name: $('#target_name').val(), description: $('#target_description').val(), categories: Session.get('targetCategories'), from: $('#target_from').val(), to: $('#target_to').val()}, (error, target)->						
      if target.isValid
        $('.modal.targets.new').modal 'hide'
        Meteor.Router.to('/targets');
      Session.set('newTarget', target)
	'click button.cancel': (event)->    	
		$('.modal.targets.new').modal 'hide'
		Meteor.Router.to('/targets');
    
Template['targets/new'].helpers
	messages: ->
  	Session.get('newTarget').messages
        