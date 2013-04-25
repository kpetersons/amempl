Template['plans/form'].destroyed= ()->
	Session.set('planCategories', null)

Template['plans/form'].rendered= ()->
	_self = @
	$('#plan_category').typeahead(
		source: (typeahead, query)->
			categories = Categories.find().map (item) ->
				item.name
			selectedCategories = Session.get('planCategories')
			categories = _.reject(categories, (item)-> 
				found = _.find(selectedCategories, (sItem)->
					return sItem.name == item
				,@)
				if found
					return true
			,@)
			categories
		updater: (item) ->
			categories = Session.get('planCategories')
			categories ||= []
			categories.push(Categories.findOne(name: item))
			Session.set('planCategories', categories)
			return
	)
	$('#plan_from').datepicker().on('changeDate', (evt)->
		$('#plan_from').datepicker('hide')
	)
	$('#plan_to').datepicker().on('changeDate', (evt)->
		$('#plan_to').datepicker('hide')
	)	
	
Template['plans/form'].events
	'click span.remove-category': (evt)->
		categories = Session.get('planCategories')
		category_id = $(evt.target).attr('data-category')
		categories = _.reject(categories, (item)->
			item._id == category_id
		, @)
		Session.set('planCategories', categories)
	
Template['plans/form'].helpers
  nameError: ->
    field = _.find(@plan.messages, (field) ->
      field.name == 'name'
    )
    if field
      return 'error'		

  categoryError: ->
    field = _.find(@plan.messages, (field) ->
      field.name == 'categories'
    )
    if field
      return 'error'
				
  fromError: ->
    field = _.find(@plan.messages, (field) ->
      field.name == 'from'
    )
    if field
      return 'error'		
		
  toError: ->
    field = _.find(@plan.messages, (field) ->
      field.name == 'to'
    )
    if field
      return 'error'		
		
		
Template['plans/form'].helpers

	plan_name: ->
		@plan.name

	plan_categories: ->
		Session.get('planCategories')
	
	plan_category: ->
		_.extend({}, Plans.findOne(_id: @plan.category_id)).name		

	plan_from: ->
		@plan.from
	
	plan_to: ->
		@plan.to