Template['targets/targets_item'].helpers
	target_name: ->
  	@target.name
    
	target_description: ->
  	@target.description
    
	target_balance: ->
  	accounting.formatMoney(@target.balance, '', 2)
    
	target_selected: ->
		if @target.selected == true
			'success'
      
Template['targets/targets_item'].events
	'click a.default': (evt) ->
		Meteor.call 'Targets.update_default', @target, (error, target)-> return					
	'click a.details': (evt) ->
		Meteor.call 'Targets.update_selected', @target, (error, target)->
			Meteor.Router.to("/targets/#{target._id}/details");