Template['plans/plans_item'].helpers
	plan_name: ->
  	@plan.name
    
	plan_description: ->
  	@plan.description
    
	plan_balance: ->
  	accounting.formatMoney(@plan.balance, '', 2)

	plan_from: ->
		moment(@plan.from).format('DD/MMM/YYYY')
		
	plan_to: ->
		moment(@plan.to).format('DD/MMM/YYYY')
		
	plan_selected: ->
		if @plan.selected == true
			'success'
      
Template['plans/plans_item'].events
	'click a.details': (evt) ->
		Meteor.call 'Plans.update_selected', @plan, (error, plan)->
			Meteor.Router.to("/plans/#{plan._id}/details");