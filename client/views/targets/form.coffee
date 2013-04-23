Template['targets/form'].destroyed= ()->
	Session.set('targetCategories', null)

Template['targets/form'].rendered= ()->
	_self = @
	$('#target_category').typeahead(
		source: (typeahead, query)->
			Categories.find().map (item) ->
				item.name
		updater: (item) ->
			categories = Session.get('targetCategories')
			categories ||= []
			categories.push(Categories.findOne(name: item))
			Session.set('targetCategories', categories)
			return
	)
	$('#target_from').datepicker().on('changeDate', (evt)->
		$('#target_from').datepicker('hide')
	)
	$('#target_to').datepicker().on('changeDate', (evt)->
		$('#target_to').datepicker('hide')
	)	
	
Template['targets/form'].events
	'click span.remove-category': (evt)->
		console.log evt.target, @target.categories
	
Template['targets/form'].helpers
  nameError: ->
    field = _.find(@target.messages, (field) ->
      field.name == 'name'
    )
    if field
      return 'error'		

  categoryError: ->
    field = _.find(@target.messages, (field) ->
      field.name == 'category_id'
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
		@target.from
	
	target_to: ->
		@target.to
		
	target_amount: ->
		accounting.formatMoney(@target.amount, '', 2)