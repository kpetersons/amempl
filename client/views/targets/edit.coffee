Template['targets/edit'].target= ->
	Session.get('editTarget')

Template['targets/edit'].rendered= ()->
	$(@lastNode).modal
		backdrop: 'static'
		keyboard: false	
    
Template['targets/edit'].events=
	'click button.save': (event)->    			
    target = Session.get('editTarget')
    Meteor.call 'Targets.update', {_id: target._id, name: $('#target_name').val(), description: $('#target_description').val(), categories: Session.get('targetCategories'), from: $('#target_from').val(), to: $('#target_to').val()}, (error, target)->
      if target.isValid
        $('.modal.targets.edit').modal 'hide'
        Meteor.Router.to('/targets');
      Session.set('editTarget', target)
	'click button.cancel': (event)->    	
		$('.modal.targets.edit').modal 'hide'
		Meteor.Router.to('/targets');
    
Template['targets/edit'].helpers
	messages: ->
  	Session.get('editTarget').messages
        