Template['plans/plan_categories_item'].helpers
	plan_category_name: ->
		@plan_category.plan_category_name
	plan_category_planned: ->
		accounting.formatMoney(@plan_category.planned, '', 2)		
	plan_category_actual: ->
		accounting.formatMoney(@plan_category.actual, '', 2)				

	plan_category_selected: ->
		if @plan_category.selected == true
			'success'		
Template['plans/plan_categories_item'].events
	'click a.details': (evt) ->
		Meteor.call 'Plans.update_selected', @plan, (error, plan)->
			Meteor.Router.to("/plans/#{plan._id}/details");