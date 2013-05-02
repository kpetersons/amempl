Template['targets/form'].destroyed= ()->
	Session.set('targetCategories', null)

Template['targets/form'].rendered= ()->
	_self = @
	$('#target_category').typeahead(
		source: (typeahead, query)->
			categories = Categories.find().fetch()
			selectedCategories = Session.get('targetCategories')
			categories = _.reject(categories, (item)-> 
				found = _.find(selectedCategories, (sItem)->
					return sItem.name == item.name
				,@)
				if found
					return true
			,@)
			_.pluck(categories, 'name')
		updater: (item) ->
			categories = Session.get('targetCategories')
			categories ||= []
			categories.push(Categories.findOne(name: item))
			Session.set('targetCategories', categories)
			return
	)
	$('#target_from').datepicker(format:'dd/mm/yyyy').on('changeDate', (evt)->
		$('#target_from').datepicker('hide')
	)
	$('#target_to').datepicker(format:'dd/mm/yyyy').on('changeDate', (evt)->
		$('#target_to').datepicker('hide')
	)	
	
Template['targets/form'].events
	'click span.remove-category': (evt)->
		categories = Session.get('targetCategories')
		category_id = $(evt.target).attr('data-category')
		categories = _.reject(categories, (item)->
			item._id == category_id
		, @)
		Session.set('targetCategories', categories)
	
Template['targets/form'].helpers
  nameError: ->
    field = _.find(@target.messages, (field) ->
      field.name == 'name'
    )
    if field
      return 'error'		

  categoryError: ->
    field = _.find(@target.messages, (field) ->
      field.name == 'categories'
    )
    if field
      return 'error'
		
  amountError: ->
    field = _.find(@target.messages, (field) ->
      field.name == 'amount'
    )
    if field
      return 'error'		
		
  fromError: ->
    field = _.find(@target.messages, (field) ->
      field.name == 'from'
    )
    if field
      return 'error'		
		
  toError: ->
    field = _.find(@target.messages, (field) ->
      field.name == 'to'
    )
    if field
      return 'error'		
		
		
Template['targets/form'].helpers

	target_name: ->
		@target.name

	target_categories: ->
		Session.get('targetCategories')
	
	target_category: ->
		_.extend({}, Targets.findOne(_id: @target.category_id)).name

	target_from: ->
		moment(@target.from).format('DD/MM/YYYY')
	
	target_to: ->
		moment(@target.to).format('DD/MM/YYYY')
		
	target_amount: ->
		accounting.formatMoney(@target.amount, '', 2)